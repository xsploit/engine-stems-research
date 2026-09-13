"""Private local renderer probe; reads session material from a separate local file."""
import os,subprocess,resource,struct,selectors,time,json
from pathlib import Path
root=Path(__file__).resolve().parent
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
 resource.setrlimit(resource.RLIMIT_AS,(1100*1024**2,1100*1024**2));resource.setrlimit(resource.RLIMIT_CPU,(20,20));resource.setrlimit(resource.RLIMIT_CORE,(0,0));os.nice(15)
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
 params={'numChannels':2,'sampleRate':44100,'maxBlockSize':512,'highQuality':0,'residual':0,'numThreads':1,'session':response}
 p.stdin.write((''.join(f'{k}={v}\n' for k,v in params.items())+'\n').encode());p.stdin.flush()
 for _ in range(5):
  second=block(25);blocks.append(second);print(json.dumps({'response':second,'seconds':time.monotonic()-start}),flush=True)
  if second.get('preparing') != 'started': break
except Exception as e:print(json.dumps({'error':str(e),'seconds':time.monotonic()-start}),flush=True)
finally:
 p.stdin.close()
 try:p.wait(timeout=3)
 except subprocess.TimeoutExpired:p.kill();p.wait()
 print(json.dumps({'exit':p.returncode,'stderr':p.stderr.read(4000).decode(errors='replace'),'maxRssKiB':resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss}),flush=True)
