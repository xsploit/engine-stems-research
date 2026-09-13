import os,time,json,subprocess,pathlib,re
root=pathlib.Path('/home/pompu_5/engine-pi-lab/stems-probe-20260911');pid=159449
fifo=f'/proc/{pid}/root/tmp/engine-midi';status=pathlib.Path('/proc/asound/card2/pcm0p/sub0/status');log=root.parent/'native116.log'
assert pathlib.Path(f'/proc/{pid}/exe').exists()
def send(s):
 f=os.open(fifo,os.O_WRONLY|os.O_NONBLOCK)
 try:os.write(f,(s+'\n').encode())
 finally:os.close(f)
 time.sleep(.3)
def audio():
 return json.loads(subprocess.check_output(['python3',str(root.parent/'audio-dma-probe.py')],timeout=8))
r={'before':audio(),'statusBefore':status.read_text(),'samples':[]}
assert not any(r['before']['rms']),'Expected paused audio baseline'
startOffset=log.stat().st_size
try:
 send('press 4 0x01');r['playingBeforeRender']=audio();assert any(r['playingBeforeRender']['rms'])
 cmd=['systemd-run','--quiet','--wait','--pipe','--collect','-p','MemoryMax=1100M','-p','MemorySwapMax=0','-p','CPUQuota=200%','-p','Nice=15','-p','RuntimeMaxSec=90','-p','User=pompu_5','python3',str(root/'probe-render.py'),'2','input-12s.f32']
 with (root/'with-playback-render.jsonl').open('w') as out:
  p=subprocess.Popen(cmd,stdout=out,stderr=subprocess.STDOUT);start=time.monotonic()
  while p.poll() is None:
   t=status.read_text();values=dict(re.findall(r'^(state|trigger_time|hw_ptr|appl_ptr|avail_max)\s*:\s*(.*)$',t,re.M))
   r['samples'].append({'seconds':time.monotonic()-start,**values});time.sleep(.05)
  r['renderExit']=p.returncode
 r['playingAfterRender']=audio()
finally:
 send('press 4 0x02');r['stopped']=audio()
 with log.open() as f:f.seek(startOffset);r['engineLogDuring']=f.read()
 r['backlight']=pathlib.Path('/sys/class/backlight/panel_backlight@1/brightness').read_text().strip()
 (root/'with-playback-status.json').write_text(json.dumps(r,indent=2))
print(json.dumps({'renderExit':r.get('renderExit'),'statusSamples':len(r['samples']),'states':sorted({x.get('state','missing') for x in r['samples']}),'triggerTimes':sorted({x.get('trigger_time','missing') for x in r['samples']}),'playingBeforeRender':r.get('playingBeforeRender'),'playingAfterRender':r.get('playingAfterRender'),'stopped':r['stopped'],'backlight':r['backlight']},indent=2))
