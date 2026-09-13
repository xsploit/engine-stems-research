import struct,sys
E='/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/reverse/Engine'
b=open(E,'rb').read()
REL_OFF,REL_SZ=0x043118,0x33b328
ents={}; byadd={}
for p in range(REL_OFF,REL_OFF+REL_SZ,24):
    off,info,add=struct.unpack_from('<QQq',b,p)
    ents[off]=add; byadd.setdefault(add,[]).append(off)
def lookup(v): return byadd.get(v,[])
if __name__=='__main__':
    for a in sys.argv[1:]:
        v=int(a,16); print(hex(v),'referenced from:',[hex(x) for x in lookup(v)][:12])
