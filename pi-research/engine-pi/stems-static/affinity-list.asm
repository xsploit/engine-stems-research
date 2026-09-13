
RANGE 0x1887a00:0x1887b30
0x01887a00: paciasp  
0x01887a04: stp      x29, x30, [sp, #-0x30]!
0x01887a08: mov      x29, sp
0x01887a0c: str      x21, [sp, #0x20]
0x01887a10: mov      x21, x1
0x01887a14: stp      x19, x20, [sp, #0x10]
0x01887a18: mov      x19, x0
0x01887a1c: ldr      x1, [x1]
0x01887a20: ldr      x0, [x21, #8]
0x01887a24: stp      xzr, xzr, [x19]
0x01887a28: str      xzr, [x19, #0x10]
0x01887a2c: subs     x20, x0, x1
0x01887a30: b.eq     #0x1887a94
0x01887a34: mov      x0, #0x7ffffffffffffffc
0x01887a38: cmp      x20, x0
0x01887a3c: b.hi     #0x1887aac
0x01887a40: mov      x0, x20
0x01887a44: bl       #0x3915d8
0x01887a48: mov      x3, x0
0x01887a4c: add      x0, x3, x20
0x01887a50: stp      x3, x3, [x19]
0x01887a54: str      x0, [x19, #0x10]
0x01887a58: ldp      x1, x20, [x21]
0x01887a5c: sub      x20, x20, x1
0x01887a60: cmp      x20, #4
0x01887a64: b.le     #0x1887a9c
0x01887a68: mov      x0, x3
0x01887a6c: mov      x2, x20
0x01887a70: bl       #0x3909f8
0x01887a74: mov      x3, x0
0x01887a78: ldr      x21, [sp, #0x20]
0x01887a7c: add      x3, x3, x20
0x01887a80: str      x3, [x19, #8]
0x01887a84: ldp      x19, x20, [sp, #0x10]
0x01887a88: ldp      x29, x30, [sp], #0x30
0x01887a8c: autiasp  
0x01887a90: ret      
0x01887a94: mov      x3, #0
0x01887a98: b        #0x1887a4c
0x01887a9c: b.ne     #0x1887a78
0x01887aa0: ldr      w0, [x1]
0x01887aa4: str      w0, [x3]
0x01887aa8: b        #0x1887a78
0x01887aac: bl       #0x391f38
0x01887ab0: paciasp  
0x01887ab4: sub      sp, sp, #0x50
0x01887ab8: adrp     x3, #0x2b98000
0x01887abc: ldr      x3, [x3, #0xb78]
0x01887ac0: stp      x29, x30, [sp, #0x20]
0x01887ac4: add      x29, sp, #0x20
0x01887ac8: stp      x19, x20, [sp, #0x30]
0x01887acc: mov      x19, x0
0x01887ad0: mov      x20, x2
0x01887ad4: stp      x21, x22, [sp, #0x40]
0x01887ad8: mov      w21, w1
0x01887adc: ldr      x0, [x3]
0x01887ae0: str      x0, [sp, #0x18]
0x01887ae4: mov      x0, #0
0x01887ae8: ldr      x0, [x19]
0x01887aec: cbnz     w1, #0x1887cb4
0x01887af0: cbz      x0, #0x1887c58
0x01887af4: ldr      w1, [x0]
0x01887af8: cmp      w1, #1
0x01887afc: cset     w1, le
0x01887b00: tst      w1, w2
0x01887b04: b.ne     #0x1887d74
0x01887b08: ldp      x2, x4, [x19, #8]
0x01887b0c: add      x3, x0, #0x1f
0x01887b10: ldr      x1, [x0, #8]
0x01887b14: and      x3, x3, #0xfffffffffffffff0
0x01887b18: sub      x2, x2, x3
0x01887b1c: cmp      x1, x4
0x01887b20: csel     x3, x1, x4, ge
0x01887b24: sub      x2, x1, x2, asr #3
0x01887b28: add      x3, x3, x20
0x01887b2c: sub      x2, x2, x4
