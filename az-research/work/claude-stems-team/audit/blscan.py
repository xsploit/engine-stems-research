import struct,sys,subprocess
E='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/reverse/Engine'
b=open(E,'rb').read()
sec=[l.split() for l in subprocess.run(['readelf','-SW',E],capture_output=True,text=True).stdout.splitlines() if '.text' in l][0]
i=sec.index('.text'); va=int(sec[i+2],16); off=int(sec[i+3],16); size=int(sec[i+4],16)
lo,hi=int(sys.argv[1],16),int(sys.argv[2],16)
for p in range(0,size,4):
    ins=struct.unpack_from('<I',b,off+p)[0]
    if (ins&0xfc000000)==0x94000000:
        imm=ins&0x3ffffff
        if imm&(1<<25): imm-=1<<26
        t=va+p+imm*4
        if lo<=t<hi: print('bl %x -> %x'%(va+p,t))
