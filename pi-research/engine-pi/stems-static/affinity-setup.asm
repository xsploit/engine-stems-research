
RANGE 0x17c1900:0x17c1b20
0x017c1900: mov      x20, x0
0x017c1904: add      x19, sp, #0x30
0x017c1908: stp      x21, x22, [sp, #0x110]
0x017c190c: ldr      x2, [x1]
0x017c1910: str      x2, [sp, #0xe8]
0x017c1914: mov      x2, #0
0x017c1918: bl       #0x17c166c
0x017c191c: mov      x0, x19
0x017c1920: add      x1, x20, #0x20
0x017c1924: bl       #0x1887a00
0x017c1928: ldp      x0, x21, [sp, #0x30]
0x017c192c: subs     x21, x21, x0
0x017c1930: b.eq     #0x17c1a40
0x017c1934: adrp     x22, #0x2b98000
0x017c1938: ldr      x22, [x22, #0xb78]
0x017c193c: mov      x0, #0x7ffffffffffffffc
0x017c1940: cmp      x21, x0
0x017c1944: b.hi     #0x17c1c40
0x017c1948: mov      x0, x21
0x017c194c: bl       #0x3915d8
0x017c1950: ldp      x1, x19, [sp, #0x30]
0x017c1954: stp      x23, x24, [sp, #0x120]
0x017c1958: mov      x22, x0
0x017c195c: sub      x19, x19, x1
0x017c1960: cmp      x19, #4
0x017c1964: b.le     #0x17c1c64
0x017c1968: mov      x2, x19
0x017c196c: add      x19, x22, x19
0x017c1970: bl       #0x3909f8
0x017c1974: cmp      x22, x19
0x017c1978: b.eq     #0x17c1a30
0x017c197c: movi     v0.4s, #0
0x017c1980: add      x23, sp, #0x68
0x017c1984: mov      x3, x22
0x017c1988: mov      x2, #1
0x017c198c: stp      q0, q0, [x23]
0x017c1990: stp      q0, q0, [x23, #0x20]
0x017c1994: stp      q0, q0, [x23, #0x40]
0x017c1998: stp      q0, q0, [x23, #0x60]
0x017c199c: nop      
0x017c19a0: ldr      w4, [x3]
0x017c19a4: sxtw     x1, w4
0x017c19a8: cmp      x1, #0x3ff
0x017c19ac: b.hi     #0x17c19c8
0x017c19b0: lsr      x1, x1, #6
0x017c19b4: lsl      x4, x2, x4
0x017c19b8: lsl      x1, x1, #3
0x017c19bc: ldr      x0, [x23, x1]
0x017c19c0: orr      x0, x0, x4
0x017c19c4: str      x0, [x23, x1]
0x017c19c8: add      x3, x3, #4
0x017c19cc: cmp      x3, x19
0x017c19d0: b.ne     #0x17c19a0
0x017c19d4: bl       #0x391848
0x017c19d8: mov      x24, x0
0x017c19dc: mov      x2, x23
0x017c19e0: mov      x1, #0x80
0x017c19e4: bl       #0x39c498
0x017c19e8: cbnz     w0, #0x17c1d40
0x017c19ec: mov      x2, x23
0x017c19f0: mov      x0, x24
0x017c19f4: mov      x1, #0x80
0x017c19f8: bl       #0x396878
0x017c19fc: cbnz     w0, #0x17c1c98
0x017c1a00: adrp     x23, #0x2d08000
0x017c1a04: add      x24, x23, #0x360
0x017c1a08: add      x0, x24, #0x90
0x017c1a0c: ldapr    x1, [x0]
0x017c1a10: tbz      w1, #0, #0x17c1abc
0x017c1a14: add      x23, x23, #0x360
0x017c1a18: add      x1, x23, #0x98
0x017c1a1c: add      x23, x23, #0xa8
0x017c1a20: ldrb     w0, [x23]
0x017c1a24: tst      w0, #0xff
0x017c1a28: b.ne     #0x17c1afc
0x017c1a2c: mov      x19, x22
0x017c1a30: mov      x1, x21
0x017c1a34: mov      x0, x19
0x017c1a38: bl       #0x391ae8
0x017c1a3c: ldp      x23, x24, [sp, #0x120]
0x017c1a40: ldr      x0, [sp, #0x30]
0x017c1a44: cbz      x0, #0x17c1a54
0x017c1a48: ldr      x1, [sp, #0x40]
0x017c1a4c: sub      x1, x1, x0
0x017c1a50: bl       #0x391ae8
0x017c1a54: ldrb     w0, [x20, #0x3c]
0x017c1a58: tbnz     w0, #0, #0x17c1a98
0x017c1a5c: adrp     x0, #0x2b98000
0x017c1a60: ldr      x0, [x0, #0xb78]
0x017c1a64: mov      w1, #1
0x017c1a68: strb     w1, [x20, #0x64]
0x017c1a6c: ldr      x2, [sp, #0xe8]
0x017c1a70: ldr      x1, [x0]
0x017c1a74: subs     x2, x2, x1
0x017c1a78: mov      x1, #0
0x017c1a7c: b.ne     #0x17c1c88
0x017c1a80: ldp      x29, x30, [sp, #0xf0]
0x017c1a84: ldp      x19, x20, [sp, #0x100]
0x017c1a88: ldp      x21, x22, [sp, #0x110]
0x017c1a8c: add      sp, sp, #0x150
0x017c1a90: autiasp  
0x017c1a94: ret      
0x017c1a98: bl       #0x391848
0x017c1a9c: ldr      w19, [x20, #0x38]
0x017c1aa0: ldr      w3, [x20, #0x60]
0x017c1aa4: mov      w2, #2
0x017c1aa8: mov      w1, w19
0x017c1aac: cmp      w3, #0
0x017c1ab0: cset     w3, eq
0x017c1ab4: bl       #0x18caf10
0x017c1ab8: b        #0x17c1a5c
0x017c1abc: bl       #0x392058
0x017c1ac0: cbz      w0, #0x17c1a14
0x017c1ac4: adrp     x1, #0x1c49000
0x017c1ac8: add      x0, x24, #0x98
0x017c1acc: add      x1, x1, #0x598
0x017c1ad0: mov      w2, #1
0x017c1ad4: bl       #0x392528
0x017c1ad8: adrp     x0, #0x2b99000
0x017c1adc: ldr      x0, [x0, #0x208]
0x017c1ae0: add      x1, x24, #0x98
0x017c1ae4: adrp     x2, #0x2ba0000
0x017c1ae8: add      x2, x2, #8
0x017c1aec: bl       #0x3915c8
0x017c1af0: add      x0, x24, #0x90
0x017c1af4: bl       #0x392068
0x017c1af8: b        #0x17c1a14
0x017c1afc: ldr      x1, [x1, #8]
0x017c1b00: stp      x27, x28, [sp, #0x140]
0x017c1b04: add      x27, sp, #8
0x017c1b08: mov      x2, #2
0x017c1b0c: mov      x8, x27
0x017c1b10: add      x0, sp, #0x48
0x017c1b14: stp      x2, xzr, [sp, #0x48]
0x017c1b18: add      x28, sp, #0x28
0x017c1b1c: stp      xzr, x1, [sp, #0x58]
