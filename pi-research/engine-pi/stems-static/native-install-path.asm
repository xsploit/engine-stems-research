
RANGE 0x976dc0:0x977300
0x00976dc0: bti      j
0x00976dc4: mov      x20, x0
0x00976dc8: cbnz     x19, #0x976dd4
0x00976dcc: mov      x0, x20
0x00976dd0: bl       #0x391548 ; _Unwind_Resume ; _Unwind_Resume
0x00976dd4: mov      x0, x19
0x00976dd8: bl       #0x5443b0
0x00976ddc: b        #0x976dcc
0x00976de0: paciasp  
0x00976de4: sub      sp, sp, #0x1a0
0x00976de8: adrp     x1, #0x2b98000
0x00976dec: ldr      x1, [x1, #0xb78]
0x00976df0: stp      x29, x30, [sp, #0x140]
0x00976df4: add      x29, sp, #0x140
0x00976df8: ldr      x0, [x0, #0x78]
0x00976dfc: stp      x19, x20, [sp, #0x150]
0x00976e00: stp      x21, x22, [sp, #0x160]
0x00976e04: mov      x22, x8
0x00976e08: stp      x23, x24, [sp, #0x170]
0x00976e0c: stp      x25, x26, [sp, #0x180]
0x00976e10: str      x27, [sp, #0x190]
0x00976e14: ldr      x2, [x1]
0x00976e18: str      x2, [sp, #0x138]
0x00976e1c: mov      x2, #0
0x00976e20: cbz      x0, #0x976f68
0x00976e24: ldr      x1, [x0]
0x00976e28: add      x23, sp, #0x90
0x00976e2c: mov      x8, x23
0x00976e30: add      x27, sp, #0x38
0x00976e34: add      x24, sp, #0xd0
0x00976e38: ldr      x1, [x1, #0x10]
0x00976e3c: blr      x1
0x00976e40: adrp     x1, #0x1bca000
0x00976e44: mov      x2, x27
0x00976e48: mov      x0, x24
0x00976e4c: add      x1, x1, #0x3e8
0x00976e50: bl       #0x51cae0
0x00976e54: add      x21, sp, #0x50
0x00976e58: add      x19, sp, #0xf0
0x00976e5c: adrp     x1, #0x1bdf000
0x00976e60: mov      x2, x21
0x00976e64: mov      x0, x19
0x00976e68: add      x1, x1, #0x7e0
0x00976e6c: bl       #0x51cae0
0x00976e70: add      x25, sp, #0xb0
0x00976e74: mov      x1, x19
0x00976e78: mov      x8, x25
0x00976e7c: mov      x0, x24
0x00976e80: bl       #0x540f70
0x00976e84: ldp      x1, x2, [sp, #0xb0]
0x00976e88: mov      x0, x23
0x00976e8c: bl       #0x520ccc
0x00976e90: mov      x4, x0
0x00976e94: add      x1, sp, #0x80
0x00976e98: str      x1, [sp, #0x70]
0x00976e9c: add      x20, sp, #0x70
0x00976ea0: mov      x0, x20
0x00976ea4: mov      w3, #0
0x00976ea8: ldr      x1, [x4]
0x00976eac: ldr      x2, [x4, #8]
0x00976eb0: add      x2, x1, x2
0x00976eb4: bl       #0x51c6c8
0x00976eb8: mov      x0, x25
0x00976ebc: bl       #0x51c280
0x00976ec0: mov      x0, x19
0x00976ec4: bl       #0x51c280
0x00976ec8: mov      x0, x24
0x00976ecc: bl       #0x51c280
0x00976ed0: mov      x0, x23
0x00976ed4: bl       #0x51c280
0x00976ed8: bl       #0xc69560
0x00976edc: add      x1, x0, #0x10
0x00976ee0: ldrb     w1, [x1]
0x00976ee4: tst      w1, #0xff
0x00976ee8: b.ne     #0x9770ec
0x00976eec: ldp      x19, x0, [sp, #0x70]
0x00976ef0: cmp      x19, #0
0x00976ef4: ccmp     x0, #0, #1, ne
0x00976ef8: b.lt     #0x976f54
0x00976efc: mov      x1, x19
0x00976f00: mov      x8, x22
0x00976f04: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView ; _ZN7QString8fromUtf8E14QByteArrayView
0x00976f08: mov      x0, x20
0x00976f0c: bl       #0x51c280
0x00976f10: adrp     x0, #0x2b98000
0x00976f14: ldr      x0, [x0, #0xb78]
0x00976f18: ldr      x2, [sp, #0x138]
0x00976f1c: ldr      x1, [x0]
0x00976f20: subs     x2, x2, x1
0x00976f24: mov      x1, #0
0x00976f28: b.ne     #0x977274
0x00976f2c: ldp      x29, x30, [sp, #0x140]
0x00976f30: mov      x0, x22
0x00976f34: ldp      x19, x20, [sp, #0x150]
0x00976f38: ldp      x21, x22, [sp, #0x160]
0x00976f3c: ldp      x23, x24, [sp, #0x170]
0x00976f40: ldp      x25, x26, [sp, #0x180]
0x00976f44: ldr      x27, [sp, #0x190]
0x00976f48: add      sp, sp, #0x1a0
0x00976f4c: autiasp  
0x00976f50: ret      
0x00976f54: mov      x0, #0
0x00976f58: cbz      x19, #0x976efc
0x00976f5c: mov      x0, x19
0x00976f60: bl       #0x390948 ; strlen ; strlen
0x00976f64: b        #0x976efc
0x00976f68: add      x19, sp, #0xf0
0x00976f6c: adrp     x1, #0x1bdf000
0x00976f70: mov      x0, x19
0x00976f74: add      x1, x1, #0x810
0x00976f78: bl       #0x51bd60
0x00976f7c: add      x20, sp, #0x108
0x00976f80: adrp     x1, #0x1bdf000
0x00976f84: mov      x0, x20
0x00976f88: add      x1, x1, #0x820
0x00976f8c: bl       #0x51bd60
0x00976f90: add      x21, sp, #0x120
0x00976f94: mov      w0, #9
0x00976f98: mov      x8, x21
0x00976f9c: bl       #0x392ec8 ; _ZN14QStandardPaths16writableLocationENS_16StandardLocationE ; _ZN14QStandardPaths16writableLocationENS_16StandardLocationE
0x00976fa0: mov      x1, x19
0x00976fa4: mov      x2, #3
0x00976fa8: add      x26, sp, #8
0x00976fac: mov      x0, x26
0x00976fb0: bl       #0x53fea0
0x00976fb4: mov      x0, x21
0x00976fb8: bl       #0x51bde0
0x00976fbc: mov      x0, x20
0x00976fc0: bl       #0x51bde0
0x00976fc4: mov      x0, x19
0x00976fc8: bl       #0x51bde0
0x00976fcc: bl       #0xc69560
0x00976fd0: add      x1, x0, #0x10
0x00976fd4: ldrb     w1, [x1]
0x00976fd8: tst      w1, #0xff
0x00976fdc: b.ne     #0x97715c
0x00976fe0: ldp      x0, x23, [sp, #0x10]
0x00976fe4: stp      xzr, xzr, [sp, #0x20]
0x00976fe8: adrp     x24, #0x1bdf000
0x00976fec: str      xzr, [sp, #0x30]
0x00976ff0: add      x24, x24, #0x858
0x00976ff4: add      x21, sp, #0x50
0x00976ff8: mov      w25, #1
0x00976ffc: add      x23, x23, x23, lsl #1
0x00977000: mov      x19, x0
0x00977004: add      x23, x0, x23, lsl #3
0x00977008: cmp      x23, x0
0x0097700c: b.eq     #0x9770bc
0x00977010: ldp      x0, x1, [x19]
0x00977014: stp      x0, x1, [sp, #0x50]
0x00977018: ldr      x1, [x19, #0x10]
0x0097701c: str      x1, [sp, #0x60]
0x00977020: cbz      x0, #0x977028
0x00977024: ldaddal  w25, w0, [x0]
0x00977028: mov      x0, x21
0x0097702c: mov      w1, #0x2f
0x00977030: bl       #0x391bb8 ; _ZN7QString6appendE5QChar ; _ZN7QString6appendE5QChar
0x00977034: mov      x1, x24
0x00977038: mov      x0, x21
0x0097703c: mov      x2, #0x1f
0x00977040: bl       #0x391fa8 ; _ZN7QString6appendE20QBasicUtf8StringViewILb0EE ; _ZN7QString6appendE20QBasicUtf8StringViewILb0EE
0x00977044: mov      x1, x0
0x00977048: add      x27, sp, #0x38
0x0097704c: mov      x0, x21
0x00977050: mov      x20, sp
0x00977054: ldr      x2, [x1]
0x00977058: str      xzr, [x1]
0x0097705c: str      x2, [sp, #0x38]
0x00977060: ldr      x2, [x1, #8]
0x00977064: str      xzr, [x1, #8]
0x00977068: str      x2, [sp, #0x40]
0x0097706c: ldr      x2, [x1, #0x10]
0x00977070: str      xzr, [x1, #0x10]
0x00977074: str      x2, [sp, #0x48]
0x00977078: bl       #0x51bde0
0x0097707c: mov      x1, x27
0x00977080: mov      x0, x20
0x00977084: bl       #0x3921c8 ; _ZN9QFileInfoC1ERK7QString ; _ZN9QFileInfoC1ERK7QString
0x00977088: mov      x0, x20
0x0097708c: bl       #0x394ed8 ; _ZNK9QFileInfo6existsEv ; _ZNK9QFileInfo6existsEv
0x00977090: tbz      w0, #0, #0x9770a0
0x00977094: mov      x0, x20
0x00977098: bl       #0x395af8 ; _ZNK9QFileInfo6isFileEv ; _ZNK9QFileInfo6isFileEv
0x0097709c: tbnz     w0, #0, #0x97712c
0x009770a0: mov      x0, x20
0x009770a4: bl       #0x392218 ; _ZN9QFileInfoD1Ev ; _ZN9QFileInfoD1Ev
0x009770a8: mov      x0, x27
0x009770ac: add      x19, x19, #0x18
0x009770b0: bl       #0x51bde0
0x009770b4: cmp      x23, x19
0x009770b8: b.ne     #0x977010
0x009770bc: bl       #0xc69560
0x009770c0: add      x1, x0, #0x10
0x009770c4: ldrb     w1, [x1]
0x009770c8: tst      w1, #0xff
0x009770cc: b.ne     #0x9771f0
0x009770d0: ldr      q0, [sp, #0x20]
0x009770d4: mov      x0, x26
0x009770d8: ldr      x1, [sp, #0x30]
0x009770dc: str      x1, [x22, #0x10]
0x009770e0: str      q0, [x22]
0x009770e4: bl       #0x51d6c8
0x009770e8: b        #0x976f10
0x009770ec: ldr      x1, [x0, #8]
0x009770f0: mov      x2, #2
0x009770f4: mov      x8, x27
0x009770f8: mov      x0, x21
0x009770fc: stp      x2, xzr, [sp, #0x50]
0x00977100: stp      xzr, x1, [sp, #0x60]
0x00977104: bl       #0x391c08 ; _ZNK14QMessageLogger5debugEv ; _ZNK14QMessageLogger5debugEv
0x00977108: adrp     x1, #0x1bdf000
0x0097710c: mov      x0, x27
0x00977110: add      x1, x1, #0x7f0
0x00977114: bl       #0x51bea8
0x00977118: mov      x1, x20
0x0097711c: bl       #0x533c8c
0x00977120: mov      x0, x27
0x00977124: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x00977128: b        #0x976eec
0x0097712c: mov      x8, x21
0x00977130: mov      x0, x20
0x00977134: bl       #0x3950e8 ; _ZNK9QFileInfo16absoluteFilePathEv ; _ZNK9QFileInfo16absoluteFilePathEv
0x00977138: ldr      q0, [sp, #0x50]
0x0097713c: mov      x0, x20
0x00977140: ldr      x1, [sp, #0x60]
0x00977144: str      x1, [sp, #0x30]
0x00977148: str      q0, [sp, #0x20]
0x0097714c: bl       #0x392218 ; _ZN9QFileInfoD1Ev ; _ZN9QFileInfoD1Ev
0x00977150: mov      x0, x27
0x00977154: bl       #0x51bde0
0x00977158: b        #0x9770bc
0x0097715c: ldr      x1, [x0, #8]
0x00977160: mov      x2, #2
0x00977164: mov      x20, sp
0x00977168: add      x0, sp, #0x50
0x0097716c: mov      x8, x20
0x00977170: stp      x2, xzr, [sp, #0x50]
0x00977174: stp      xzr, x1, [sp, #0x60]
0x00977178: bl       #0x391c08 ; _ZNK14QMessageLogger5debugEv ; _ZNK14QMessageLogger5debugEv
0x0097717c: adrp     x1, #0x1bdf000
0x00977180: mov      x0, x20
0x00977184: add      x1, x1, #0x830
0x00977188: bl       #0x51bea8
0x0097718c: add      x27, sp, #0x38
0x00977190: mov      x21, x0
0x00977194: adrp     x1, #0x1bc8000
0x00977198: mov      x0, x27
0x0097719c: add      x1, x1, #0x838
0x009771a0: bl       #0x51bd60
0x009771a4: ldp      x3, x2, [sp, #0x40]
0x009771a8: add      x19, sp, #0x20
0x009771ac: adrp     x1, #0x2b99000
0x009771b0: ldr      x1, [x1, #0x1e8]
0x009771b4: mov      x8, x19
0x009771b8: mov      x0, x26
0x009771bc: cmp      x3, #0
0x009771c0: csel     x1, x3, x1, ne
0x009771c4: bl       #0x3927e8 ; _ZN9QtPrivate16QStringList_joinEPK5QListI7QStringEPK5QCharx ; _ZN9QtPrivate16QStringList_joinEPK5QListI7QStringEPK5QCharx
0x009771c8: mov      x1, x19
0x009771cc: mov      x0, x21
0x009771d0: bl       #0x51bfc0
0x009771d4: mov      x0, x19
0x009771d8: bl       #0x51bde0
0x009771dc: mov      x0, x27
0x009771e0: bl       #0x51bde0
0x009771e4: mov      x0, x20
0x009771e8: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x009771ec: b        #0x976fe0
0x009771f0: ldr      x1, [x0, #8]
0x009771f4: mov      x2, #2
0x009771f8: add      x27, sp, #0x38
0x009771fc: add      x0, sp, #0x50
0x00977200: mov      x8, x27
0x00977204: stp      x2, xzr, [sp, #0x50]
0x00977208: stp      xzr, x1, [sp, #0x60]
0x0097720c: bl       #0x391c08 ; _ZNK14QMessageLogger5debugEv ; _ZNK14QMessageLogger5debugEv
0x00977210: adrp     x1, #0x1bdf000
0x00977214: add      x19, sp, #0x20
0x00977218: add      x1, x1, #0x878
0x0097721c: mov      x0, x27
0x00977220: bl       #0x51bea8
0x00977224: mov      x1, x19
0x00977228: bl       #0x51bfc0
0x0097722c: mov      x0, x27
0x00977230: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x00977234: b        #0x9770d0
0x00977238: bti      j
0x0097723c: mov      x20, x0
0x00977240: mov      x0, x27
0x00977244: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x00977248: mov      x0, x19
0x0097724c: bl       #0x51bde0
0x00977250: mov      x0, x26
0x00977254: bl       #0x51d6c8
0x00977258: adrp     x0, #0x2b98000
0x0097725c: ldr      x0, [x0, #0xb78]
0x00977260: ldr      x2, [sp, #0x138]
0x00977264: ldr      x1, [x0]
0x00977268: subs     x2, x2, x1
0x0097726c: mov      x1, #0
0x00977270: b.eq     #0x9772c0
0x00977274: bl       #0x390978 ; __stack_chk_fail ; __stack_chk_fail
0x00977278: bti      j
0x0097727c: mov      x20, x0
0x00977280: b        #0x977250
0x00977284: bti      j
0x00977288: mov      x19, x0
0x0097728c: mov      x0, x27
0x00977290: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x00977294: mov      x0, x20
0x00977298: bl       #0x51c280
0x0097729c: adrp     x0, #0x2b98000
0x009772a0: ldr      x0, [x0, #0xb78]
0x009772a4: ldr      x2, [sp, #0x138]
0x009772a8: ldr      x1, [x0]
0x009772ac: subs     x2, x2, x1
0x009772b0: mov      x1, #0
0x009772b4: b.ne     #0x977274
0x009772b8: mov      x0, x19
0x009772bc: bl       #0x391548 ; _Unwind_Resume ; _Unwind_Resume
0x009772c0: mov      x0, x20
0x009772c4: bl       #0x391548 ; _Unwind_Resume ; _Unwind_Resume
0x009772c8: bti      j
0x009772cc: mov      x20, x0
0x009772d0: mov      x1, #0
0x009772d4: mov      x21, #2
0x009772d8: sub      x21, x21, x1
0x009772dc: mov      x0, #0x18
0x009772e0: madd     x21, x21, x0, x19
0x009772e4: cmp      x21, x19
0x009772e8: b.eq     #0x977258
0x009772ec: sub      x21, x21, #0x18
0x009772f0: mov      x0, x21
0x009772f4: bl       #0x51bde0
0x009772f8: b        #0x9772e4
0x009772fc: bti      j

RANGE 0x977560:0x9779c0
0x00977560: bl       #0x391558 ; _ZdlPv ; _ZdlPv
0x00977564: b        #0x977514
0x00977568: blr      x1
0x0097756c: b        #0x977494
0x00977570: paciasp  
0x00977574: stp      x29, x30, [sp, #-0x20]!
0x00977578: mov      x29, sp
0x0097757c: str      x19, [sp, #0x10]
0x00977580: mov      x19, x0
0x00977584: bl       #0x977440
0x00977588: mov      x0, x19
0x0097758c: mov      x1, #0x88
0x00977590: ldr      x19, [sp, #0x10]
0x00977594: ldp      x29, x30, [sp], #0x20
0x00977598: autiasp  
0x0097759c: b        #0x391ae8
0x009775a0: paciasp  
0x009775a4: sub      sp, sp, #0x100
0x009775a8: adrp     x1, #0x2b98000
0x009775ac: ldr      x1, [x1, #0xb78]
0x009775b0: stp      x29, x30, [sp, #0xa0]
0x009775b4: add      x29, sp, #0xa0
0x009775b8: ldr      x2, [x0]
0x009775bc: stp      x19, x20, [sp, #0xb0]
0x009775c0: stp      x21, x22, [sp, #0xc0]
0x009775c4: mov      x22, x0
0x009775c8: stp      x23, x24, [sp, #0xd0]
0x009775cc: add      x23, sp, #8
0x009775d0: mov      x8, x23
0x009775d4: stp      x25, x26, [sp, #0xe0]
0x009775d8: stp      x27, x28, [sp, #0xf0]
0x009775dc: ldr      x3, [x1]
0x009775e0: str      x3, [sp, #0x98]
0x009775e4: mov      x3, #0
0x009775e8: ldr      x1, [x2, #0x90]
0x009775ec: blr      x1
0x009775f0: add      x19, sp, #0x38
0x009775f4: mov      x0, x23
0x009775f8: mov      x8, x19
0x009775fc: bl       #0x391da8 ; _ZN7QString13toUtf8_helperERKS_ ; _ZN7QString13toUtf8_helperERKS_
0x00977600: add      x24, sp, #0x58
0x00977604: mov      x0, x19
0x00977608: mov      x8, x24
0x0097760c: bl       #0x391db8 ; _ZNK10QByteArray11toStdStringB5cxx11Ev ; _ZNK10QByteArray11toStdStringB5cxx11Ev
0x00977610: ldr      x0, [sp, #0x38]
0x00977614: cbz      x0, #0x977628
0x00977618: mov      w1, #-1
0x0097761c: ldaddal  w1, w1, [x0]
0x00977620: cmp      w1, #1
0x00977624: b.eq     #0x977760
0x00977628: mov      x0, #0x18
0x0097762c: bl       #0x3915d8 ; _Znwm ; _Znwm
0x00977630: mov      x20, x0
0x00977634: mov      x21, x0
0x00977638: ldp      x25, x0, [sp, #0x58]
0x0097763c: adrp     x2, #0x2a8f000
0x00977640: add      x2, x2, #0x4a0
0x00977644: add      x2, x2, #0xb8
0x00977648: str      x2, [x20], #8
0x0097764c: cmp      x25, #0
0x00977650: ccmp     x0, #0, #1, ne
0x00977654: b.ge     #0x977668
0x00977658: mov      x0, #0
0x0097765c: cbz      x25, #0x977668
0x00977660: mov      x0, x25
0x00977664: bl       #0x390948 ; strlen ; strlen
0x00977668: mov      x1, x25
0x0097766c: mov      x8, x19
0x00977670: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView ; _ZN7QString8fromUtf8E14QByteArrayView
0x00977674: mov      x1, x19
0x00977678: mov      x0, x20
0x0097767c: bl       #0x3921c8 ; _ZN9QFileInfoC1ERK7QString ; _ZN9QFileInfoC1ERK7QString
0x00977680: mov      x0, x19
0x00977684: add      x25, sp, #0x20
0x00977688: bl       #0x51bde0
0x0097768c: add      x27, x21, #0x10
0x00977690: adrp     x1, #0x1bdf000
0x00977694: mov      x8, x25
0x00977698: add      x1, x1, #0x890
0x0097769c: mov      x0, #0xe
0x009776a0: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView ; _ZN7QString8fromUtf8E14QByteArrayView
0x009776a4: mov      x8, x19
0x009776a8: mov      x0, x20
0x009776ac: bl       #0x3967e8 ; _ZNK9QFileInfo16completeBaseNameEv ; _ZNK9QFileInfo16completeBaseNameEv
0x009776b0: mov      x1, x19
0x009776b4: mov      x0, x25
0x009776b8: bl       #0x391d98 ; _ZN7QString6appendERKS_ ; _ZN7QString6appendERKS_
0x009776bc: mov      x1, x0
0x009776c0: mov      x0, x27
0x009776c4: bl       #0x3920d8 ; _ZN4QDirC1ERK7QString ; _ZN4QDirC1ERK7QString
0x009776c8: mov      x0, x19
0x009776cc: bl       #0x51bde0
0x009776d0: mov      x0, x25
0x009776d4: bl       #0x51bde0
0x009776d8: adrp     x26, #0x2b98000
0x009776dc: ldr      x26, [x26, #0xb78]
0x009776e0: mov      x0, x20
0x009776e4: bl       #0x394ed8 ; _ZNK9QFileInfo6existsEv ; _ZNK9QFileInfo6existsEv
0x009776e8: tbz      w0, #0, #0x977c30
0x009776ec: adrp     x26, #0x2b98000
0x009776f0: ldr      x26, [x26, #0xb78]
0x009776f4: mov      x8, x19
0x009776f8: mov      x0, x20
0x009776fc: bl       #0x394bb8 ; _ZNK9QFileInfo6suffixEv ; _ZNK9QFileInfo6suffixEv
0x00977700: ldr      x2, [sp, #0x48]
0x00977704: cmp      x2, #6
0x00977708: b.eq     #0x97776c
0x0097770c: mov      x0, x19
0x00977710: bl       #0x51bde0
0x00977714: mov      x0, #0x10
0x00977718: bl       #0x391598 ; __cxa_allocate_exception ; __cxa_allocate_exception
0x0097771c: adrp     x1, #0x1bdf000
0x00977720: mov      x28, x0
0x00977724: add      x1, x1, #0x8b8
0x00977728: bl       #0x392c28 ; _ZNSt13runtime_errorC1EPKc ; _ZNSt13runtime_errorC1EPKc
0x0097772c: adrp     x26, #0x2b98000
0x00977730: ldr      x26, [x26, #0xb78]
0x00977734: ldr      x0, [sp, #0x98]
0x00977738: ldr      x1, [x26]
0x0097773c: subs     x0, x0, x1
0x00977740: mov      x1, #0
0x00977744: b.ne     #0x977978
0x00977748: adrp     x2, #0x2b99000
0x0097774c: ldr      x2, [x2, #0x250]
0x00977750: mov      x0, x28
0x00977754: adrp     x1, #0x2b99000
0x00977758: ldr      x1, [x1, #0x258]
0x0097775c: bl       #0x3915a8 ; __cxa_throw ; __cxa_throw
0x00977760: ldr      x0, [sp, #0x38]
0x00977764: bl       #0x390968 ; free ; free
0x00977768: b        #0x977628
0x0097776c: ldr      x1, [sp, #0x40]
0x00977770: adrp     x3, #0x1c6b000
0x00977774: mov      x0, x2
0x00977778: add      x3, x3, #0x1d0
0x0097777c: bl       #0x391d18 ; _ZN9QtPrivate12equalStringsE11QStringViewS0_ ; _ZN9QtPrivate12equalStringsE11QStringViewS0_
0x00977780: tbz      w0, #0, #0x97770c
0x00977784: mov      x0, x19
0x00977788: bl       #0x51bde0
0x0097778c: mov      x0, x27
0x00977790: bl       #0x392fd8 ; _ZNK4QDir6existsEv ; _ZNK4QDir6existsEv
0x00977794: tbnz     w0, #0, #0x977888
0x00977798: adrp     x26, #0x2b98000
0x0097779c: ldr      x26, [x26, #0xb78]
0x009777a0: mov      x0, x27
0x009777a4: bl       #0x392fd8 ; _ZNK4QDir6existsEv ; _ZNK4QDir6existsEv
0x009777a8: tbz      w0, #0, #0x9777ec
0x009777ac: mov      x8, x19
0x009777b0: mov      x0, x27
0x009777b4: bl       #0x392fe8 ; _ZNK4QDir4pathEv ; _ZNK4QDir4pathEv
0x009777b8: add      x25, sp, #0x78
0x009777bc: mov      x0, x19
0x009777c0: mov      x8, x25
0x009777c4: bl       #0x51eba0
0x009777c8: mov      x0, x19
0x009777cc: bl       #0x51bde0
0x009777d0: ldr      x0, [sp, #0x78]
0x009777d4: bl       #0x3967f8 ; umount ; umount
0x009777d8: mov      x0, x25
0x009777dc: bl       #0x51c280
0x009777e0: mov      x0, x27
0x009777e4: bl       #0x396808 ; _ZN4QDir17removeRecursivelyEv ; _ZN4QDir17removeRecursivelyEv
0x009777e8: tbz      w0, #0, #0x977944
0x009777ec: adrp     x26, #0x2b98000
0x009777f0: ldr      x26, [x26, #0xb78]
0x009777f4: mov      x0, x21
0x009777f8: bl       #0x9a3f40
0x009777fc: tbz      w0, #0, #0x97797c
0x00977800: ldr      x19, [x22, #0x78]
0x00977804: str      x21, [x22, #0x78]
0x00977808: cbz      x19, #0x977838
0x0097780c: ldr      x1, [x19]
0x00977810: adrp     x0, #0x9a0000
0x00977814: add      x0, x0, #0x3e4
0x00977818: ldr      x1, [x1, #8]
0x0097781c: cmp      x1, x0
0x00977820: mov      x0, x19
0x00977824: b.ne     #0x97793c
0x00977828: bl       #0x9a01e8
0x0097782c: mov      x0, x19
0x00977830: mov      x1, #0x18
0x00977834: bl       #0x391ae8 ; _ZdlPvm ; _ZdlPvm
0x00977838: adrp     x26, #0x2b98000
0x0097783c: ldr      x26, [x26, #0xb78]
0x00977840: mov      x0, x24
0x00977844: bl       #0x51c280
0x00977848: mov      x0, x23
0x0097784c: bl       #0x51bde0
0x00977850: ldr      x0, [sp, #0x98]
0x00977854: ldr      x1, [x26]
0x00977858: subs     x0, x0, x1
0x0097785c: mov      x1, #0
0x00977860: b.ne     #0x977978
0x00977864: ldp      x29, x30, [sp, #0xa0]
0x00977868: ldp      x19, x20, [sp, #0xb0]
0x0097786c: ldp      x21, x22, [sp, #0xc0]
0x00977870: ldp      x23, x24, [sp, #0xd0]
0x00977874: ldp      x25, x26, [sp, #0xe0]
0x00977878: ldp      x27, x28, [sp, #0xf0]
0x0097787c: add      sp, sp, #0x100
0x00977880: autiasp  
0x00977884: ret      
0x00977888: adrp     x26, #0x2b98000
0x0097788c: ldr      x26, [x26, #0xb78]
0x00977890: mov      x8, x19
0x00977894: mov      x0, x27
0x00977898: mov      w2, #-1
0x0097789c: mov      w1, #0x6000
0x009778a0: bl       #0x393cc8 ; _ZNK4QDir9entryListE6QFlagsINS_6FilterEES0_INS_8SortFlagEE ; _ZNK4QDir9entryListE6QFlagsINS_6FilterEES0_INS_8SortFlagEE
0x009778a4: ldr      x0, [sp, #0x48]
0x009778a8: cmp      x0, #0
0x009778ac: mov      x0, x19
0x009778b0: b.le     #0x977934
0x009778b4: bl       #0x51d6c8
0x009778b8: bl       #0xc698cc
0x009778bc: add      x1, x0, #0x11
0x009778c0: ldrb     w1, [x1]
0x009778c4: tst      w1, #0xff
0x009778c8: b.eq     #0x977800
0x009778cc: ldr      x1, [x0, #8]
0x009778d0: mov      x2, #2
0x009778d4: mov      x28, sp
0x009778d8: mov      x0, x19
0x009778dc: adrp     x26, #0x2b98000
0x009778e0: ldr      x26, [x26, #0xb78]
0x009778e4: mov      x8, x28
0x009778e8: stp      x2, xzr, [sp, #0x38]
0x009778ec: stp      xzr, x1, [sp, #0x48]
0x009778f0: bl       #0x391c28 ; _ZNK14QMessageLogger7warningEv ; _ZNK14QMessageLogger7warningEv
0x009778f4: adrp     x1, #0x1bdf000
0x009778f8: mov      x0, x28
0x009778fc: add      x1, x1, #0x8d0
0x00977900: bl       #0x51bea8
0x00977904: mov      x19, x0
0x00977908: mov      x8, x25
0x0097790c: mov      x0, x27
0x00977910: bl       #0x392fe8 ; _ZNK4QDir4pathEv ; _ZNK4QDir4pathEv
0x00977914: mov      x1, x25
0x00977918: mov      x0, x19
0x0097791c: bl       #0x51bfc0
0x00977920: mov      x0, x25
0x00977924: bl       #0x51bde0
0x00977928: mov      x0, x28
0x0097792c: bl       #0x391c18 ; _ZN6QDebugD1Ev ; _ZN6QDebugD1Ev
0x00977930: b        #0x977800
0x00977934: bl       #0x51d6c8
0x00977938: b        #0x977798
0x0097793c: blr      x1
0x00977940: b        #0x977838
0x00977944: mov      x0, #0x10
0x00977948: bl       #0x391598 ; __cxa_allocate_exception ; __cxa_allocate_exception
0x0097794c: adrp     x1, #0x1bdf000
0x00977950: mov      x28, x0
0x00977954: add      x1, x1, #0x8f0
0x00977958: bl       #0x392c28 ; _ZNSt13runtime_errorC1EPKc ; _ZNSt13runtime_errorC1EPKc
0x0097795c: adrp     x26, #0x2b98000
0x00977960: ldr      x26, [x26, #0xb78]
0x00977964: ldr      x0, [sp, #0x98]
0x00977968: ldr      x1, [x26]
0x0097796c: subs     x0, x0, x1
0x00977970: mov      x1, #0
0x00977974: b.eq     #0x977aa8
0x00977978: bl       #0x390978 ; __stack_chk_fail ; __stack_chk_fail
0x0097797c: mov      x0, #0x10
0x00977980: bl       #0x391598 ; __cxa_allocate_exception ; __cxa_allocate_exception
0x00977984: adrp     x1, #0x1bdf000
0x00977988: mov      x28, x0
0x0097798c: add      x1, x1, #0x920
0x00977990: bl       #0x392c28 ; _ZNSt13runtime_errorC1EPKc ; _ZNSt13runtime_errorC1EPKc
0x00977994: ldr      x0, [sp, #0x98]
0x00977998: ldr      x1, [x26]
0x0097799c: subs     x0, x0, x1
0x009779a0: mov      x1, #0
0x009779a4: b.ne     #0x977978
0x009779a8: adrp     x2, #0x2b99000
0x009779ac: ldr      x2, [x2, #0x250]
0x009779b0: mov      x0, x28
0x009779b4: adrp     x1, #0x2b99000
0x009779b8: ldr      x1, [x1, #0x258]
0x009779bc: bl       #0x3915a8 ; __cxa_throw ; __cxa_throw

RANGE 0x97ac30:0x97ada0
0x0097ac30: stp      q0, q0, [x0, #0xa0]
0x0097ac34: bl       #0x3925c8 ; _ZN7QObjectC2EPS_ ; _ZN7QObjectC2EPS_
0x0097ac38: adrp     x2, #0x2b3c000
0x0097ac3c: add      x2, x2, #0x640
0x0097ac40: stp      xzr, xzr, [x19, #0x20]
0x0097ac44: add      x0, x2, #0x7a0
0x0097ac48: add      x2, x2, #0x840
0x0097ac4c: stp      x2, xzr, [x19, #0x10]
0x0097ac50: add      x2, x19, #0xa8
0x0097ac54: str      x0, [x19]
0x0097ac58: add      x23, sp, #0x18
0x0097ac5c: stp      xzr, xzr, [x19, #0x30]
0x0097ac60: adrp     x1, #0x1bdf000
0x0097ac64: mov      x8, x23
0x0097ac68: str      wzr, [x19, #0x40]
0x0097ac6c: add      x1, x1, #0x820
0x0097ac70: stp      xzr, xzr, [x19, #0x48]
0x0097ac74: mov      x0, #0xd
0x0097ac78: stp      xzr, xzr, [x19, #0x58]
0x0097ac7c: stp      xzr, xzr, [x19, #0x68]
0x0097ac80: stp      xzr, xzr, [x19, #0x78]
0x0097ac84: stp      xzr, xzr, [x19, #0x88]
0x0097ac88: stp      xzr, xzr, [x19, #0x98]
0x0097ac8c: stp      xzr, xzr, [x19, #0xa8]
0x0097ac90: stp      xzr, xzr, [x2, #0x10]
0x0097ac94: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView ; _ZN7QString8fromUtf8E14QByteArrayView
0x0097ac98: mov      x25, sp
0x0097ac9c: mov      x1, x23
0x0097aca0: mov      x0, x25
0x0097aca4: bl       #0x3920d8 ; _ZN4QDirC1ERK7QString ; _ZN4QDirC1ERK7QString
0x0097aca8: mov      x0, #0xe0
0x0097acac: bl       #0x3915d8 ; _Znwm ; _Znwm
0x0097acb0: mov      x20, x0
0x0097acb4: adrp     x1, #0x967000
0x0097acb8: add      x1, x1, #0xa2c
0x0097acbc: add      x24, x0, #4
0x0097acc0: mov      w0, #1
0x0097acc4: str      x1, [x20, #8]
0x0097acc8: str      w0, [x24]
0x0097accc: str      w0, [x20]
0x0097acd0: add      x19, x19, #0x10
0x0097acd4: add      x26, sp, #0x10
0x0097acd8: mov      x1, x22
0x0097acdc: mov      x0, x26
0x0097ace0: str      x19, [sp, #8]
0x0097ace4: bl       #0x394748 ; _ZN4QUrlC1ERKS_ ; _ZN4QUrlC1ERKS_
0x0097ace8: add      x19, sp, #0x30
0x0097acec: adrp     x1, #0x1bdf000
0x0097acf0: add      x22, x20, #0x10
0x0097acf4: mov      x8, x19
0x0097acf8: add      x1, x1, #0x858
0x0097acfc: mov      x0, #0x1f
0x0097ad00: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView ; _ZN7QString8fromUtf8E14QByteArrayView
0x0097ad04: mov      x4, x19
0x0097ad08: mov      x3, x25
0x0097ad0c: mov      x2, x26
0x0097ad10: add      x1, sp, #8
0x0097ad14: mov      x0, x22
0x0097ad18: bl       #0x97a288
0x0097ad1c: mov      x0, x19
0x0097ad20: bl       #0x51bde0
0x0097ad24: mov      x0, x26
0x0097ad28: bl       #0x392608 ; _ZN4QUrlD1Ev ; _ZN4QUrlD1Ev
0x0097ad2c: ldr      x0, [sp, #8]
0x0097ad30: cbz      x0, #0x97ad64
0x0097ad34: ldr      x2, [x0]
0x0097ad38: adrp     x1, #0xbbc000
0x0097ad3c: add      x1, x1, #0xd80
0x0097ad40: ldr      x2, [x2, #8]
0x0097ad44: cmp      x2, x1
0x0097ad48: b.ne     #0x97aea8
0x0097ad4c: sub      x19, x0, #0x10
0x0097ad50: mov      x0, x19
0x0097ad54: bl       #0xbbcbe0
0x0097ad58: mov      x0, x19
0x0097ad5c: mov      x1, #0xc8
0x0097ad60: bl       #0x391ae8 ; _ZdlPvm ; _ZdlPvm
0x0097ad64: adrp     x0, #0x971000
0x0097ad68: add      x0, x0, #0x360
0x0097ad6c: str      x0, [x20, #8]
0x0097ad70: mov      x1, x22
0x0097ad74: mov      x0, x20
0x0097ad78: mov      w2, #1
0x0097ad7c: bl       #0x392ca8 ; _ZN15QtSharedPointer20ExternalRefCountData16setQObjectSharedEPK7QObjectb ; _ZN15QtSharedPointer20ExternalRefCountData16setQObjectSharedEPK7QObjectb
0x0097ad80: ldr      w0, [x24]
0x0097ad84: cmp      w0, #0
0x0097ad88: b.le     #0x97ae90
0x0097ad8c: add      w2, w0, #1
0x0097ad90: mov      w1, w0
0x0097ad94: cas      w1, w2, [x24]
0x0097ad98: cmp      w1, w0
0x0097ad9c: b.ne     #0x97ad80

RANGE 0x9a3f40:0x9a4370
0x009a3f40: paciasp  
0x009a3f44: sub      sp, sp, #0xd0
0x009a3f48: adrp     x1, #0x2b98000
0x009a3f4c: ldr      x1, [x1, #0xb78]
0x009a3f50: stp      x29, x30, [sp, #0x90]
0x009a3f54: add      x29, sp, #0x90
0x009a3f58: stp      x19, x20, [sp, #0xa0]
0x009a3f5c: mov      x19, sp
0x009a3f60: add      x20, sp, #0x10
0x009a3f64: stp      x21, x22, [sp, #0xb0]
0x009a3f68: mov      x21, x0
0x009a3f6c: str      x23, [sp, #0xc0]
0x009a3f70: ldr      x0, [x1]
0x009a3f74: str      x0, [sp, #0x88]
0x009a3f78: mov      x0, #0
0x009a3f7c: mov      x1, #0
0x009a3f80: mov      x0, x19
0x009a3f84: bl       #0x394758 ; _ZN8QProcessC1EP7QObject
0x009a3f88: adrp     x1, #0x1be1000
0x009a3f8c: mov      x8, x20
0x009a3f90: add      x1, x1, #0x328
0x009a3f94: mov      x0, #0xe
0x009a3f98: bl       #0x391ba8 ; _ZN7QString8fromUtf8E14QByteArrayView
0x009a3f9c: add      x22, sp, #0x68
0x009a3fa0: add      x0, x21, #8
0x009a3fa4: mov      x8, x22
0x009a3fa8: bl       #0x3950e8 ; _ZNK9QFileInfo16absoluteFilePathEv
0x009a3fac: add      x21, sp, #0x28
0x009a3fb0: mov      w4, #1
0x009a3fb4: mov      x3, #1
0x009a3fb8: mov      x2, #0x10
0x009a3fbc: mov      x1, #0x18
0x009a3fc0: mov      x0, x21
0x009a3fc4: bl       #0x392bf8 ; _ZN10QArrayData8allocateEPPS_xxxNS_16AllocationOptionE
0x009a3fc8: stp      x0, xzr, [sp, #0x30]
0x009a3fcc: mov      x4, #1
0x009a3fd0: ldp      x1, x3, [sp, #0x68]
0x009a3fd4: stp      x1, x3, [x0]
0x009a3fd8: ldr      x2, [sp, #0x78]
0x009a3fdc: str      x2, [x0, #0x10]
0x009a3fe0: cbz      x1, #0x9a3ff0
0x009a3fe4: ldaddal  w4, w4, [x1]
0x009a3fe8: ldr      x4, [sp, #0x38]
0x009a3fec: add      x4, x4, #1
0x009a3ff0: mov      x2, x21
0x009a3ff4: mov      x1, x20
0x009a3ff8: mov      x0, x19
0x009a3ffc: mov      w3, #3
0x009a4000: str      x4, [sp, #0x38]
0x009a4004: bl       #0x394768 ; _ZN8QProcess5startERK7QStringRK5QListIS0_E6QFlagsIN13QIODeviceBase12OpenModeFlagEE
0x009a4008: mov      x0, x21
0x009a400c: bl       #0x51d6c8
0x009a4010: mov      x0, x22
0x009a4014: bl       #0x51bde0
0x009a4018: mov      x0, x20
0x009a401c: bl       #0x51bde0
0x009a4020: mov      x0, x19
0x009a4024: mov      w1, #0x7530
0x009a4028: bl       #0x394778 ; _ZN8QProcess15waitForFinishedEi
0x009a402c: and      w23, w0, #0xff
0x009a4030: tbz      w0, #0, #0x9a40ac
0x009a4034: mov      x0, x19
0x009a4038: bl       #0x3969c8 ; _ZNK8QProcess10exitStatusEv
0x009a403c: cbnz     w0, #0x9a4090
0x009a4040: mov      x0, x19
0x009a4044: bl       #0x3969d8 ; _ZNK8QProcess8exitCodeEv
0x009a4048: cbnz     w0, #0x9a4090
0x009a404c: mov      x0, x19
0x009a4050: bl       #0x394798 ; _ZN8QProcessD1Ev
0x009a4054: adrp     x0, #0x2b98000
0x009a4058: ldr      x0, [x0, #0xb78]
0x009a405c: ldr      x2, [sp, #0x88]
0x009a4060: ldr      x1, [x0]
0x009a4064: subs     x2, x2, x1
0x009a4068: mov      x1, #0
0x009a406c: b.ne     #0x9a4130
0x009a4070: ldp      x29, x30, [sp, #0x90]
0x009a4074: mov      w0, w23
0x009a4078: ldp      x19, x20, [sp, #0xa0]
0x009a407c: ldp      x21, x22, [sp, #0xb0]
0x009a4080: ldr      x23, [sp, #0xc0]
0x009a4084: add      sp, sp, #0xd0
0x009a4088: autiasp  
0x009a408c: ret      
0x009a4090: bl       #0xc698cc
0x009a4094: add      x1, x0, #0x11
0x009a4098: ldrb     w1, [x1]
0x009a409c: tst      w1, #0xff
0x009a40a0: b.ne     #0x9a4134
0x009a40a4: mov      w23, #0
0x009a40a8: b        #0x9a404c
0x009a40ac: bl       #0xc698cc
0x009a40b0: add      x1, x0, #0x11
0x009a40b4: ldrb     w1, [x1]
0x009a40b8: tst      w1, #0xff
0x009a40bc: b.eq     #0x9a40a4
0x009a40c0: ldr      x1, [x0, #8]
0x009a40c4: mov      x2, #2
0x009a40c8: mov      x8, x20
0x009a40cc: mov      x0, x21
0x009a40d0: stp      x2, xzr, [sp, #0x28]
0x009a40d4: stp      xzr, x1, [sp, #0x38]
0x009a40d8: bl       #0x391c28 ; _ZNK14QMessageLogger7warningEv
0x009a40dc: adrp     x1, #0x1be1000
0x009a40e0: mov      x0, x20
0x009a40e4: add      x1, x1, #0x338
0x009a40e8: bl       #0x51bea8
0x009a40ec: mov      x0, x20
0x009a40f0: mov      w23, #0
0x009a40f4: bl       #0x391c18 ; _ZN6QDebugD1Ev
0x009a40f8: b        #0x9a404c
0x009a40fc: bti      j
0x009a4100: mov      x21, x0
0x009a4104: mov      x0, x20
0x009a4108: bl       #0x51bde0
0x009a410c: mov      x0, x19
0x009a4110: bl       #0x394798 ; _ZN8QProcessD1Ev
0x009a4114: adrp     x0, #0x2b98000
0x009a4118: ldr      x0, [x0, #0xb78]
0x009a411c: ldr      x2, [sp, #0x88]
0x009a4120: ldr      x1, [x0]
0x009a4124: subs     x2, x2, x1
0x009a4128: mov      x1, #0
0x009a412c: b.eq     #0x9a41f0
0x009a4130: bl       #0x390978 ; __stack_chk_fail
0x009a4134: ldr      x1, [x0, #8]
0x009a4138: mov      x2, #2
0x009a413c: mov      x8, x20
0x009a4140: mov      x0, x21
0x009a4144: stp      x2, xzr, [sp, #0x28]
0x009a4148: stp      xzr, x1, [sp, #0x38]
0x009a414c: bl       #0x391c28 ; _ZNK14QMessageLogger7warningEv
0x009a4150: mov      x0, x19
0x009a4154: bl       #0x3969d8 ; _ZNK8QProcess8exitCodeEv
0x009a4158: mov      x8, x22
0x009a415c: bl       #0x67f668
0x009a4160: adrp     x1, #0x1be1000
0x009a4164: mov      x0, x22
0x009a4168: add      x1, x1, #0x360
0x009a416c: bl       #0x1895588
0x009a4170: add      x23, sp, #0x48
0x009a4174: mov      x1, x0
0x009a4178: mov      x0, x23
0x009a417c: bl       #0x51fc20
0x009a4180: ldp      x1, x2, [sp, #0x48]
0x009a4184: mov      x0, x20
0x009a4188: mov      w3, #0
0x009a418c: bl       #0x3936b8 ; _ZN6QDebug12putByteArrayEPKcmNS_13Latin1ContentE
0x009a4190: ldr      x0, [sp, #0x10]
0x009a4194: ldrb     w1, [x0, #0x30]
0x009a4198: tbz      w1, #0, #0x9a41a4
0x009a419c: mov      w1, #0x20
0x009a41a0: bl       #0x391bd8 ; _ZN11QTextStreamlsEc
0x009a41a4: mov      x0, x23
0x009a41a8: bl       #0x51c280
0x009a41ac: mov      x0, x22
0x009a41b0: bl       #0x51c280
0x009a41b4: b        #0x9a40ec
0x009a41b8: bti      j
0x009a41bc: mov      x21, x0
0x009a41c0: b        #0x9a4208
0x009a41c4: bti      j
0x009a41c8: mov      x21, x0
0x009a41cc: b        #0x9a410c
0x009a41d0: bti      j
0x009a41d4: mov      x1, x0
0x009a41d8: mov      x0, x21
0x009a41dc: mov      x21, x1
0x009a41e0: bl       #0x51d6c8
0x009a41e4: mov      x0, x22
0x009a41e8: bl       #0x51bde0
0x009a41ec: b        #0x9a4104
0x009a41f0: mov      x0, x21
0x009a41f4: bl       #0x391548 ; _Unwind_Resume
0x009a41f8: bti      j
0x009a41fc: mov      x21, x0
0x009a4200: mov      x0, x22
0x009a4204: bl       #0x51c280
0x009a4208: mov      x0, x20
0x009a420c: bl       #0x391c18 ; _ZN6QDebugD1Ev
0x009a4210: b        #0x9a410c
0x009a4214: bti      j
0x009a4218: mov      x21, x0
0x009a421c: b        #0x9a4208
0x009a4220: bti      j
0x009a4224: mov      x21, x0
0x009a4228: mov      x0, x23
0x009a422c: bl       #0x51c280
0x009a4230: b        #0x9a4200
0x009a4234: nop      
0x009a4238: nop      
0x009a423c: nop      
0x009a4240: paciasp  
0x009a4244: sub      sp, sp, #0x70
0x009a4248: adrp     x2, #0x2b98000
0x009a424c: ldr      x2, [x2, #0xb78]
0x009a4250: stp      x29, x30, [sp, #0x40]
0x009a4254: add      x29, sp, #0x40
0x009a4258: stp      x19, x20, [sp, #0x50]
0x009a425c: add      x20, sp, #8
0x009a4260: stp      x21, x22, [sp, #0x60]
0x009a4264: mov      x22, x1
0x009a4268: mov      x1, x0
0x009a426c: ldr      x0, [x2]
0x009a4270: str      x0, [sp, #0x38]
0x009a4274: mov      x0, #0
0x009a4278: mov      w2, #0
0x009a427c: mov      x0, x20
0x009a4280: add      x21, sp, #0x20
0x009a4284: bl       #0x3925e8 ; _ZN4QUrlC1ERK7QStringNS_11ParsingModeE
0x009a4288: mov      x0, x20
0x009a428c: mov      x8, x21
0x009a4290: bl       #0x394828 ; _ZNK4QUrl11toLocalFileEv
0x009a4294: add      x19, sp, #0x10
0x009a4298: mov      x1, x21
0x009a429c: mov      x0, x19
0x009a42a0: bl       #0x391ff8 ; _ZN5QFileC1ERK7QString
0x009a42a4: ldr      x2, [sp, #0x20]
0x009a42a8: cbz      x2, #0x9a42bc
0x009a42ac: mov      w0, #-1
0x009a42b0: ldaddal  w0, w0, [x2]
0x009a42b4: cmp      w0, #1
0x009a42b8: b.eq     #0x9a4318
0x009a42bc: mov      x0, x20
0x009a42c0: bl       #0x392608 ; _ZN4QUrlD1Ev
0x009a42c4: mov      x0, x19
0x009a42c8: mov      w1, #2
0x009a42cc: bl       #0x392008 ; _ZN5QFile4openE6QFlagsIN13QIODeviceBase12OpenModeFlagEE
0x009a42d0: and      w20, w0, #0xff
0x009a42d4: tbnz     w0, #0, #0x9a4324
0x009a42d8: mov      x0, x19
0x009a42dc: bl       #0x392018 ; _ZN5QFileD1Ev
0x009a42e0: adrp     x0, #0x2b98000
0x009a42e4: ldr      x0, [x0, #0xb78]
0x009a42e8: ldr      x2, [sp, #0x38]
0x009a42ec: ldr      x1, [x0]
0x009a42f0: subs     x2, x2, x1
0x009a42f4: mov      x1, #0
0x009a42f8: b.ne     #0x9a439c
0x009a42fc: ldp      x29, x30, [sp, #0x40]
0x009a4300: mov      w0, w20
0x009a4304: ldp      x19, x20, [sp, #0x50]
0x009a4308: ldp      x21, x22, [sp, #0x60]
0x009a430c: add      sp, sp, #0x70
0x009a4310: autiasp  
0x009a4314: ret      
0x009a4318: ldr      x0, [sp, #0x20]
0x009a431c: bl       #0x390968 ; free
0x009a4320: b        #0x9a42bc
0x009a4324: mov      x0, x22
0x009a4328: mov      x8, x21
0x009a432c: bl       #0x391da8 ; _ZN7QString13toUtf8_helperERKS_
0x009a4330: mov      x1, x21
0x009a4334: mov      x0, x19
0x009a4338: bl       #0x392288 ; _ZN9QIODevice5writeERK10QByteArray
0x009a433c: ldr      x1, [sp, #0x20]
0x009a4340: cmn      x0, #1
0x009a4344: cset     w20, ne
0x009a4348: cbz      x1, #0x9a42d8
0x009a434c: mov      w0, #-1
0x009a4350: ldaddal  w0, w0, [x1]
0x009a4354: cmp      w0, #1
0x009a4358: b.ne     #0x9a42d8
0x009a435c: ldr      x0, [sp, #0x20]
0x009a4360: bl       #0x390968 ; free
0x009a4364: b        #0x9a42d8
0x009a4368: bti      j
0x009a436c: mov      x19, x0
