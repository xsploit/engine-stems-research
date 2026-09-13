
RANGE 0xc281d0:0xc284e0
0x00c281d0: ldr      x0, [x19, #0x78]
0x00c281d4: cbz      x0, #0xc28b24
0x00c281d8: ldr      x1, [x0]
0x00c281dc: mov      w3, #0xc400
0x00c281e0: movk     w3, #9, lsl #16
0x00c281e4: mov      w2, #1
0x00c281e8: mov      w4, #8
0x00c281ec: ldr      x1, [x1, #0x28]
0x00c281f0: stp      w26, w4, [x0, #0xc]
0x00c281f4: str      w3, [x0, #0x18]
0x00c281f8: str      w2, [x0, #0x20]
0x00c281fc: blr      x1
0x00c28200: ldr      w2, [sp, #8]
0x00c28204: mov      w3, #2
0x00c28208: tbz      w0, #0, #0xc28b38
0x00c2820c: adrp     x1, #0x2b98000
0x00c28210: ldr      x1, [x1, #0xb78]
0x00c28214: mov      x0, #0
0x00c28218: bfxil    x0, x3, #0, #0x20
0x00c2821c: ldr      x4, [sp, #0x148]
0x00c28220: ldr      x3, [x1]
0x00c28224: subs     x4, x4, x3
0x00c28228: mov      x3, #0
0x00c2822c: bfi      x0, x2, #0x20, #0x20
0x00c28230: b.ne     #0xc28c94
0x00c28234: ldp      x29, x30, [sp, #0x150]
0x00c28238: ldp      x19, x20, [sp, #0x160]
0x00c2823c: ldp      x21, x22, [sp, #0x170]
0x00c28240: ldp      x23, x24, [sp, #0x180]
0x00c28244: ldp      x25, x26, [sp, #0x190]
0x00c28248: ldp      x27, x28, [sp, #0x1a0]
0x00c2824c: add      sp, sp, #0x1c0
0x00c28250: autiasp  
0x00c28254: ret      
0x00c28258: add      x22, sp, #0x70
0x00c2825c: mov      x1, x20
0x00c28260: mov      x0, x22
0x00c28264: stp      xzr, xzr, [sp, #0x98]
0x00c28268: str      xzr, [sp, #0xa8]
0x00c2826c: bl       #0x3920d8
0x00c28270: mov      x0, x20
0x00c28274: stp      x25, x26, [sp, #0x190]
0x00c28278: bl       #0x51bde0
0x00c2827c: add      x25, x19, #0x88
0x00c28280: mov      x0, x22
0x00c28284: mov      x1, x25
0x00c28288: bl       #0x393238
0x00c2828c: tbz      w0, #0, #0xc283fc
0x00c28290: mov      x1, x25
0x00c28294: mov      x0, x22
0x00c28298: bl       #0x393cb8
0x00c2829c: tbz      w0, #0, #0xc28470
0x00c282a0: mov      x8, x20
0x00c282a4: mov      x0, x22
0x00c282a8: bl       #0x3920e8
0x00c282ac: add      x24, sp, #0x80
0x00c282b0: mov      x1, x20
0x00c282b4: mov      x0, x24
0x00c282b8: bl       #0x3920d8
0x00c282bc: add      x2, x19, #0xa0
0x00c282c0: mov      x1, x24
0x00c282c4: mov      x0, x23
0x00c282c8: bl       #0x397cc8
0x00c282cc: mov      x0, x24
0x00c282d0: bl       #0x3922b8
0x00c282d4: mov      x0, x20
0x00c282d8: bl       #0x51bde0
0x00c282dc: mov      x8, x20
0x00c282e0: mov      x0, x23
0x00c282e4: bl       #0x395078
0x00c282e8: mov      x0, x20
0x00c282ec: bl       #0x392fd8
0x00c282f0: and      w23, w0, #0xff
0x00c282f4: mov      x0, x20
0x00c282f8: bl       #0x3922b8
0x00c282fc: mov      x0, x22
0x00c28300: bl       #0x3922b8
0x00c28304: tbz      w23, #0, #0xc2841c
0x00c28308: ldp      x25, x26, [sp, #0x190]
0x00c2830c: b        #0xc27fb8
0x00c28310: adrp     x23, #0x1bee000
0x00c28314: mov      x0, x20
0x00c28318: add      x2, x23, #0x3f8
0x00c2831c: mov      x1, #0x1c
0x00c28320: bl       #0x51ea20
0x00c28324: mov      x0, x20
0x00c28328: bl       #0xc69d30
0x00c2832c: and      w22, w0, #0xff
0x00c28330: mov      x0, x20
0x00c28334: bl       #0x51bde0
0x00c28338: tbz      w22, #0, #0xc284e0
0x00c2833c: add      x2, x23, #0x3f8
0x00c28340: mov      x0, x20
0x00c28344: mov      x1, #0x1c
0x00c28348: bl       #0x51ea20
0x00c2834c: add      x24, sp, #0x80
0x00c28350: mov      x0, x20
0x00c28354: mov      x8, x24
0x00c28358: bl       #0xc69eec
0x00c2835c: mov      x0, x20
0x00c28360: bl       #0x51bde0
0x00c28364: ldp      x1, x0, [sp, #0x88]
0x00c28368: mov      x2, x20
0x00c2836c: mov      w3, #0xa
0x00c28370: bl       #0x393478
0x00c28374: cmp      x0, w0, sxtw
0x00c28378: b.eq     #0xc28afc
0x00c2837c: strb     wzr, [sp, #0x98]
0x00c28380: mov      w22, #1
0x00c28384: mov      x0, x24
0x00c28388: bl       #0x51bde0
0x00c2838c: adrp     x0, #0x1bc7000
0x00c28390: add      x0, x0, #0x90
0x00c28394: mov      x1, #2
0x00c28398: stp      x1, xzr, [sp, #0x98]
0x00c2839c: stp      xzr, x0, [sp, #0xa8]
0x00c283a0: bl       #0xc694ac
0x00c283a4: add      x24, sp, #0x80
0x00c283a8: mov      x1, x0
0x00c283ac: mov      x8, x24
0x00c283b0: mov      x0, x20
0x00c283b4: bl       #0x394858
0x00c283b8: adrp     x1, #0x1bee000
0x00c283bc: mov      x0, x24
0x00c283c0: add      x1, x1, #0x418
0x00c283c4: bl       #0x51bea8
0x00c283c8: mov      w1, w22
0x00c283cc: bl       #0x51be50
0x00c283d0: mov      x0, x24
0x00c283d4: bl       #0x391c18
0x00c283d8: add      x1, x28, #0x520
0x00c283dc: add      x0, x1, #0x110
0x00c283e0: strb     w22, [x1, #0x118]
0x00c283e4: bl       #0x392068
0x00c283e8: b        #0xc27f8c
0x00c283ec: add      x26, x26, #1
0x00c283f0: cmp      w3, w26
0x00c283f4: b.gt     #0xc280a4
0x00c283f8: b        #0xc280c4
0x00c283fc: bl       #0xc694ac
0x00c28400: add      x1, x0, #0x11
0x00c28404: ldrb     w1, [x1]
0x00c28408: tst      w1, #0xff
0x00c2840c: b.ne     #0xc291cc
0x00c28410: add      x24, sp, #0x80
0x00c28414: mov      x0, x22
0x00c28418: bl       #0x3922b8
0x00c2841c: adrp     x0, #0x1bc7000
0x00c28420: add      x0, x0, #0x90
0x00c28424: mov      x1, #2
0x00c28428: stp      x1, xzr, [sp, #0x98]
0x00c2842c: stp      xzr, x0, [sp, #0xa8]
0x00c28430: bl       #0xc694ac
0x00c28434: mov      x8, x24
0x00c28438: mov      x1, x0
0x00c2843c: mov      x0, x20
0x00c28440: bl       #0x395828
0x00c28444: adrp     x1, #0x1bee000
0x00c28448: mov      x0, x24
0x00c2844c: add      x1, x1, #0x438
0x00c28450: bl       #0x51bea8
0x00c28454: add      x1, x19, #0xb8
0x00c28458: bl       #0x51bfc0
0x00c2845c: mov      x0, x24
0x00c28460: bl       #0x391c18
0x00c28464: mov      w3, #1
0x00c28468: mov      w2, #-1
0x00c2846c: b        #0xc2820c
0x00c28470: bl       #0xc694ac
0x00c28474: add      x1, x0, #0x11
0x00c28478: ldrb     w1, [x1]
0x00c2847c: tst      w1, #0xff
0x00c28480: b.eq     #0xc28410
0x00c28484: ldr      x1, [x0, #8]
0x00c28488: mov      x2, #2
0x00c2848c: add      x24, sp, #0x80
0x00c28490: mov      x0, x20
0x00c28494: mov      x8, x24
0x00c28498: stp      x2, xzr, [sp, #0x98]
0x00c2849c: stp      xzr, x1, [sp, #0xa8]
0x00c284a0: bl       #0x391c28
0x00c284a4: adrp     x1, #0x1be0000
0x00c284a8: mov      x0, x24
0x00c284ac: add      x1, x1, #0x6c8
0x00c284b0: bl       #0x51bea8
0x00c284b4: mov      x1, x25
0x00c284b8: bl       #0x51bfc0
0x00c284bc: mov      x0, x24
0x00c284c0: bl       #0x391c18
0x00c284c4: mov      x0, x22
0x00c284c8: bl       #0x3922b8
0x00c284cc: b        #0xc2841c
0x00c284d0: mov      x0, x1
0x00c284d4: blr      x2
0x00c284d8: mov      w26, w0
0x00c284dc: b        #0xc28064
