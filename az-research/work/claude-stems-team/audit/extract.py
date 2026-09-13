# usage: extract.py <hexaddr> [...]  -> writes fn-<addr>.txt with literal/const annotations
import sys,re,struct,subprocess
A='/home/subsect/Documents/Codex/2026-09-10/so/work/claude-stems-team/audit'
P='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static/processor/stems-processor'
# segment map
segs=[]
for l in subprocess.run(['readelf','-lW',P],capture_output=True,text=True).stdout.splitlines():
    f=l.split()
    if f and f[0]=='LOAD': segs.append((int(f[2],16),int(f[1],16),int(f[4],16)))
fh=open(P,'rb')
def rd(va,n):
    for v,o,sz in segs:
        if v<=va<v+sz: fh.seek(o+va-v); return fh.read(n)
lines=open(A+'/10-proc-full.txt').read().splitlines()
for a in sys.argv[1:]:
    key=a.lower().rjust(16,'0')+' <'
    i=next(k for k,l in enumerate(lines) if l.startswith(key))
    out=[lines[i]]; pages={}; reg={}
    for l in lines[i+1:]:
        if re.match(r'^[0-9a-f]{16} <',l): break
        m=re.match(r'\s*([0-9a-f]+):\s+(\w+)\s*(.*)',l)
        note=''
        if m:
            op,args=m.group(2),m.group(3)
            mm=re.match(r'x(\d+), 0x([0-9a-f]+)',args)
            if op=='adrp' and mm: pages[mm.group(1)]=int(mm.group(2),16)
            mm=re.match(r'([sdqxw])(\d+), \[x(\d+), #0x([0-9a-f]+)\]$',args)
            if op=='ldr' and mm and mm.group(3) in pages:
                va=pages[mm.group(3)]+int(mm.group(4),16); t=mm.group(1)
                b=rd(va,16)
                if b:
                    if t=='s': note=' ; =%r f32'%struct.unpack('<f',b[:4])
                    elif t=='d': note=' ; =%r f64'%struct.unpack('<d',b[:8])
                    elif t=='q': note=' ; =%s u32x4 %s f32x4'%(struct.unpack('<4I',b),tuple(round(x,6) for x in struct.unpack('<4f',b)))
                    else: note=' ; @%x'%va
            mm=re.match(r'w(\d+), #0x([0-9a-f]+)(, lsl #(\d+))?',args)
            if op in('mov','movk') and mm:
                r=mm.group(1); v=int(mm.group(2),16)<<int(mm.group(4) or 0)
                reg[r]=(reg.get(r,0) & ~(0xffff<<int(mm.group(4) or 0)) | v) if op=='movk' else v
                if op=='movk': note=' ; w%s=0x%x =%r f32'%(r,reg[r],struct.unpack('<f',struct.pack('<I',reg[r]&0xffffffff))[0])
        out.append(l.replace('\t',' ')+note)
    open(A+'/fn-%s.txt'%a,'w').write('\n'.join(out)+'\n'); print(a,len(out))
