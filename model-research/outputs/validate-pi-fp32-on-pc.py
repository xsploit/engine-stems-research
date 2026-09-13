import json,time,os,collections
from pathlib import Path
import numpy as np
import onnxruntime as ort
src='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static/processor/model.private.onnx'
models={'original':src,'portable-fused':'work/candidates/portable-fused.private.onnx'}
sessions={};init={}
for name,path in models.items():
 o=ort.SessionOptions();o.intra_op_num_threads=2;o.inter_op_num_threads=1;o.graph_optimization_level=ort.GraphOptimizationLevel.ORT_ENABLE_ALL
 t=time.perf_counter();sessions[name]=ort.InferenceSession(path,o,providers=['CPUExecutionProvider']);init[name]=time.perf_counter()-t
rng=np.random.default_rng(123);shape=(1,2,128,2048)
inputs={'silence':np.zeros(shape,np.float32),'uniform':rng.random(shape,dtype=np.float32),'quiet':rng.random(shape,dtype=np.float32)*1e-4,'wide_dynamic_range':np.exp(rng.uniform(-12,5,shape)).astype(np.float32)}
pcm=np.fromfile('/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static/input-30s.f32',np.float32).reshape(-1,2)
window=np.hanning(4096)
for i,start in enumerate([0,400000,800000]):
 frames=np.stack([pcm[start+j*1024:start+j*1024+4096].T*window for j in range(128)],axis=1)
 inputs['music_proxy_'+str(i)]=np.abs(np.fft.rfft(frames,axis=-1)[...,:2048]).astype(np.float32)[None]
rows={}
for label,x in inputs.items():
 b=sessions['original'].run(None,{'input':x})[0];y=sessions['portable-fused'].run(None,{'input':x})[0];d=y.astype(np.float64)-b
 rows[label]={'finite':bool(np.isfinite(y).all()),'exact_equal':bool(np.array_equal(b,y)),'max_abs':float(np.abs(d).max()),'rms':float(np.sqrt(np.mean(d*d))),'relative_l2':float(np.linalg.norm(d)/max(float(np.linalg.norm(b)),1e-30))}
x=inputs['uniform'];times={name:[] for name in models}
for i in range(10):
 for name in list(models)[::1 if i%2==0 else -1]:
  t=time.perf_counter();sessions[name].run(None,{'input':x});times[name].append(time.perf_counter()-t)
r={'runtime':ort.__version__,'hardware':'desktop i5-13600K, CPU two threads; NOT Pi','initialization_seconds':init,'validation':rows,'input_notes':'Music proxies are Hann4096/hop1024 magnitude FFT examples from local audio, NOT verified Engine frontend tensors. No PCM quality claim.','warm_seconds':times,'median_seconds':{k:float(np.median(v)) for k,v in times.items()}}
Path('outputs/pc-portable-validation.json').write_text(json.dumps(r,indent=2));print(json.dumps(r),flush=True)
