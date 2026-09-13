
RANGE 0x97c4c8:0x97c580
0x0097c4c8: paciasp  
0x0097c4cc: sub      sp, sp, #0x80
0x0097c4d0: adrp     x1, #0x2b98000
0x0097c4d4: ldr      x1, [x1, #0xb78]
0x0097c4d8: stp      x29, x30, [sp, #0x40]
0x0097c4dc: add      x29, sp, #0x40
0x0097c4e0: ldr      x2, [x0, #0x78]
0x0097c4e4: stp      x19, x20, [sp, #0x50]
0x0097c4e8: mov      w20, #1
0x0097c4ec: ldr      x3, [x1]
0x0097c4f0: str      x3, [sp, #0x38]
0x0097c4f4: mov      x3, #0
0x0097c4f8: cbz      x2, #0x97c530
0x0097c4fc: adrp     x0, #0x2b98000
0x0097c500: ldr      x0, [x0, #0xb78]
0x0097c504: ldr      x2, [sp, #0x38]
0x0097c508: ldr      x1, [x0]
0x0097c50c: subs     x2, x2, x1
0x0097c510: mov      x1, #0
0x0097c514: b.ne     #0x97c650
0x0097c518: ldp      x29, x30, [sp, #0x40]
0x0097c51c: mov      w0, w20
0x0097c520: ldp      x19, x20, [sp, #0x50]
0x0097c524: add      sp, sp, #0x80
0x0097c528: autiasp  
0x0097c52c: ret      
0x0097c530: ldr      x1, [x0]
0x0097c534: stp      x21, x22, [sp, #0x60]
0x0097c538: add      x22, sp, #8
0x0097c53c: mov      x19, x0
0x0097c540: mov      x8, x22
0x0097c544: ldr      x1, [x1, #0x90]
0x0097c548: str      x23, [sp, #0x70]
0x0097c54c: add      x21, sp, #0x20
0x0097c550: blr      x1
0x0097c554: ldr      x0, [sp, #0x18]
0x0097c558: cbz      x0, #0x97c630
0x0097c55c: mov      x1, x22
0x0097c560: mov      x0, x21
0x0097c564: bl       #0x391ff8
0x0097c568: mov      x0, x21
0x0097c56c: bl       #0x393cd8
0x0097c570: and      w20, w0, #0xff
0x0097c574: mov      x0, x21
0x0097c578: bl       #0x392018
0x0097c57c: adrp     x1, #0x1bdf000
