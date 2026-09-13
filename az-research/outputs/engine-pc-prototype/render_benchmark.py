#!/usr/bin/env python3
"""Research reconstruction, NOT an Engine-equivalent implementation.
Requires numpy and onnxruntime. CPU only. No bundled model or private keys.
"""
import argparse, hashlib, json, math, os, platform, resource, struct, time
from pathlib import Path
import numpy as np
N,H,F,K=4096,1024,128,2048
B,L=H*F,N-H

def window():
    x=np.arange(N,dtype=np.float32)
    return np.float32(.5)*(np.float32(1)-np.cos((x+np.float32(1))*np.float32(2*np.pi)/np.float32(N+1)))

class Pipeline:
    def __init__(self, channels):
        self.c=channels;self.w=window()
        self.history=np.zeros((channels,L),np.float32)
        self.acc=None;self.norm=np.zeros(N,np.float32)
    def analyze(self,block):
        x=np.concatenate((self.history,block.T),axis=1)
        self.history=x[:,-L:].copy()
        frames=np.lib.stride_tricks.sliding_window_view(x,N,axis=1)[:,::H,:]
        z=np.fft.rfft(frames*self.w,axis=-1)
        return z
    def synthesize(self,z):
        # np.irfft supplies inverse 1/N normalization; do not divide twice.
        frames=np.fft.irfft(z,n=N,axis=-1).astype(np.float32)
        if self.acc is None:self.acc=np.zeros((frames.shape[0],N),np.float32)
        out=np.empty((B,frames.shape[0]),np.float32)
        ww=self.w*self.w
        for f in range(F):
            self.norm+=ww
            self.acc+=frames[:,f,:]*self.w
            out[f*H:(f+1)*H]=(self.acc[:,:H]/self.norm[:H]).T
            self.acc[:,:L]=self.acc[:,H:].copy();self.acc[:,L:]=0
            self.norm[:L]=self.norm[H:].copy();self.norm[L:]=0
        return out
    def masks_to_spectrum(self,z,masks):
        mag=np.sqrt(z.real[...,:K]**2+z.imag[...,:K]**2).astype(np.float32)
        phase=np.arctan2(z.imag[...,:K],z.real[...,:K]).astype(np.float32)
        # Model always has two channels; mono discards the second predicted channel.
        est=masks.reshape(4,2,F,K)[:,:self.c]*mag[None]
        eps=np.float32(np.finfo(np.float32).eps)
        d=(mag[None]-est)**2+eps
        xi=est**2/d;g=mag[None]**2/d
        v=g*(xi/(np.float32(1)+xi))
        gain=np.sqrt(v*v+np.float32(.7212)*v)/(g+eps)
        est*=gain
        if not np.isfinite(est).all():raise ValueError('Nonfinite postprocessing; stopping')
        p=phase.astype(np.float64)
        spec=np.zeros((4,self.c,F,K+1),np.complex64)
        spec.real[...,:K]=(est.astype(np.float64)*np.cos(p)[None]).astype(np.float32)
        spec.imag[...,:K]=(est.astype(np.float64)*np.sin(p)[None]).astype(np.float32)
        spec.imag[...,0]=0
        return spec.reshape(4*self.c,F,K+1)

def blocks(x):
    for start in range(0,len(x)+L,B):
        block=np.zeros((B,x.shape[1]),np.float32)
        count=max(0,min(B,len(x)-start));block[:count]=x[start:start+count]
        yield start,block

def self_test():
    # Full-spectrum unity reconstruction isolates padding/history/OLA from ONNX and EM.
    records=[]
    for length in [1,H-1,B-L+1,B,B+130000]:
        rng=np.random.default_rng(length);x=rng.normal(0,.1,(length,2)).astype(np.float32)
        p=Pipeline(2);raw=np.concatenate([p.synthesize(p.analyze(b)) for _,b in blocks(x)])
        y=raw[L:L+length];err=float(np.max(np.abs(y-x)))
        assert y.shape==x.shape and err<2e-6,(length,err)
        records.append({'frames':length,'max_abs_identity_error':err})
    p=Pipeline(2);z=p.analyze(np.zeros((B,2),np.float32))
    s=p.masks_to_spectrum(z,np.full((1,8,F,K),.5,np.float32))
    assert np.count_nonzero(s)==0
    return {'passed':True,'tests':records,'silence_postfilter_exact_zero':True,'limit':'Tests reconstructed framing/OLA and silence, not Engine equivalence or stem quality'}

class FloatWav:
    def __init__(self,path,channels,frames):
        size=frames*channels*4
        if size+48>=2**32:raise ValueError('WAV exceeds RIFF size limit')
        self.f=open(path,'wb');self.written=0;self.expected=size
        self.f.write(b'RIFF'+struct.pack('<I',size+48)+b'WAVEfmt '+struct.pack('<IHHIIHH',16,3,channels,44100,44100*channels*4,channels*4,32)+b'fact'+struct.pack('<II',4,frames)+b'data'+struct.pack('<I',size))
    def write(self,x):
        a=np.ascontiguousarray(x,dtype='<f4').tobytes();self.f.write(a);self.written+=len(a)
    def close(self):
        self.f.close()
        if self.written!=self.expected:raise ValueError('Incomplete render; WAV must not be treated as valid')

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--model',type=Path);ap.add_argument('--input-f32',type=Path)
    ap.add_argument('--channels',type=int,choices=[1,2],default=2)
    ap.add_argument('--threads',type=int,default=4);ap.add_argument('--output',type=Path,required=True)
    ap.add_argument('--self-test',action='store_true');a=ap.parse_args()
    os.umask(0o077);a.output.mkdir(parents=True,exist_ok=True)
    if a.self_test:
        r=self_test();(a.output/'self-test.json').write_text(json.dumps(r,indent=2));print(json.dumps(r));return
    if not a.model or not a.input_f32 or a.threads<1:ap.error('model, input and positive threads required')
    x=np.fromfile(a.input_f32,dtype='<f4')
    if x.size%a.channels:raise ValueError('Input is not whole interleaved frames')
    x=x.reshape(-1,a.channels)
    if not len(x) or not np.isfinite(x).all():raise ValueError('Empty or nonfinite input')
    import onnxruntime as ort
    so=ort.SessionOptions();so.intra_op_num_threads=a.threads;so.inter_op_num_threads=1
    so.execution_mode=ort.ExecutionMode.ORT_SEQUENTIAL;so.graph_optimization_level=ort.GraphOptimizationLevel.ORT_ENABLE_ALL
    wall=time.perf_counter();cpu=time.process_time()
    t=time.perf_counter();session=ort.InferenceSession(str(a.model),so,providers=['CPUExecutionProvider']);init=time.perf_counter()-t
    assert session.get_inputs()[0].shape==[1,2,F,K]
    p=Pipeline(a.channels);writers=[FloatWav(a.output/f'stem-{i}.wav',a.channels,len(x)) for i in range(4)]
    residual=FloatWav(a.output/'residual.wav',a.channels,len(x))
    source=FloatWav(a.output/'input.wav',a.channels,len(x));source.write(x);source.close()
    timing=[];peaks=np.zeros(5);energy=np.zeros(5);written=0;first=None
    render_start=time.perf_counter()
    for start,block in blocks(x):
        t=time.perf_counter();z=p.analyze(block)
        mag=np.sqrt(z.real[...,:K]**2+z.imag[...,:K]**2).astype(np.float32)
        if a.channels==1:mag=np.repeat(mag,2,axis=0)
        tensor=np.ascontiguousarray(mag[None]);front=time.perf_counter()-t
        t=time.perf_counter();masks=session.run(None,{'input':tensor})[0];infer=time.perf_counter()-t
        t=time.perf_counter();raw=p.synthesize(p.masks_to_spectrum(z,masks));post=time.perf_counter()-t
        lo=max(0,L-start);hi=min(B,len(x)+L-start)
        t=time.perf_counter()
        if hi>lo:
            stems=raw[lo:hi].reshape(-1,4,a.channels)
            if not np.isfinite(stems).all():raise ValueError('Nonfinite output')
            res=x[written:written+len(stems)]-np.sum(stems,axis=1,dtype=np.float32)
            for i,f in enumerate(writers):
                f.write(stems[:,i]);peaks[i]=max(peaks[i],float(np.abs(stems[:,i]).max()));energy[i]+=np.sum(stems[:,i].astype(np.float64)**2)
            residual.write(res);peaks[4]=max(peaks[4],float(np.abs(res).max()));energy[4]+=np.sum(res.astype(np.float64)**2)
            written+=len(stems)
            if first is None:first=time.perf_counter()-wall
        timing.append({'block':start//B,'frontend_s':front,'inference_s':infer,'post_s':post,'write_s':time.perf_counter()-t})
    for f in writers+[residual]:f.close()
    assert written==len(x)
    end=time.perf_counter();cpu_used=time.process_time()-cpu;duration=len(x)/44100
    r={'status':'EXPERIMENTAL_RENDER_NOT_ENGINE_VALIDATED','frames':len(x),'channels_per_stem':a.channels,'sample_rate':44100,'audio_seconds':duration,'threads':a.threads,'machine':platform.machine(),'platform':platform.platform(),'numpy':np.__version__,'onnxruntime':ort.__version__,'providers':session.get_providers(),'initialization_seconds':init,'render_seconds':end-render_start,'total_seconds':end-wall,'render_realtime_factor':(end-render_start)/duration,'total_realtime_factor':(end-wall)/duration,'audio_seconds_per_render_second':duration/(end-render_start),'first_output_seconds_including_init':first,'process_cpu_seconds':cpu_used,'average_cores_used':cpu_used/(end-wall),'peak_process_rss_mib':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss/(1024 if platform.system()=='Linux' else 1024**2),'stem_peaks':peaks.tolist(),'stem_rms':np.sqrt(energy/(len(x)*a.channels)).tolist(),'block_times':timing,'input_sha256':hashlib.sha256(a.input_f32.read_bytes()).hexdigest(),'model_sha256':hashlib.sha256(a.model.read_bytes()).hexdigest(),'limitations':['No paired original Engine PCM or listening acceptance','NumPy FFT and IEEE division replace pffft and ARM reciprocal refinements','FP32 model, optimized desktop ORT; not original ARM runtime','Stem labels unknown; use numerical indices','File-render throughput, not live DJ latency or Pi performance','Residual is input minus reconstructed stems; it is not an independent quality reference']}
    (a.output/'benchmark.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
if __name__=='__main__':main()
