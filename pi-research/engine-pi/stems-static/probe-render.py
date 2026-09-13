"""Private local renderer probe; reads session material from a separate local file."""
import os,subprocess,resource,struct,selectors,time,json,threading,math,array,sys,hashlib
from pathlib import Path
root=Path(__file__).resolve().parent
threads=int(sys.argv[1]) if len(sys.argv)>1 else 1
inputName=sys.argv[2] if len(sys.argv)>2 else 'input-3s.f32'
assert threads in (1,2,3)
success=False
alphabet='F3CE8MRGJ4KNPSHUVWQDTABY567L9X'
def encode(n):
 s=''
 while n:n,r=divmod(n,len(alphabet));s=alphabet[r]+s
 return s or alphabet[0]
def decode(s):
 n=0
 for c in s:n=n*len(alphabet)+alphabet.index(c)
 return n
def answer(n):
 k=struct.unpack('<4I',(root/'session-material.private').read_bytes());a=n&0xffffffff;b=n>>32;s=0
 for _ in range(32):
  a=(a+((((b<<4)^(b>>5))+b)^(s+k[s&3])))&0xffffffff
  s=(s+0x9e3779b9)&0xffffffff
  b=(b+((((a<<4)^(a>>5))+a)^(s+k[(s>>11)&3])))&0xffffffff
 return a|(b<<32)
def limits():
 resource.setrlimit(resource.RLIMIT_AS,(2*1024**3,2*1024**3));resource.setrlimit(resource.RLIMIT_CPU,(75,75));resource.setrlimit(resource.RLIMIT_CORE,(0,0));os.nice(15)
start=time.monotonic();p=subprocess.Popen([str(root/'stems-processor'),'--stem','--parentVersion','1.4.0'],stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,preexec_fn=limits)
sel=selectors.DefaultSelector();sel.register(p.stdout,selectors.EVENT_READ);buf=b'';blocks=[]
def block(timeout):
 global buf
 end=time.monotonic()+timeout
 while b'\n\n' not in buf:
  if not sel.select(max(0,end-time.monotonic())):raise TimeoutError('parameter response timeout')
  x=os.read(p.stdout.fileno(),4096)
  if not x:raise EOFError('processor closed output')
  buf+=x
 result,buf=buf.split(b'\n\n',1)
 return dict(line.decode().split('=',1) for line in result.splitlines())
try:
 first=block(3);assert first.get('preparing')=='initialising',first
 response=encode(answer(decode(first['session'])))
 params={'numChannels':2,'sampleRate':44100,'maxBlockSize':512,'highQuality':0,'residual':0,'numThreads':threads,'session':response}
 p.stdin.write((''.join(f'{k}={v}\n' for k,v in params.items())+'\n').encode());p.stdin.flush()
 for _ in range(5):
  second=block(25);blocks.append(second);print(json.dumps({'response':second,'seconds':time.monotonic()-start}),flush=True)
  if second.get('preparing') != 'started': break
 assert second.get('preparing')=='done',second
 audio=array.array('f');audio.frombytes((root/inputName).read_bytes());n=len(audio)//2
 renderStart=time.monotonic()
 def feed():
  try:
   for at in range(0,n,512):
    count=min(512,n-at)
    p.stdin.write(f'action=block\nnumSamples={count}\n\n'.encode())
    for ch in (0,1):p.stdin.write(array.array('f',audio[2*at+ch:2*(at+count):2]).tobytes())
   p.stdin.write(b'action=finish\nnumSamples=0\n\n');p.stdin.flush();p.stdin.close()
  except (BrokenPipeError,ValueError):pass
 threading.Thread(target=feed,daemon=True).start()
 firstAudio=None
 timeline=[]
 frames=0;peaks=[0.0]*8;energy=[0.0]*8;headers=[]
 def exact(n):
  global buf
  end=time.monotonic()+45
  while len(buf)<n:
   if not sel.select(max(0,end-time.monotonic())):raise TimeoutError('audio response timeout')
   x=os.read(p.stdout.fileno(),65536)
   if not x:raise EOFError('short audio')
   buf+=x
  result,buf=buf[:n],buf[n:];return result
 while True:
  try:h=block(45)
  except EOFError:break
  if 'returnFrames' not in h:
   headers.append(h);continue
  count=int(h['returnFrames']);assert 0<=count<=441000,count
  raw=exact(count*8*4)
  if count and firstAudio is None:firstAudio=time.monotonic()-renderStart
  out=array.array('f');out.frombytes(raw)
  for ch in range(8):
   vals=out[ch*count:(ch+1)*count];assert all(math.isfinite(v) for v in vals)
   peaks[ch]=max(peaks[ch],max((abs(v) for v in vals),default=0));energy[ch]+=sum(v*v for v in vals)
  frames+=count
  if count:timeline.append([frames,time.monotonic()-renderStart])
 assert frames==n and {'done':'true'} in headers,(frames,n,headers)
 success=True
 print(json.dumps({'outputTimeline':timeline,'threads':threads,'inputSHA256':hashlib.sha256((root/inputName).read_bytes()).hexdigest(),'firstAudioSeconds':firstAudio,'inputFrames':n,'outputFrames':frames,'renderSeconds':time.monotonic()-renderStart,'peaks':peaks,'energy':energy,'terminalHeaders':headers}),flush=True)
except Exception as e:print(json.dumps({'error':str(e),'seconds':time.monotonic()-start}),flush=True)
finally:
 if not p.stdin.closed:p.stdin.close()
 try:p.wait(timeout=3)
 except subprocess.TimeoutExpired:p.kill();p.wait()
 print(json.dumps({'exit':p.returncode,'stderr':p.stderr.read(4000).decode(errors='replace'),'maxRssKiB':resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss}),flush=True)

if not success or p.returncode!=0:sys.exit(1)
