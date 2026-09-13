from pathlib import Path
import numpy as np,json,struct,hashlib
root=Path(__file__).resolve().parent
b=(root.parent/'engine-desktop-test/private-capture/stdout-988.private').read_bytes();i=0;chunks=[];nch=0;headers=0;done=False
while i<len(b):
 end=b.find(b'\n\n',i);assert end>=0,'partial header'
 d=dict(x.decode().split('=',1) for x in b[i:end].splitlines());i=end+2;headers+=1
 if 'numReturnChannels' in d:nch=int(d['numReturnChannels'])
 n=int(d.get('returnFrames','0'))
 if n:
  size=n*nch*4;assert i+size<=len(b),'partial audio';chunks.append(np.frombuffer(b,dtype='<f4',count=n*nch,offset=i).reshape(nch,n).T.copy());i+=size
 if d.get('done')=='true':done=True
ref=np.concatenate(chunks);assert np.isfinite(ref).all();assert done
out=root/'reference';out.mkdir(exist_ok=True)
def wav(path,a):
 data=np.ascontiguousarray(a,dtype='<f4').tobytes();ch=a.shape[1];fmt=struct.pack('<HHIIHH',3,ch,44100,44100*ch*4,ch*4,32);body=b'fmt '+struct.pack('<I',16)+fmt+b'data'+struct.pack('<I',len(data))+data;path.write_bytes(b'RIFF'+struct.pack('<I',len(body)+4)+b'WAVE'+body)
def readwav(p):
 b=p.read_bytes();i=12
 while i<len(b):
  k,n=struct.unpack_from('<4sI',b,i);i+=8
  if k==b'data':return np.frombuffer(b[i:i+n],'<f4').reshape(-1,2)
  i+=n+(n%2)
 raise ValueError('no data')
base=root/'candidate';candidate=np.concatenate([readwav(base/f'stem-{s}.wav') for s in range(4)],axis=1)
result={'reference':'Original Windows worker launched by Engine DJ Desktop 5.1.0 through tee wrapper','reference_frames':len(ref),'candidate_frames':len(candidate),'channels':nch,'headers':headers,'done':done,'reference_sha256':hashlib.sha256(ref.tobytes()).hexdigest(),'comparisons':[]}
for s in range(4):wav(out/f'engine-stem-{s}.wav',ref[:,s*2:s*2+2])
if ref.shape==candidate.shape:
 a=ref.astype('float64');c=candidate.astype('float64');diff=c-a
 for s in range(4):
  x=a[:,2*s:2*s+2];y=c[:,2*s:2*s+2];e=y-x
  result['comparisons'].append({'stem_index':s,'reference_rms':float(np.sqrt(np.mean(x*x))),'candidate_rms':float(np.sqrt(np.mean(y*y))),'error_rms':float(np.sqrt(np.mean(e*e))),'max_abs_error':float(abs(e).max()),'correlation':float(np.corrcoef(x.ravel(),y.ravel())[0,1]),'snr_db':float(10*np.log10(np.sum(x*x)/np.sum(e*e)))})
  wav(out/f'difference-{s}.wav',e)
 result['stereo_pair_correlation_matrix']=[[float(np.corrcoef(a[:,s*2:s*2+2].ravel(),c[:,t*2:t*2+2].ravel())[0,1]) for t in range(4)] for s in range(4)]
(root/'comparison.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
