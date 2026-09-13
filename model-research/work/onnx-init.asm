
/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static/processor/libNNPredictionDispatcher_on.so:	file format elf64-littleaarch64

Disassembly of section .text:

000000000043ac40 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>:
  43ac40: a9b37bfd     	stp	x29, x30, [sp, #-0xd0]!
  43ac44: f0007c64     	adrp	x4, 0x13c9000 <_GLOBAL_OFFSET_TABLE_+0x6880>
  43ac48: 910003fd     	mov	x29, sp
  43ac4c: f9440484     	ldr	x4, [x4, #0x808]
  43ac50: a90153f3     	stp	x19, x20, [sp, #0x10]
  43ac54: aa0003f3     	mov	x19, x0
  43ac58: f9400080     	ldr	x0, [x4]
  43ac5c: f90067e0     	str	x0, [sp, #0xc8]
  43ac60: d2800000     	mov	x0, #0x0                // =0
  43ac64: a9025bf5     	stp	x21, x22, [sp, #0x20]
  43ac68: 90007d35     	adrp	x21, 0x13de000 <onnx::OpSchemaRegistry::Instance()::instance+0x218>
  43ac6c: d2800900     	mov	x0, #0x48               // =72
  43ac70: a90363f7     	stp	x23, x24, [sp, #0x30]
  43ac74: aa0103f7     	mov	x23, x1
  43ac78: aa0303f8     	mov	x24, x3
  43ac7c: a9046bf9     	stp	x25, x26, [sp, #0x40]
  43ac80: 910223f9     	add	x25, sp, #0x88
  43ac84: a90573fb     	stp	x27, x28, [sp, #0x50]
  43ac88: b90067e2     	str	w2, [sp, #0x64]
  43ac8c: 97fee8a5     	bl	0x3f4f20 <_Znwm@plt>
  43ac90: f941aaa3     	ldr	x3, [x21, #0x350]
  43ac94: aa0003f4     	mov	x20, x0
  43ac98: aa1903e2     	mov	x2, x25
  43ac9c: 52800001     	mov	w1, #0x0                // =0
  43aca0: 52800020     	mov	w0, #0x1                // =1
  43aca4: f9411463     	ldr	x3, [x3, #0x228]
  43aca8: a9007e9f     	stp	xzr, xzr, [x20]
  43acac: a9017e9f     	stp	xzr, xzr, [x20, #0x10]
  43acb0: a9027e9f     	stp	xzr, xzr, [x20, #0x20]
  43acb4: a9037e9f     	stp	xzr, xzr, [x20, #0x30]
  43acb8: f900229f     	str	xzr, [x20, #0x40]
  43acbc: d63f0060     	blr	x3
  43acc0: b50018e0     	cbnz	x0, 0x43afdc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x39c>
  43acc4: aa1303f6     	mov	x22, x19
  43acc8: 9101427a     	add	x26, x19, #0x50
  43accc: 9101a27b     	add	x27, x19, #0x68
  43acd0: 91020262     	add	x2, x19, #0x80
  43acd4: 9102627c     	add	x28, x19, #0x98
  43acd8: 91008265     	add	x5, x19, #0x20
  43acdc: f80086d4     	str	x20, [x22], #0x8
  43ace0: 9100e266     	add	x6, x19, #0x38
  43ace4: f900067f     	str	xzr, [x19, #0x8]
  43ace8: 9102c261     	add	x1, x19, #0xb0
  43acec: a900fedf     	stp	xzr, xzr, [x22, #0x8]
  43acf0: d2800100     	mov	x0, #0x8                // =8
  43acf4: a9027e7f     	stp	xzr, xzr, [x19, #0x20]
  43acf8: a9037e7f     	stp	xzr, xzr, [x19, #0x30]
  43acfc: a9047e7f     	stp	xzr, xzr, [x19, #0x40]
  43ad00: f9002a7f     	str	xzr, [x19, #0x50]
  43ad04: a900ff5f     	stp	xzr, xzr, [x26, #0x8]
  43ad08: f900367f     	str	xzr, [x19, #0x68]
  43ad0c: a900ff7f     	stp	xzr, xzr, [x27, #0x8]
  43ad10: f900427f     	str	xzr, [x19, #0x80]
  43ad14: a900fc5f     	stp	xzr, xzr, [x2, #0x8]
  43ad18: a9071be5     	stp	x5, x6, [sp, #0x70]
  43ad1c: f9004e7f     	str	xzr, [x19, #0x98]
  43ad20: f94047e5     	ldr	x5, [sp, #0x88]
  43ad24: f9000285     	str	x5, [x20]
  43ad28: a900fe9f     	stp	xzr, xzr, [x20, #0x8]
  43ad2c: f900079f     	str	xzr, [x28, #0x8]
  43ad30: a901fe9f     	stp	xzr, xzr, [x20, #0x18]
  43ad34: a902fe9f     	stp	xzr, xzr, [x20, #0x28]
  43ad38: f9001e9f     	str	xzr, [x20, #0x38]
  43ad3c: f900229f     	str	xzr, [x20, #0x40]
  43ad40: f9000b9f     	str	xzr, [x28, #0x10]
  43ad44: f9005a7f     	str	xzr, [x19, #0xb0]
  43ad48: a900fc3f     	stp	xzr, xzr, [x1, #0x8]
  43ad4c: 97fee875     	bl	0x3f4f20 <_Znwm@plt>
  43ad50: f941aaa3     	ldr	x3, [x21, #0x350]
  43ad54: aa0003f4     	mov	x20, x0
  43ad58: b0006921     	adrp	x1, 0x115f000 <typeinfo name for onnx::SoftmaxFamilyDocGenerator(char const*, char const*, char const*)::'lambda'(onnx::OpSchema&)+0x4cf0>
  43ad5c: 91030021     	add	x1, x1, #0xc0
  43ad60: aa0003e2     	mov	x2, x0
  43ad64: 52800040     	mov	w0, #0x2                // =2
  43ad68: f9400c63     	ldr	x3, [x3, #0x18]
  43ad6c: f900029f     	str	xzr, [x20]
  43ad70: d63f0060     	blr	x3
  43ad74: aa0003e1     	mov	x1, x0
  43ad78: b50012c0     	cbnz	x0, 0x43afd0 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x390>
  43ad7c: f941aaa2     	ldr	x2, [x21, #0x350]
  43ad80: 52800021     	mov	w1, #0x1                // =1
  43ad84: f9400280     	ldr	x0, [x20]
  43ad88: f9424442     	ldr	x2, [x2, #0x488]
  43ad8c: d63f0040     	blr	x2
  43ad90: aa0003e1     	mov	x1, x0
  43ad94: b5001180     	cbnz	x0, 0x43afc4 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x384>
  43ad98: f9400260     	ldr	x0, [x19]
  43ad9c: f941aaa1     	ldr	x1, [x21, #0x350]
  43ada0: f9400402     	ldr	x2, [x0, #0x8]
  43ada4: f9000414     	str	x20, [x0, #0x8]
  43ada8: b4000142     	cbz	x2, 0x43add0 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x190>
  43adac: f9400040     	ldr	x0, [x2]
  43adb0: f90037e2     	str	x2, [sp, #0x68]
  43adb4: f9417021     	ldr	x1, [x1, #0x2e0]
  43adb8: d63f0020     	blr	x1
  43adbc: f94037e2     	ldr	x2, [sp, #0x68]
  43adc0: d2800101     	mov	x1, #0x8                // =8
  43adc4: aa0203e0     	mov	x0, x2
  43adc8: 97fee3f6     	bl	0x3f3da0 <_ZdlPvm@plt>
  43adcc: f941aaa1     	ldr	x1, [x21, #0x350]
  43add0: f90043ff     	str	xzr, [sp, #0x80]
  43add4: f9402821     	ldr	x1, [x1, #0x50]
  43add8: 910203e0     	add	x0, sp, #0x80
  43addc: d63f0020     	blr	x1
  43ade0: aa0003e1     	mov	x1, x0
  43ade4: b5001040     	cbnz	x0, 0x43afec <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3ac>
  43ade8: 900061e1     	adrp	x1, 0x1076000 <typeinfo name for zplane::VectorView<long const>+0x40>
  43adec: aa1803e0     	mov	x0, x24
  43adf0: 91008021     	add	x1, x1, #0x20
  43adf4: 97ff3b33     	bl	0x409ac0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@plt>
  43adf8: 340007c0     	cbz	w0, 0x43aef0 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x2b0>
  43adfc: f941aaa2     	ldr	x2, [x21, #0x350]
  43ae00: b94067e1     	ldr	w1, [sp, #0x64]
  43ae04: f94043e0     	ldr	x0, [sp, #0x80]
  43ae08: f9406042     	ldr	x2, [x2, #0xc0]
  43ae0c: d63f0040     	blr	x2
  43ae10: aa0003e1     	mov	x1, x0
  43ae14: b5000fa0     	cbnz	x0, 0x43b008 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3c8>
  43ae18: f9400261     	ldr	x1, [x19]
  43ae1c: aa1703e0     	mov	x0, x23
  43ae20: f9400439     	ldr	x25, [x1, #0x8]
  43ae24: 97ff1a1f     	bl	0x4016a0 <_ZN6zplane22NNPredictionDispatcher9ONNXModel7getDataEv@plt>
  43ae28: aa0003e1     	mov	x1, x0
  43ae2c: aa1703e0     	mov	x0, x23
  43ae30: aa0103f7     	mov	x23, x1
  43ae34: 97ff509b     	bl	0x40f0a0 <_ZNK6zplane22NNPredictionDispatcher9ONNXModel7getSizeEv@plt>
  43ae38: aa0003f8     	mov	x24, x0
  43ae3c: d2800100     	mov	x0, #0x8                // =8
  43ae40: 97fee838     	bl	0x3f4f20 <_Znwm@plt>
  43ae44: f941aaa4     	ldr	x4, [x21, #0x350]
  43ae48: aa0003f4     	mov	x20, x0
  43ae4c: f94043e3     	ldr	x3, [sp, #0x80]
  43ae50: aa1703e1     	mov	x1, x23
  43ae54: f9402085     	ldr	x5, [x4, #0x40]
  43ae58: aa0003e4     	mov	x4, x0
  43ae5c: f9400320     	ldr	x0, [x25]
  43ae60: f900029f     	str	xzr, [x20]
  43ae64: aa1803e2     	mov	x2, x24
  43ae68: d63f00a0     	blr	x5
  43ae6c: aa0003e1     	mov	x1, x0
  43ae70: b5000c40     	cbnz	x0, 0x43aff8 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3b8>
  43ae74: f9400260     	ldr	x0, [x19]
  43ae78: f9400817     	ldr	x23, [x0, #0x10]
  43ae7c: f9000814     	str	x20, [x0, #0x10]
  43ae80: b4000117     	cbz	x23, 0x43aea0 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x260>
  43ae84: f941aaa1     	ldr	x1, [x21, #0x350]
  43ae88: f94002e0     	ldr	x0, [x23]
  43ae8c: f9417c21     	ldr	x1, [x1, #0x2f8]
  43ae90: d63f0020     	blr	x1
  43ae94: aa1703e0     	mov	x0, x23
  43ae98: d2800101     	mov	x1, #0x8                // =8
  43ae9c: 97fee3c1     	bl	0x3f3da0 <_ZdlPvm@plt>
  43aea0: aa1303e0     	mov	x0, x19
  43aea4: 97fef0eb     	bl	0x3f7250 <_ZN6zplane22NNPredictionDispatcher8ONNXImpl4initEv@plt>
  43aea8: f941aaa1     	ldr	x1, [x21, #0x350]
  43aeac: f94043e0     	ldr	x0, [sp, #0x80]
  43aeb0: f9419021     	ldr	x1, [x1, #0x320]
  43aeb4: d63f0020     	blr	x1
  43aeb8: f0007c60     	adrp	x0, 0x13c9000 <_GLOBAL_OFFSET_TABLE_+0x6880>
  43aebc: f9440400     	ldr	x0, [x0, #0x808]
  43aec0: f94067e1     	ldr	x1, [sp, #0xc8]
  43aec4: f9400002     	ldr	x2, [x0]
  43aec8: eb020021     	subs	x1, x1, x2
  43aecc: d2800002     	mov	x2, #0x0                // =0
  43aed0: 540009a1     	b.ne	0x43b004 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3c4>
  43aed4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  43aed8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  43aedc: a94363f7     	ldp	x23, x24, [sp, #0x30]
  43aee0: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  43aee4: a94573fb     	ldp	x27, x28, [sp, #0x50]
  43aee8: a8cd7bfd     	ldp	x29, x30, [sp], #0xd0
  43aeec: d65f03c0     	ret
  43aef0: f941aaa4     	ldr	x4, [x21, #0x350]
  43aef4: 910243e0     	add	x0, sp, #0x90
  43aef8: aa0003e1     	mov	x1, x0
  43aefc: 9100c003     	add	x3, x0, #0x30
  43af00: f90037e1     	str	x1, [sp, #0x68]
  43af04: d2800022     	mov	x2, #0x1                // =1
  43af08: f9400301     	ldr	x1, [x24]
  43af0c: 1e2e1000     	fmov	s0, #1.00000000
  43af10: f94043e0     	ldr	x0, [sp, #0x80]
  43af14: f9436085     	ldr	x5, [x4, #0x6c0]
  43af18: a9090be3     	stp	x3, x2, [sp, #0x90]
  43af1c: d2800004     	mov	x4, #0x0                // =0
  43af20: a90a7fff     	stp	xzr, xzr, [sp, #0xa0]
  43af24: d2800003     	mov	x3, #0x0                // =0
  43af28: d2800002     	mov	x2, #0x0                // =0
  43af2c: a90bffff     	stp	xzr, xzr, [sp, #0xb8]
  43af30: bd00b3e0     	str	s0, [sp, #0xb0]
  43af34: d63f00a0     	blr	x5
  43af38: aa0003e1     	mov	x1, x0
  43af3c: b50006c0     	cbnz	x0, 0x43b014 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3d4>
  43af40: f94053f8     	ldr	x24, [sp, #0xa0]
  43af44: b4000298     	cbz	x24, 0x43af94 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x354>
  43af48: f9401700     	ldr	x0, [x24, #0x28]
  43af4c: 9100e301     	add	x1, x24, #0x38
  43af50: f9400314     	ldr	x20, [x24]
  43af54: eb01001f     	cmp	x0, x1
  43af58: 54000040     	b.eq	0x43af60 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x320>
  43af5c: 97ff0f41     	bl	0x3fec60 <_ZdlPv@plt>
  43af60: f9400700     	ldr	x0, [x24, #0x8]
  43af64: 91006301     	add	x1, x24, #0x18
  43af68: eb01001f     	cmp	x0, x1
  43af6c: 540000e0     	b.eq	0x43af88 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x348>
  43af70: 97ff0f3c     	bl	0x3fec60 <_ZdlPv@plt>
  43af74: aa1803e0     	mov	x0, x24
  43af78: 97ff0f3a     	bl	0x3fec60 <_ZdlPv@plt>
  43af7c: b40000d4     	cbz	x20, 0x43af94 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x354>
  43af80: aa1403f8     	mov	x24, x20
  43af84: 17fffff1     	b	0x43af48 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x308>
  43af88: aa1803e0     	mov	x0, x24
  43af8c: 97ff0f35     	bl	0x3fec60 <_ZdlPv@plt>
  43af90: b5ffff94     	cbnz	x20, 0x43af80 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x340>
  43af94: a9490be0     	ldp	x0, x2, [sp, #0x90]
  43af98: 52800001     	mov	w1, #0x0                // =0
  43af9c: d37df042     	lsl	x2, x2, #3
  43afa0: 97fefaa8     	bl	0x3f9a40 <memset@plt>
  43afa4: f94037e1     	ldr	x1, [sp, #0x68]
  43afa8: a90a7fff     	stp	xzr, xzr, [sp, #0xa0]
  43afac: f9404be0     	ldr	x0, [sp, #0x90]
  43afb0: 9100c021     	add	x1, x1, #0x30
  43afb4: eb01001f     	cmp	x0, x1
  43afb8: 54fff220     	b.eq	0x43adfc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x1bc>
  43afbc: 97ff0f29     	bl	0x3fec60 <_ZdlPv@plt>
  43afc0: 17ffff8f     	b	0x43adfc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x1bc>
  43afc4: 910243e0     	add	x0, sp, #0x90
  43afc8: f9004be1     	str	x1, [sp, #0x90]
  43afcc: 9400089b     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43afd0: 910243e0     	add	x0, sp, #0x90
  43afd4: f9004be1     	str	x1, [sp, #0x90]
  43afd8: 94000898     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43afdc: aa0003e1     	mov	x1, x0
  43afe0: 910243e0     	add	x0, sp, #0x90
  43afe4: f9004be1     	str	x1, [sp, #0x90]
  43afe8: 94000894     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43afec: 910243e0     	add	x0, sp, #0x90
  43aff0: f9004be1     	str	x1, [sp, #0x90]
  43aff4: 94000891     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43aff8: 910243e0     	add	x0, sp, #0x90
  43affc: f9004be1     	str	x1, [sp, #0x90]
  43b000: 9400088e     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43b004: 97ff540f     	bl	0x410040 <__stack_chk_fail@plt>
  43b008: 910243e0     	add	x0, sp, #0x90
  43b00c: f9004be1     	str	x1, [sp, #0x90]
  43b010: 9400088a     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43b014: aa1903e0     	mov	x0, x25
  43b018: f90047e1     	str	x1, [sp, #0x88]
  43b01c: 94000887     	bl	0x43d238 <Ort::detail::ThrowStatus(Ort::Status const&)>
  43b020: aa0003f7     	mov	x23, x0
  43b024: 1400000d     	b	0x43b058 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x418>
  43b028: f941aaa1     	ldr	x1, [x21, #0x350]
  43b02c: aa0003f7     	mov	x23, x0
  43b030: f9404be0     	ldr	x0, [sp, #0x90]
  43b034: f9417421     	ldr	x1, [x1, #0x2e8]
  43b038: d63f0020     	blr	x1
  43b03c: f941aaa1     	ldr	x1, [x21, #0x350]
  43b040: f9400280     	ldr	x0, [x20]
  43b044: f9417021     	ldr	x1, [x1, #0x2e0]
  43b048: d63f0020     	blr	x1
  43b04c: aa1403e0     	mov	x0, x20
  43b050: d2800101     	mov	x1, #0x8                // =8
  43b054: 97fee353     	bl	0x3f3da0 <_ZdlPvm@plt>
  43b058: f9405a60     	ldr	x0, [x19, #0xb0]
  43b05c: b4000040     	cbz	x0, 0x43b064 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x424>
  43b060: 97ff0f00     	bl	0x3fec60 <_ZdlPv@plt>
  43b064: aa1c03e0     	mov	x0, x28
  43b068: 97fee9d6     	bl	0x3f57c0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev@plt>
  43b06c: f9404260     	ldr	x0, [x19, #0x80]
  43b070: b4000040     	cbz	x0, 0x43b078 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x438>
  43b074: 97ff0efb     	bl	0x3fec60 <_ZdlPv@plt>
  43b078: aa1b03e0     	mov	x0, x27
  43b07c: 97fee9d1     	bl	0x3f57c0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev@plt>
  43b080: aa1a03e0     	mov	x0, x26
  43b084: 97fee67f     	bl	0x3f4a80 <_ZNSt6vectorIS_IlSaIlEESaIS1_EED1Ev@plt>
  43b088: f9403fe0     	ldr	x0, [sp, #0x78]
  43b08c: 97fee67d     	bl	0x3f4a80 <_ZNSt6vectorIS_IlSaIlEESaIS1_EED1Ev@plt>
  43b090: f9403be0     	ldr	x0, [sp, #0x70]
  43b094: 97ff5bbf     	bl	0x411f90 <_ZNSt6vectorIS_ImSaImEESaIS1_EED1Ev@plt>
  43b098: aa1603e0     	mov	x0, x22
  43b09c: 97ff5bbd     	bl	0x411f90 <_ZNSt6vectorIS_ImSaImEESaIS1_EED1Ev@plt>
  43b0a0: f9400260     	ldr	x0, [x19]
  43b0a4: b4000040     	cbz	x0, 0x43b0ac <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x46c>
  43b0a8: 97fff80c     	bl	0x4390d8 <std::default_delete<zplane::NNPredictionDispatcher::ONNXImpl::Impl>::operator()(zplane::NNPredictionDispatcher::ONNXImpl::Impl*) const (.isra.0)>
  43b0ac: aa1703e0     	mov	x0, x23
  43b0b0: 97ff1b40     	bl	0x401db0 <_Unwind_Resume@plt>
  43b0b4: f941aaa1     	ldr	x1, [x21, #0x350]
  43b0b8: aa0003f7     	mov	x23, x0
  43b0bc: f9404be0     	ldr	x0, [sp, #0x90]
  43b0c0: f9417421     	ldr	x1, [x1, #0x2e8]
  43b0c4: d63f0020     	blr	x1
  43b0c8: 17ffffdd     	b	0x43b03c <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x3fc>
  43b0cc: f941aaa1     	ldr	x1, [x21, #0x350]
  43b0d0: aa0003f7     	mov	x23, x0
  43b0d4: f9404be0     	ldr	x0, [sp, #0x90]
  43b0d8: f9417421     	ldr	x1, [x1, #0x2e8]
  43b0dc: d63f0020     	blr	x1
  43b0e0: f941aaa1     	ldr	x1, [x21, #0x350]
  43b0e4: f9400280     	ldr	x0, [x20]
  43b0e8: f9417c21     	ldr	x1, [x1, #0x2f8]
  43b0ec: d63f0020     	blr	x1
  43b0f0: aa1403e0     	mov	x0, x20
  43b0f4: d2800101     	mov	x1, #0x8                // =8
  43b0f8: 97fee32a     	bl	0x3f3da0 <_ZdlPvm@plt>
  43b0fc: f941aaa1     	ldr	x1, [x21, #0x350]
  43b100: f94043e0     	ldr	x0, [sp, #0x80]
  43b104: f9419021     	ldr	x1, [x1, #0x320]
  43b108: d63f0020     	blr	x1
  43b10c: 17ffffd3     	b	0x43b058 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x418>
  43b110: aa0003f7     	mov	x23, x0
  43b114: 17fffffa     	b	0x43b0fc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x4bc>
  43b118: f941aaa1     	ldr	x1, [x21, #0x350]
  43b11c: aa0003f3     	mov	x19, x0
  43b120: f9404be0     	ldr	x0, [sp, #0x90]
  43b124: f9417421     	ldr	x1, [x1, #0x2e8]
  43b128: d63f0020     	blr	x1
  43b12c: d2800901     	mov	x1, #0x48               // =72
  43b130: aa1403e0     	mov	x0, x20
  43b134: 97fee31b     	bl	0x3f3da0 <_ZdlPvm@plt>
  43b138: aa1303e0     	mov	x0, x19
  43b13c: 97ff1b1d     	bl	0x401db0 <_Unwind_Resume@plt>
  43b140: f941aaa1     	ldr	x1, [x21, #0x350]
  43b144: aa0003f7     	mov	x23, x0
  43b148: f9404be0     	ldr	x0, [sp, #0x90]
  43b14c: f9417421     	ldr	x1, [x1, #0x2e8]
  43b150: d63f0020     	blr	x1
  43b154: 17ffffea     	b	0x43b0fc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x4bc>
  43b158: f941aaa1     	ldr	x1, [x21, #0x350]
  43b15c: aa0003f7     	mov	x23, x0
  43b160: f9404be0     	ldr	x0, [sp, #0x90]
  43b164: f9417421     	ldr	x1, [x1, #0x2e8]
  43b168: d63f0020     	blr	x1
  43b16c: f941aaa1     	ldr	x1, [x21, #0x350]
  43b170: f94043e0     	ldr	x0, [sp, #0x80]
  43b174: f9419021     	ldr	x1, [x1, #0x320]
  43b178: d63f0020     	blr	x1
  43b17c: 17ffffb7     	b	0x43b058 <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x418>
  43b180: f941aaa1     	ldr	x1, [x21, #0x350]
  43b184: aa0003f7     	mov	x23, x0
  43b188: f94047e0     	ldr	x0, [sp, #0x88]
  43b18c: f9417421     	ldr	x1, [x1, #0x2e8]
  43b190: d63f0020     	blr	x1
  43b194: f94037e0     	ldr	x0, [sp, #0x68]
  43b198: 97fef2ee     	bl	0x3f7d50 <_ZNSt10_HashtableINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_S5_ESaIS8_ENSt8__detail10_Select1stESt8equal_toIS5_ESt4hashIS5_ENSA_18_Mod_range_hashingENSA_20_Default_ranged_hashENSA_20_Prime_rehash_policyENSA_17_Hashtable_traitsILb1ELb0ELb1EEEED1Ev@plt>
  43b19c: 17ffffd8     	b	0x43b0fc <zplane::NNPredictionDispatcher::ONNXImpl::ONNXImpl(zplane::NNPredictionDispatcher::ONNXModel&, int, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)+0x4bc>
