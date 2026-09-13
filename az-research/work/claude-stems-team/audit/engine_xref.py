# Find ADRP+ADD/ADRP+LDR-literal references to given virtual addresses in Engine .text (read-only).
import sys,struct,subprocess
E=sys.argv[1]; targets={int(a,16) for a in sys.argv[2:]}
segs=[]
for l in subprocess.run(['readelf','-lW',E],capture_output=True,text=True).stdout.splitlines():
    f=l.split()
    if f and f[0]=='LOAD': segs.append((int(f[1],16),int(f[2],16),int(f[4],16),f[-2] if len(f)>7 else ''))
sec=[l.split() for l in subprocess.run(['readelf','-SW',E],capture_output=True,text=True).stdout.splitlines() if '.text' in l]
t=sec[0]; i=t.index('.text'); va=int(t[i+2],16); off=int(t[i+3],16); size=int(t[i+4],16)
data=open(E,'rb').read()
code=data[off:off+size]
adrp={}
for pos in range(0,len(code)-4,4):
    ins=struct.unpack_from('<I',code,pos)[0]; pc=va+pos
    if (ins & 0x9f000000)==0x90000000:
        rd=ins&31; immlo=(ins>>29)&3; immhi=(ins>>5)&0x7ffff; imm=(immhi<<2)|immlo
        if imm&(1<<20): imm-=1<<21
        adrp[rd]=((pc&~0xfff)+(imm<<12),pc)
    elif (ins & 0xffc00000)==0x91000000:  # add x,x,#imm
        rn=(ins>>5)&31; rd=ins&31; imm=(ins>>10)&0xfff
        if rn in adrp and pc-adrp[rn][1]<64:
            tgt=adrp[rn][0]+imm
            if tgt in targets: print(hex(tgt),'ref at',hex(pc))
