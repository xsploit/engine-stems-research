# engine_dis.py START STOP OUTFILE : narrow disassembly of Engine with ADRP+ADD string annotation (read-only)
import sys,re,subprocess
E='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/reverse/Engine'
s,e,out=sys.argv[1],sys.argv[2],sys.argv[3]
txt=subprocess.run(['llvm-objdump','-d','--no-show-raw-insn','--start-address='+s,'--stop-address='+e,E],capture_output=True,text=True).stdout
b=open(E,'rb').read(); pages={}; res=[]
for l in txt.splitlines():
    m=re.match(r'\s*([0-9a-f]+):\s+(\w+)\s*(.*)',l)
    if not m: continue
    op,args=m.group(2),re.sub(r' <[^>]*>','',m.group(3)).strip(); note=''
    mm=re.match(r'x(\d+), 0x([0-9a-f]+)',args)
    if op=='adrp' and mm: pages[mm.group(1)]=int(mm.group(2),16); continue
    mm=re.match(r'x(\d+), x(\d+), #0x([0-9a-f]+)',args)
    if op=='add' and mm and mm.group(2) in pages:
        t=pages[mm.group(2)]+int(mm.group(3),16)
        if t<0x2a63678:
            st=b[t:t+48].split(b'\0')[0]
            if len(st)>=3 and all(32<=c<127 for c in st): note='  ; "%s"'%st.decode()
    if op in ('paciasp','autiasp','bti','nop'): continue
    res.append('%s %s %s%s'%(m.group(1),op,args[:48],note))
open(out,'w').write('\n'.join(res)+'\n'); print(out,len(res))
