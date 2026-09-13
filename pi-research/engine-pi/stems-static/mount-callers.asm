
RANGE 0x7ea9d0:0x7eab10
0x007ea9d0: mov      x1, #1
0x007ea9d4: ldr      x20, [x19, #0x198]
0x007ea9d8: stp      x2, x1, [x3]
0x007ea9dc: mov      x0, #0x20
0x007ea9e0: stp      x22, xzr, [x3, #0x20]
0x007ea9e4: ldr      x19, [x19, #0x8c8]
0x007ea9e8: bl       #0x3915d8
0x007ea9ec: mov      x4, x0
0x007ea9f0: add      x0, sp, #0x200
0x007ea9f4: adrp     x9, #0x7f1000
0x007ea9f8: add      x9, x9, #0x480
0x007ea9fc: mov      w12, #1
0x007eaa00: add      x7, x24, #0x10
0x007eaa04: ldp      x10, x11, [x0, #0x30]
0x007eaa08: str      w12, [x4]
0x007eaa0c: str      x9, [x4, #8]
0x007eaa10: add      x7, x7, #0xaa0
0x007eaa14: stp      x10, x11, [x4, #0x10]
0x007eaa18: mov      x3, x27
0x007eaa1c: mov      x2, x20
0x007eaa20: mov      x1, x21
0x007eaa24: mov      x0, x19
0x007eaa28: mov      x8, x26
0x007eaa2c: mov      x6, #0
0x007eaa30: mov      w5, #0
0x007eaa34: bl       #0x392658
0x007eaa38: mov      x0, x26
0x007eaa3c: bl       #0x392668
0x007eaa40: b        #0x7e96cc
0x007eaa44: cmp      x0, x2
0x007eaa48: csel     x0, x0, x2, ls
0x007eaa4c: str      x0, [sp, #0x80]
0x007eaa50: b        #0x7e99d0
0x007eaa54: adds     x5, x0, #1
0x007eaa58: b.lo     #0x7eaa78
0x007eaa5c: mov      x5, x1
0x007eaa60: mov      x0, x5
0x007eaa64: str      x5, [sp, #0x28]
0x007eaa68: bl       #0x1894680
0x007eaa6c: mov      x27, x0
0x007eaa70: ldr      x5, [sp, #0x28]
0x007eaa74: b        #0x7ea40c
0x007eaa78: mov      x0, #0xfffffffffffffff
0x007eaa7c: cmp      x5, x0
0x007eaa80: csel     x5, x5, x0, ls
0x007eaa84: b        #0x7eaa60
0x007eaa88: mov      x0, x24
0x007eaa8c: bl       #0x9775a0
0x007eaa90: b        #0x7ea66c
0x007eaa94: mov      x0, x21
0x007eaa98: mov      x1, #0x1e8
0x007eaa9c: bl       #0x17c06e4
0x007eaaa0: adrp     x0, #0x2a89000
0x007eaaa4: add      x0, x0, #0x780
0x007eaaa8: add      x0, x0, #0xfa8
0x007eaaac: str      x23, [sp, #0x230]
0x007eaab0: str      x0, [sp, #0x250]
0x007eaab4: ldr      x20, [sp, #0x258]
0x007eaab8: cbz      x23, #0x7eaacc
0x007eaabc: ldr      x0, [x23]
0x007eaac0: ldur     x0, [x0, #-0x28]
0x007eaac4: add      x0, x23, x0
0x007eaac8: bl       #0x17c05e0
0x007eaacc: ldr      x1, [sp, #0x30]
0x007eaad0: mov      x2, x27
0x007eaad4: mov      x0, x20
0x007eaad8: bl       #0x97e76c
0x007eaadc: ldr      x0, [sp, #0x230]
0x007eaae0: cbz      x0, #0x7eaaf4
0x007eaae4: ldr      x1, [x0]
0x007eaae8: ldur     x1, [x1, #-0x28]
0x007eaaec: add      x0, x0, x1
0x007eaaf0: bl       #0x17e2e64
0x007eaaf4: adrp     x0, #0x2a89000
0x007eaaf8: add      x1, x0, #0x780
0x007eaafc: add      x1, x1, #0xfa8
0x007eab00: mov      x0, x21
0x007eab04: str      x1, [sp, #0x250]
0x007eab08: str      xzr, [sp, #0x258]
0x007eab0c: bl       #0x17c0740

RANGE 0x97ca70:0x97cb60
0x0097ca70: bl       #0x97c4c8
0x0097ca74: tbnz     w0, #0, #0x97cad8
0x0097ca78: adrp     x0, #0x2bbb000
0x0097ca7c: add      x0, x0, #0xfe0
0x0097ca80: add      x0, x0, #0x18
0x0097ca84: stlrb    wzr, [x0]
0x0097ca88: ldr      x0, [x19, #0x10]
0x0097ca8c: adrp     x1, #0x2afd000
0x0097ca90: ldr      x19, [sp, #0x10]
0x0097ca94: add      x1, x1, #0x2f0
0x0097ca98: ldp      x29, x30, [sp], #0x20
0x0097ca9c: autiasp  
0x0097caa0: mov      x3, #0
0x0097caa4: mov      w2, #7
0x0097caa8: b        #0x392df8
0x0097caac: cbnz     x1, #0x97cac0
0x0097cab0: ldr      x19, [sp, #0x10]
0x0097cab4: ldp      x29, x30, [sp], #0x20
0x0097cab8: autiasp  
0x0097cabc: ret      
0x0097cac0: ldr      x19, [sp, #0x10]
0x0097cac4: mov      x0, x1
0x0097cac8: ldp      x29, x30, [sp], #0x20
0x0097cacc: autiasp  
0x0097cad0: mov      x1, #0x18
0x0097cad4: b        #0x391ae8
0x0097cad8: ldr      x0, [x19, #0x10]
0x0097cadc: bl       #0x9775a0
0x0097cae0: b        #0x97ca78
0x0097cae4: paciasp  
0x0097cae8: stp      x29, x30, [sp, #-0x20]!
0x0097caec: mov      x29, sp
0x0097caf0: str      x19, [sp, #0x10]
0x0097caf4: mov      x19, x1
0x0097caf8: cbz      w0, #0x97cb50
0x0097cafc: cmp      w0, #1
0x0097cb00: b.eq     #0x97cb14
0x0097cb04: ldr      x19, [sp, #0x10]
0x0097cb08: ldp      x29, x30, [sp], #0x20
0x0097cb0c: autiasp  
0x0097cb10: ret      
0x0097cb14: ldr      x0, [x1, #0x10]
0x0097cb18: bl       #0x97c4c8
0x0097cb1c: adrp     x0, #0x2bbb000
0x0097cb20: add      x0, x0, #0xfe0
0x0097cb24: add      x0, x0, #0x18
0x0097cb28: stlrb    wzr, [x0]
0x0097cb2c: ldr      x0, [x19, #0x10]
0x0097cb30: adrp     x1, #0x2afd000
0x0097cb34: ldr      x19, [sp, #0x10]
0x0097cb38: add      x1, x1, #0x2f0
0x0097cb3c: ldp      x29, x30, [sp], #0x20
0x0097cb40: autiasp  
0x0097cb44: mov      x3, #0
0x0097cb48: mov      w2, #7
0x0097cb4c: b        #0x392df8
0x0097cb50: cbz      x1, #0x97cb04
0x0097cb54: ldr      x19, [sp, #0x10]
0x0097cb58: mov      x0, x1
0x0097cb5c: ldp      x29, x30, [sp], #0x20
