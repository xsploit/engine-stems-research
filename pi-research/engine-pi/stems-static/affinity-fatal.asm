
RANGE 0x17c1b20:0x17c1df0
0x017c1b20: stp      x25, x26, [sp, #0x130]
0x017c1b24: bl       #0x391c08
0x017c1b28: mov      x0, x27
0x017c1b2c: adrp     x1, #0x1c49000
0x017c1b30: add      x1, x1, #0x5e8
0x017c1b34: bl       #0x51bea8
0x017c1b38: mov      x2, x0
0x017c1b3c: add      x25, sp, #0x20
0x017c1b40: mov      x0, x28
0x017c1b44: mov      x1, x25
0x017c1b48: ldr      x2, [x2]
0x017c1b4c: str      xzr, [sp, #0x10]
0x017c1b50: str      x2, [sp, #0x20]
0x017c1b54: ldr      w3, [x2, #0x28]
0x017c1b58: add      w3, w3, #1
0x017c1b5c: str      w3, [x2, #0x28]
0x017c1b60: bl       #0x393318
0x017c1b64: ldr      x2, [sp, #0x20]
0x017c1b68: adrp     x1, #0x1bcc000
0x017c1b6c: mov      x0, x25
0x017c1b70: add      x1, x1, #0x120
0x017c1b74: strb     wzr, [x2, #0x30]
0x017c1b78: bl       #0x51bea8
0x017c1b7c: mov      x23, x0
0x017c1b80: mov      w1, #0x28
0x017c1b84: ldr      x0, [x0]
0x017c1b88: bl       #0x391bd8
0x017c1b8c: ldr      x0, [x23]
0x017c1b90: ldrb     w1, [x0, #0x30]
0x017c1b94: tbnz     w1, #0, #0x17c1c58
0x017c1b98: ldr      w1, [x22]
0x017c1b9c: mov      x0, x25
0x017c1ba0: bl       #0x51be50
0x017c1ba4: add      x24, x22, #4
0x017c1ba8: adrp     x26, #0x1bca000
0x017c1bac: add      x26, x26, #0x760
0x017c1bb0: cmp      x19, x24
0x017c1bb4: b.ne     #0x17c1bc8
0x017c1bb8: b        #0x17c1bfc
0x017c1bbc: add      x24, x24, #4
0x017c1bc0: cmp      x19, x24
0x017c1bc4: b.eq     #0x17c1bfc
0x017c1bc8: mov      x1, x26
0x017c1bcc: mov      x0, x25
0x017c1bd0: bl       #0x51bea8
0x017c1bd4: mov      x23, x0
0x017c1bd8: ldr      w1, [x24]
0x017c1bdc: ldr      x0, [x0]
0x017c1be0: bl       #0x391bc8
0x017c1be4: ldr      x0, [x23]
0x017c1be8: ldrb     w1, [x0, #0x30]
0x017c1bec: tbz      w1, #0, #0x17c1bbc
0x017c1bf0: mov      w1, #0x20
0x017c1bf4: bl       #0x391bd8
0x017c1bf8: b        #0x17c1bbc
0x017c1bfc: mov      x0, x25
0x017c1c00: bl       #0x1896b60
0x017c1c04: ldr      x1, [sp, #0x20]
0x017c1c08: mov      x0, x28
0x017c1c0c: stp      x1, xzr, [sp, #0x18]
0x017c1c10: bl       #0x393338
0x017c1c14: mov      x0, x25
0x017c1c18: bl       #0x391c18
0x017c1c1c: add      x0, sp, #0x18
0x017c1c20: bl       #0x391c18
0x017c1c24: add      x0, sp, #0x10
0x017c1c28: bl       #0x391c18
0x017c1c2c: mov      x0, x27
0x017c1c30: bl       #0x391c18
0x017c1c34: ldp      x25, x26, [sp, #0x130]
0x017c1c38: ldp      x27, x28, [sp, #0x140]
0x017c1c3c: b        #0x17c1a2c
0x017c1c40: ldr      x0, [sp, #0xe8]
0x017c1c44: ldr      x1, [x22]
0x017c1c48: subs     x0, x0, x1
0x017c1c4c: mov      x1, #0
0x017c1c50: b.ne     #0x17c1c88
0x017c1c54: bl       #0x391f38
0x017c1c58: mov      w1, #0x20
0x017c1c5c: bl       #0x391bd8
0x017c1c60: b        #0x17c1b98
0x017c1c64: b.ne     #0x17c1c78
0x017c1c68: mov      x19, x0
0x017c1c6c: ldr      w0, [x1]
0x017c1c70: str      w0, [x19], #4
0x017c1c74: b        #0x17c197c
0x017c1c78: add      x19, x22, x19
0x017c1c7c: cmp      x19, x22
0x017c1c80: b.ne     #0x17c197c
0x017c1c84: b        #0x17c1a2c
0x017c1c88: stp      x23, x24, [sp, #0x120]
0x017c1c8c: stp      x25, x26, [sp, #0x130]
0x017c1c90: stp      x27, x28, [sp, #0x140]
0x017c1c94: bl       #0x390978
0x017c1c98: adrp     x2, #0x1bc7000
0x017c1c9c: adrp     x1, #0x1be0000
0x017c1ca0: add      x2, x2, #0x90
0x017c1ca4: add      x0, sp, #0x48
0x017c1ca8: add      x1, x1, #0x428
0x017c1cac: mov      x3, #2
0x017c1cb0: stp      x25, x26, [sp, #0x130]
0x017c1cb4: stp      x27, x28, [sp, #0x140]
0x017c1cb8: stp      x3, xzr, [sp, #0x48]
0x017c1cbc: stp      xzr, x2, [sp, #0x58]
0x017c1cc0: bl       #0x3922c8
0x017c1cc4: bti      j
0x017c1cc8: mov      x1, x0
0x017c1ccc: mov      x0, x19
0x017c1cd0: mov      x19, x1
0x017c1cd4: bl       #0x520680
0x017c1cd8: ldr      x0, [sp, #0xe8]
0x017c1cdc: ldr      x1, [x22]
0x017c1ce0: subs     x0, x0, x1
0x017c1ce4: mov      x1, #0
0x017c1ce8: stp      x23, x24, [sp, #0x120]
0x017c1cec: stp      x25, x26, [sp, #0x130]
0x017c1cf0: stp      x27, x28, [sp, #0x140]
0x017c1cf4: b.ne     #0x17c1d00
0x017c1cf8: mov      x0, x19
0x017c1cfc: bl       #0x391548
0x017c1d00: bl       #0x390978
0x017c1d04: bti      j
0x017c1d08: mov      x0, x28
0x017c1d0c: bl       #0x393338
0x017c1d10: mov      x0, x25
0x017c1d14: bl       #0x391c18
0x017c1d18: bl       #0x391b78
0x017c1d1c: bti      j
0x017c1d20: b        #0x17c1d10
0x017c1d24: bti      j
0x017c1d28: add      x0, x23, #0x360
0x017c1d2c: add      x0, x0, #0x90
0x017c1d30: bl       #0x392078
0x017c1d34: stp      x25, x26, [sp, #0x130]
0x017c1d38: stp      x27, x28, [sp, #0x140]
0x017c1d3c: bl       #0x391b78
0x017c1d40: adrp     x2, #0x1bc7000
0x017c1d44: adrp     x1, #0x1c49000
0x017c1d48: add      x2, x2, #0x90
0x017c1d4c: add      x0, sp, #0x48
0x017c1d50: add      x1, x1, #0x5c8
0x017c1d54: mov      x3, #2
0x017c1d58: stp      x25, x26, [sp, #0x130]
0x017c1d5c: stp      x27, x28, [sp, #0x140]
0x017c1d60: b        #0x17c1cb8
0x017c1d64: paciasp  
0x017c1d68: sub      sp, sp, #0x90
0x017c1d6c: stp      x29, x30, [sp, #0x50]
0x017c1d70: add      x29, sp, #0x50
0x017c1d74: stp      x19, x20, [sp, #0x60]
0x017c1d78: mov      x19, x0
0x017c1d7c: adrp     x0, #0x2b98000
0x017c1d80: ldr      x0, [x0, #0xb78]
0x017c1d84: stp      x21, x22, [sp, #0x70]
0x017c1d88: adrp     x21, #0x2d08000
0x017c1d8c: ldr      x1, [x19, #8]
0x017c1d90: str      x23, [sp, #0x80]
0x017c1d94: ldr      x2, [x0]
0x017c1d98: str      x2, [sp, #0x48]
0x017c1d9c: mov      x2, #0
0x017c1da0: ldr      x0, [x1, #8]
0x017c1da4: ldr      w20, [x0, #4]
0x017c1da8: bl       #0x391848
0x017c1dac: ldr      w2, [sp, #8]
0x017c1db0: mov      w3, #0
0x017c1db4: mov      w1, w20
0x017c1db8: bl       #0x18caf10
0x017c1dbc: add      x0, x21, #0x360
0x017c1dc0: ldr      x0, [x0, #0xb0]
0x017c1dc4: cbz      x0, #0x17c1ec0
0x017c1dc8: ldr      x2, [x19, #8]
0x017c1dcc: adrp     x3, #0x50c000
0x017c1dd0: ldr      x4, [x0]
0x017c1dd4: add      x3, x3, #0x4c4
0x017c1dd8: ldr      x1, [x2, #8]
0x017c1ddc: ldr      x4, [x4, #0x20]
0x017c1de0: ldr      w1, [x1, #8]
0x017c1de4: cmp      x4, x3
0x017c1de8: b.ne     #0x17c1ebc
0x017c1dec: ldr      x0, [x2]
