import argparse,time,json,os
import numpy as np
import onnxruntime as ort
p=argparse.ArgumentParser();p.add_argument('--threads',type=int,default=2);p.add_argument('--opt',default='all');p.add_argument('--gpu',action='store_true');p.add_argument('--reps',type=int,default=5);a=p.parse_args()
model='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static/processor/model.private.onnx'
name=('gpu' if a.gpu else 'cpu')+f'-{a.threads}-{a.opt}'
so=ort.SessionOptions();so.intra_op_num_threads=a.threads;so.inter_op_num_threads=1
so.graph_optimization_level={'none':ort.GraphOptimizationLevel.ORT_DISABLE_ALL,'basic':ort.GraphOptimizationLevel.ORT_ENABLE_BASIC,'all':ort.GraphOptimizationLevel.ORT_ENABLE_ALL}[a.opt]
providers=['CPUExecutionProvider']
if a.gpu:
 ort.preload_dlls(directory='')
 providers=[('CUDAExecutionProvider',{'use_tf32':'0','cudnn_conv_algo_search':'HEURISTIC','gpu_mem_limit':str(6*1024**3)}),'CPUExecutionProvider']
t=time.perf_counter();s=ort.InferenceSession(model,so,providers=providers);init=time.perf_counter()-t
if a.gpu: assert s.get_providers()[0]=='CUDAExecutionProvider',s.get_providers()
rng=np.random.default_rng(42);x=np.ascontiguousarray(rng.random((1,2,128,2048),dtype=np.float32))
t=time.perf_counter();y=s.run(None,{'input':x})[0];cold=time.perf_counter()-t
samples=[]
for _ in range(a.reps):
 t=time.perf_counter();y=s.run(None,{'input':x})[0];samples.append(time.perf_counter()-t)
np.save('work/'+name+'.npy',y)
r={'name':name,'runtime':ort.__version__,'providers':s.get_providers(),'provider_options':s.get_provider_options(),'initialization_seconds':init,'first_run_seconds':cold,'warm_seconds':samples,'median_seconds':float(np.median(samples)),'finite':bool(np.isfinite(y).all()),'output_range':[float(y.min()),float(y.max())],'input':'seed42 uniform random [0,1), synthetic tensor, NOT real audio frontend'}
ref='work/cpu-2-none.npy'
if os.path.exists(ref):
 b=np.load(ref);d=y.astype(np.float64)-b;r['vs_unoptimized_fp32']={'max_abs':float(np.abs(d).max()),'rms':float(np.sqrt(np.mean(d*d))),'relative_l2':float(np.linalg.norm(d)/np.linalg.norm(b)),'exact_equal':bool(np.array_equal(y,b))}
open('outputs/'+name+'.json','w').write(json.dumps(r,indent=2));print(json.dumps(r),flush=True)
