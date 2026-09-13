
engine-pi/stems-static/processor/stems-processor:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000005280 <main>:
    5280: d503233f     	paciasp
    5284: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
    5288: d00c3fc2     	adrp	x2, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    528c: f947d442     	ldr	x2, [x2, #0xfa8]
    5290: 910003fd     	mov	x29, sp
    5294: a9025bf5     	stp	x21, x22, [sp, #0x20]
    5298: 2a0003f5     	mov	w21, w0
    529c: a9046bf9     	stp	x25, x26, [sp, #0x40]
    52a0: a90573fb     	stp	x27, x28, [sp, #0x50]
    52a4: fd0033e8     	str	d8, [sp, #0x60]
    52a8: d11383ff     	sub	sp, sp, #0x4e0
    52ac: f9400040     	ldr	x0, [x2]
    52b0: f9026fe0     	str	x0, [sp, #0x4d8]
    52b4: d2800000     	mov	x0, #0x0                // =0
    52b8: 9106a3e2     	add	x2, sp, #0x1a8
    52bc: 910723e0     	add	x0, sp, #0x1c8
    52c0: a919ffe2     	stp	x2, xzr, [sp, #0x198]
    52c4: 3906a3ff     	strb	wzr, [sp, #0x1a8]
    52c8: a91bffe0     	stp	x0, xzr, [sp, #0x1b8]
    52cc: 390723ff     	strb	wzr, [sp, #0x1c8]
    52d0: f9027bf3     	str	x19, [sp, #0x4f0]
    52d4: f9027ff4     	str	x20, [sp, #0x4f8]
    52d8: 710006bf     	cmp	w21, #0x1
    52dc: 5400b26d     	b.le	0x6928 <main+0x16a8>
    52e0: 910963f4     	add	x20, sp, #0x258
    52e4: aa0103f6     	mov	x22, x1
    52e8: aa1403e0     	mov	x0, x20
    52ec: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    52f0: 911ba021     	add	x1, x1, #0x6e8
    52f4: 94000b5e     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    52f8: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    52fc: 9109e3e0     	add	x0, sp, #0x278
    5300: 911bc021     	add	x1, x1, #0x6f0
    5304: 94000b5a     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5308: 910a63e7     	add	x7, sp, #0x298
    530c: f0000002     	adrp	x2, 0x8000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<int>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, int const&) (.isra.0)>
    5310: 910cc042     	add	x2, x2, #0x330
    5314: 910663e1     	add	x1, sp, #0x198
    5318: d0000003     	adrp	x3, 0x7000 <main+0x1d80>
    531c: 91342063     	add	x3, x3, #0xd08
    5320: a90108e3     	stp	x3, x2, [x7, #0x10]
    5324: 910983e2     	add	x2, sp, #0x260
    5328: aa0103e4     	mov	x4, x1
    532c: a9007ce4     	stp	x4, xzr, [x7]
    5330: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5334: 911be021     	add	x1, x1, #0x6f8
    5338: f9028bf7     	str	x23, [sp, #0x510]
    533c: 910b63f7     	add	x23, sp, #0x2d8
    5340: f9028ff8     	str	x24, [sp, #0x518]
    5344: aa1703e0     	mov	x0, x23
    5348: a905fc5f     	stp	xzr, xzr, [x2, #0x58]
    534c: f9001be4     	str	x4, [sp, #0x30]
    5350: f90167ff     	str	xzr, [sp, #0x2c8]
    5354: f9016bff     	str	xzr, [sp, #0x2d0]
    5358: 94000b45     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    535c: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5360: 910be3e0     	add	x0, sp, #0x2f8
    5364: 911c2021     	add	x1, x1, #0x708
    5368: 94000b41     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    536c: 910983e4     	add	x4, sp, #0x260
    5370: 910ca3e6     	add	x6, sp, #0x328
    5374: d0000002     	adrp	x2, 0x7000 <main+0x1d80>
    5378: d0000003     	adrp	x3, 0x7000 <main+0x1d80>
    537c: 91282042     	add	x2, x2, #0xa08
    5380: 91331063     	add	x3, x3, #0xcc4
    5384: a90bfc9f     	stp	xzr, xzr, [x4, #0xb8]
    5388: 910d63f7     	add	x23, sp, #0x358
    538c: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5390: f9401be4     	ldr	x4, [sp, #0x30]
    5394: a9007cdf     	stp	xzr, xzr, [x6]
    5398: aa1703e0     	mov	x0, x23
    539c: a9017cc4     	stp	x4, xzr, [x6, #0x10]
    53a0: 911c4021     	add	x1, x1, #0x710
    53a4: f901a7e3     	str	x3, [sp, #0x348]
    53a8: f901abe2     	str	x2, [sp, #0x350]
    53ac: 94000b30     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    53b0: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    53b4: 910de3e0     	add	x0, sp, #0x378
    53b8: 911c8021     	add	x1, x1, #0x720
    53bc: 94000b2c     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    53c0: 911183e5     	add	x5, sp, #0x460
    53c4: 9106e3e4     	add	x4, sp, #0x1b8
    53c8: d0000002     	adrp	x2, 0x7000 <main+0x1d80>
    53cc: d0000003     	adrp	x3, 0x7000 <main+0x1d80>
    53d0: 91288042     	add	x2, x2, #0xa20
    53d4: 91320063     	add	x3, x3, #0xc80
    53d8: a933fcbf     	stp	xzr, xzr, [x5, #-0xc8]
    53dc: 910ea3e5     	add	x5, sp, #0x3a8
    53e0: 910f63f7     	add	x23, sp, #0x3d8
    53e4: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    53e8: aa1703e0     	mov	x0, x23
    53ec: a9007cbf     	stp	xzr, xzr, [x5]
    53f0: 911ca021     	add	x1, x1, #0x728
    53f4: a9017ca4     	stp	x4, xzr, [x5, #0x10]
    53f8: f9001fe4     	str	x4, [sp, #0x38]
    53fc: f901e7e3     	str	x3, [sp, #0x3c8]
    5400: f901ebe2     	str	x2, [sp, #0x3d0]
    5404: 94000b1a     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5408: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    540c: 910fe3e0     	add	x0, sp, #0x3f8
    5410: 911ce021     	add	x1, x1, #0x738
    5414: 94000b16     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5418: 911183e4     	add	x4, sp, #0x460
    541c: d0000002     	adrp	x2, 0x7000 <main+0x1d80>
    5420: d0000003     	adrp	x3, 0x7000 <main+0x1d80>
    5424: 913e0042     	add	x2, x2, #0xf80
    5428: 91311063     	add	x3, x3, #0xc44
    542c: 911163f3     	add	x19, sp, #0x458
    5430: a93bfc9f     	stp	xzr, xzr, [x4, #-0x48]
    5434: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5438: aa1303e0     	mov	x0, x19
    543c: f90217e3     	str	x3, [sp, #0x428]
    5440: 911d0021     	add	x1, x1, #0x740
    5444: f9021be2     	str	x2, [sp, #0x430]
    5448: a93dfc9f     	stp	xzr, xzr, [x4, #-0x28]
    544c: f90227ff     	str	xzr, [sp, #0x448]
    5450: f9022bff     	str	xzr, [sp, #0x450]
    5454: 94000b06     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5458: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    545c: 9111e3e0     	add	x0, sp, #0x478
    5460: 911d2021     	add	x1, x1, #0x748
    5464: 94000b02     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5468: 911183e3     	add	x3, sp, #0x460
    546c: d0000002     	adrp	x2, 0x7000 <main+0x1d80>
    5470: d0000001     	adrp	x1, 0x7000 <main+0x1d80>
    5474: 913a0042     	add	x2, x2, #0xe80
    5478: 91302021     	add	x1, x1, #0xc08
    547c: d2805000     	mov	x0, #0x280              // =640
    5480: a903fc7f     	stp	xzr, xzr, [x3, #0x38]
    5484: f90257e1     	str	x1, [sp, #0x4a8]
    5488: f9025be2     	str	x2, [sp, #0x4b0]
    548c: a905fc7f     	stp	xzr, xzr, [x3, #0x58]
    5490: a915ffff     	stp	xzr, xzr, [sp, #0x158]
    5494: f90267ff     	str	xzr, [sp, #0x4c8]
    5498: f9026bff     	str	xzr, [sp, #0x4d0]
    549c: 97fffddd     	bl	0x4c10 <_Znwm@plt>
    54a0: aa0003e2     	mov	x2, x0
    54a4: 911363e1     	add	x1, sp, #0x4d8
    54a8: 910a0043     	add	x3, x2, #0x280
    54ac: aa1403e0     	mov	x0, x20
    54b0: f900abe2     	str	x2, [sp, #0x150]
    54b4: f900b3e3     	str	x3, [sp, #0x160]
    54b8: 94001eba     	bl	0xcfa0 <imb::params::Parameter* std::__do_uninit_copy<imb::params::Parameter const*, imb::params::Parameter*>(imb::params::Parameter const*, imb::params::Parameter const*, imb::params::Parameter*)>
    54bc: aa0003e3     	mov	x3, x0
    54c0: 910543e1     	add	x1, sp, #0x150
    54c4: aa0103e2     	mov	x2, x1
    54c8: 2a1503e0     	mov	w0, w21
    54cc: aa1603e1     	mov	x1, x22
    54d0: f90017e2     	str	x2, [sp, #0x28]
    54d4: f900afe3     	str	x3, [sp, #0x158]
    54d8: 94001b32     	bl	0xc1a0 <imb::params::parseParameters(int, char**, std::vector<imb::params::Parameter, std::allocator<imb::params::Parameter>> const&)>
    54dc: f94017e0     	ldr	x0, [sp, #0x28]
    54e0: 94001588     	bl	0xab00 <std::vector<imb::params::Parameter, std::allocator<imb::params::Parameter>>::~vector()>
    54e4: 14000002     	b	0x54ec <main+0x26c>
    54e8: aa0003f3     	mov	x19, x0
    54ec: f9403a63     	ldr	x3, [x19, #0x70]
    54f0: b40000a3     	cbz	x3, 0x5504 <main+0x284>
    54f4: 91018261     	add	x1, x19, #0x60
    54f8: 52800062     	mov	w2, #0x3                // =3
    54fc: aa0103e0     	mov	x0, x1
    5500: d63f0060     	blr	x3
    5504: f9402a63     	ldr	x3, [x19, #0x50]
    5508: b40000a3     	cbz	x3, 0x551c <main+0x29c>
    550c: 91010261     	add	x1, x19, #0x40
    5510: 52800062     	mov	w2, #0x3                // =3
    5514: aa0103e0     	mov	x0, x1
    5518: d63f0060     	blr	x3
    551c: f9401260     	ldr	x0, [x19, #0x20]
    5520: 9100c261     	add	x1, x19, #0x30
    5524: eb01001f     	cmp	x0, x1
    5528: 54000080     	b.eq	0x5538 <main+0x2b8>
    552c: f9401a61     	ldr	x1, [x19, #0x30]
    5530: 91000421     	add	x1, x1, #0x1
    5534: 97fffdab     	bl	0x4be0 <_ZdlPvm@plt>
    5538: aa1303e1     	mov	x1, x19
    553c: f8410420     	ldr	x0, [x1], #0x10
    5540: eb01001f     	cmp	x0, x1
    5544: 54000080     	b.eq	0x5554 <main+0x2d4>
    5548: f9400a61     	ldr	x1, [x19, #0x10]
    554c: 91000421     	add	x1, x1, #0x1
    5550: 97fffda4     	bl	0x4be0 <_ZdlPvm@plt>
    5554: d1020260     	sub	x0, x19, #0x80
    5558: eb14027f     	cmp	x19, x20
    555c: 54fffc61     	b.ne	0x54e8 <main+0x268>
    5560: f9401fe0     	ldr	x0, [sp, #0x38]
    5564: 940013b7     	bl	0xa440 <VersionNumber::fromString(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5568: aa0003e3     	mov	x3, x0
    556c: d360fc00     	lsr	x0, x0, #32
    5570: b90153e3     	str	w3, [sp, #0x150]
    5574: d53bd053     	mrs	x19, TPIDR_EL0
    5578: b90157e0     	str	w0, [sp, #0x154]
    557c: b9015be1     	str	w1, [sp, #0x158]
    5580: 7100047f     	cmp	w3, #0x1
    5584: 54009e01     	b.ne	0x6944 <main+0x16c4>
    5588: 91400264     	add	x4, x19, #0x0, lsl #12  // =0x0
    558c: 91004084     	add	x4, x4, #0x10
    5590: 52800660     	mov	w0, #0x33               // =51
    5594: 390973e0     	strb	w0, [sp, #0x25c]
    5598: 52932885     	mov	w5, #0x9944             // =39236
    559c: 72b58c45     	movk	w5, #0xac62, lsl #16
    55a0: b9025be5     	str	w5, [sp, #0x258]
    55a4: f9408080     	ldr	x0, [x4, #0x100]
    55a8: 370001a0     	tbnz	w0, #0x0, 0x55dc <main+0x35c>
    55ac: 39401287     	ldrb	w7, [x20, #0x4]
    55b0: d2800026     	mov	x6, #0x1                // =1
    55b4: 39043087     	strb	w7, [x4, #0x10c]
    55b8: 91042081     	add	x1, x4, #0x108
    55bc: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    55c0: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    55c4: 91002042     	add	x2, x2, #0x8
    55c8: 91278000     	add	x0, x0, #0x9e0
    55cc: 39001423     	strb	w3, [x1, #0x5]
    55d0: f9008086     	str	x6, [x4, #0x100]
    55d4: b9010885     	str	w5, [x4, #0x108]
    55d8: 97fffdca     	bl	0x4d00 <__cxa_thread_atexit@plt>
    55dc: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    55e0: 91004000     	add	x0, x0, #0x10
    55e4: 91042002     	add	x2, x0, #0x108
    55e8: 39443400     	ldrb	w0, [x0, #0x10d]
    55ec: 36000200     	tbz	w0, #0x0, 0x562c <main+0x3ac>
    55f0: d29da6e4     	mov	x4, #0xed37             // =60727
    55f4: 52800000     	mov	w0, #0x0                // =0
    55f8: f2b820e4     	movk	x4, #0xc107, lsl #16
    55fc: f2cda664     	movk	x4, #0x6d33, lsl #32
    5600: f2e863e4     	movk	x4, #0x431f, lsl #48
    5604: 39400041     	ldrb	w1, [x2]
    5608: 9ac02483     	lsr	x3, x4, x0
    560c: 11002000     	add	w0, w0, #0x8
    5610: 4a030021     	eor	w1, w1, w3
    5614: 38001441     	strb	w1, [x2], #0x1
    5618: 7100a01f     	cmp	w0, #0x28
    561c: 54ffff41     	b.ne	0x5604 <main+0x384>
    5620: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    5624: 91004000     	add	x0, x0, #0x10
    5628: 3904341f     	strb	wzr, [x0, #0x10d]
    562c: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5630: 91004021     	add	x1, x1, #0x10
    5634: aa1403e0     	mov	x0, x20
    5638: 91042021     	add	x1, x1, #0x108
    563c: 94000a8c     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5640: f9401be0     	ldr	x0, [sp, #0x30]
    5644: aa1403e1     	mov	x1, x20
    5648: 940012ee     	bl	0xa200 <bool std::operator==<char, std::char_traits<char>, std::allocator<char>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    564c: 12001c15     	and	w21, w0, #0xff
    5650: aa1403e0     	mov	x0, x20
    5654: 97fffe63     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5658: 36005bb5     	tbz	w21, #0x0, 0x61cc <main+0xf4c>
    565c: d00c3fc2     	adrp	x2, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    5660: f947f042     	ldr	x2, [x2, #0xfe0]
    5664: 910983e3     	add	x3, sp, #0x260
    5668: 910983e4     	add	x4, sp, #0x260
    566c: d0000000     	adrp	x0, 0x7000 <main+0x1d80>
    5670: d0000001     	adrp	x1, 0x7000 <main+0x1d80>
    5674: 91280000     	add	x0, x0, #0xa00
    5678: a937fc7f     	stp	xzr, xzr, [x3, #-0x88]
    567c: 91353021     	add	x1, x1, #0xd4c
    5680: a9400c42     	ldp	x2, x3, [x2]
    5684: a9328c82     	stp	x2, x3, [x4, #-0xd8]
    5688: a91e83e1     	stp	x1, x0, [sp, #0x1e8]
    568c: 9400216d     	bl	0xdc40 <imb::TinyEncryption::randomChallenge()>
    5690: d00c3fc2     	adrp	x2, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    5694: f9474042     	ldr	x2, [x2, #0xe80]
    5698: 910863f9     	add	x25, sp, #0x218
    569c: aa0003fb     	mov	x27, x0
    56a0: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    56a4: aa1903e0     	mov	x0, x25
    56a8: 9118c021     	add	x1, x1, #0x630
    56ac: f90023e2     	str	x2, [sp, #0x40]
    56b0: f900abe2     	str	x2, [sp, #0x150]
    56b4: 94000a6e     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    56b8: f9410fe1     	ldr	x1, [sp, #0x218]
    56bc: b0000163     	adrp	x3, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    56c0: f94113e2     	ldr	x2, [sp, #0x220]
    56c4: 91190063     	add	x3, x3, #0x640
    56c8: f94017f7     	ldr	x23, [sp, #0x28]
    56cc: aa1703e0     	mov	x0, x23
    56d0: 940009c0     	bl	0x7dd0 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<char [13]>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, char const (&) [13]) (.isra.0)>
    56d4: 9108e3e1     	add	x1, sp, #0x238
    56d8: aa0003f5     	mov	x21, x0
    56dc: aa0103f6     	mov	x22, x1
    56e0: aa0103e0     	mov	x0, x1
    56e4: b0000178     	adrp	x24, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    56e8: 91194301     	add	x1, x24, #0x650
    56ec: f9000ff6     	str	x22, [sp, #0x18]
    56f0: 94000a5f     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    56f4: aa1403e8     	mov	x8, x20
    56f8: aa1b03e0     	mov	x0, x27
    56fc: 94001ef9     	bl	0xd2e0 <imb::conversion::toString[abi:cxx11](unsigned long)>
    5700: f9411fe1     	ldr	x1, [sp, #0x238]
    5704: aa1403e3     	mov	x3, x20
    5708: f94123e2     	ldr	x2, [sp, #0x240]
    570c: aa1503e0     	mov	x0, x21
    5710: 940009c5     	bl	0x7e24 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) (.isra.0)>
    5714: aa1403e0     	mov	x0, x20
    5718: 97fffe32     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    571c: aa1603e0     	mov	x0, x22
    5720: 97fffe30     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5724: aa1903e0     	mov	x0, x25
    5728: 97fffe2e     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    572c: aa1703e0     	mov	x0, x23
    5730: 94001234     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    5734: d00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    5738: f947b800     	ldr	x0, [x0, #0xf70]
    573c: 910243f6     	add	x22, sp, #0x90
    5740: aa1603e8     	mov	x8, x22
    5744: 94001c67     	bl	0xc8e0 <imb::paramblock::readParamBlock[abi:cxx11](std::istream&)>
    5748: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    574c: aa1403e0     	mov	x0, x20
    5750: 91196021     	add	x1, x1, #0x658
    5754: 94000a46     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5758: aa1403e1     	mov	x1, x20
    575c: aa1603e0     	mov	x0, x22
    5760: 94001728     	bl	0xb400 <int imb::paramblock::fromParamBlock<int>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5764: 2a0003f7     	mov	w23, w0
    5768: aa1403e0     	mov	x0, x20
    576c: 97fffe1d     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5770: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5774: aa1403e0     	mov	x0, x20
    5778: 9119a021     	add	x1, x1, #0x668
    577c: 94000a3c     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5780: aa1403e1     	mov	x1, x20
    5784: aa1603e0     	mov	x0, x22
    5788: 9400180e     	bl	0xb7c0 <float imb::paramblock::fromParamBlock<float>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    578c: 1e204008     	fmov	s8, s0
    5790: aa1403e0     	mov	x0, x20
    5794: 97fffe13     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5798: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    579c: aa1403e0     	mov	x0, x20
    57a0: 9119e021     	add	x1, x1, #0x678
    57a4: 94000a32     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    57a8: aa1403e1     	mov	x1, x20
    57ac: aa1603e0     	mov	x0, x22
    57b0: 94001714     	bl	0xb400 <int imb::paramblock::fromParamBlock<int>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    57b4: 2a0003f5     	mov	w21, w0
    57b8: aa1403e0     	mov	x0, x20
    57bc: 97fffe09     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    57c0: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    57c4: aa1403e0     	mov	x0, x20
    57c8: 911a2021     	add	x1, x1, #0x688
    57cc: 94000a28     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    57d0: aa1403e1     	mov	x1, x20
    57d4: aa1603e0     	mov	x0, x22
    57d8: 940018ea     	bl	0xbb80 <bool imb::paramblock::fromParamBlock<bool>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    57dc: aa1403e0     	mov	x0, x20
    57e0: 97fffe00     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    57e4: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    57e8: aa1403e0     	mov	x0, x20
    57ec: 911a6021     	add	x1, x1, #0x698
    57f0: 94000a1f     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    57f4: aa1403e1     	mov	x1, x20
    57f8: aa1603e0     	mov	x0, x22
    57fc: 940018e1     	bl	0xbb80 <bool imb::paramblock::fromParamBlock<bool>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5800: 12001c01     	and	w1, w0, #0xff
    5804: aa1403e0     	mov	x0, x20
    5808: 2a0103fa     	mov	w26, w1
    580c: b90003e1     	str	w1, [sp]
    5810: 97fffdf4     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5814: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5818: aa1403e0     	mov	x0, x20
    581c: 911aa021     	add	x1, x1, #0x6a8
    5820: 94000a13     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5824: aa1403e1     	mov	x1, x20
    5828: aa1603e0     	mov	x0, x22
    582c: 940016f5     	bl	0xb400 <int imb::paramblock::fromParamBlock<int>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5830: 2a0003fc     	mov	w28, w0
    5834: aa1403e0     	mov	x0, x20
    5838: 97fffdea     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    583c: 91194301     	add	x1, x24, #0x650
    5840: aa1403e0     	mov	x0, x20
    5844: 94000a0a     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5848: 9107e3e0     	add	x0, sp, #0x1f8
    584c: aa1403e1     	mov	x1, x20
    5850: aa0003e8     	mov	x8, x0
    5854: f90027e0     	str	x0, [sp, #0x48]
    5858: aa1603e0     	mov	x0, x22
    585c: 94001539     	bl	0xad40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> imb::paramblock::fromParamBlock<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5860: aa1403e0     	mov	x0, x20
    5864: 97fffddf     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5868: f940f7e0     	ldr	x0, [sp, #0x1e8]
    586c: b40001a0     	cbz	x0, 0x58a0 <main+0x620>
    5870: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    5874: 910763f8     	add	x24, sp, #0x1d8
    5878: 911ae021     	add	x1, x1, #0x6b8
    587c: aa1403e0     	mov	x0, x20
    5880: 940009fb     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5884: aa1403e1     	mov	x1, x20
    5888: aa1603e0     	mov	x0, x22
    588c: 940016dd     	bl	0xb400 <int imb::paramblock::fromParamBlock<int>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5890: 2a0003f6     	mov	w22, w0
    5894: aa1403e0     	mov	x0, x20
    5898: 97fffdd2     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    589c: 36008416     	tbz	w22, #0x0, 0x691c <main+0x169c>
    58a0: f9400ff6     	ldr	x22, [sp, #0x18]
    58a4: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    58a8: 910763f8     	add	x24, sp, #0x1d8
    58ac: 911b0021     	add	x1, x1, #0x6c0
    58b0: aa1603e0     	mov	x0, x22
    58b4: 940009ee     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    58b8: b0000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    58bc: aa1403e0     	mov	x0, x20
    58c0: 911b2021     	add	x1, x1, #0x6c8
    58c4: 940009ea     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    58c8: aa1403e0     	mov	x0, x20
    58cc: 97fffdc5     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    58d0: aa1603e0     	mov	x0, x22
    58d4: 97fffdc3     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    58d8: 12001f40     	and	w0, w26, #0xff
    58dc: 11001016     	add	w22, w0, #0x4
    58e0: f94027e0     	ldr	x0, [sp, #0x48]
    58e4: 1b177ed6     	mul	w22, w22, w23
    58e8: b90067f6     	str	w22, [sp, #0x64]
    58ec: 94002045     	bl	0xda00 <imb::conversion::toUInt64(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    58f0: aa0003e2     	mov	x2, x0
    58f4: 9101a3e1     	add	x1, sp, #0x68
    58f8: 910623e0     	add	x0, sp, #0x188
    58fc: f90037e2     	str	x2, [sp, #0x68]
    5900: 940020b0     	bl	0xdbc0 <imb::TinyEncryption::decipher(unsigned long const&) const>
    5904: eb00037f     	cmp	x27, x0
    5908: 5400c6c1     	b.ne	0x71e0 <main+0x1f60>
    590c: d0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    5910: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5914: 91004063     	add	x3, x3, #0x10
    5918: f94023e1     	ldr	x1, [sp, #0x40]
    591c: f900abe1     	str	x1, [sp, #0x150]
    5920: fd430c00     	ldr	d0, [x0, #0x618]
    5924: 5281b740     	mov	w0, #0xdba              // =3514
    5928: 7904c3e0     	strh	w0, [sp, #0x260]
    592c: f9408860     	ldr	x0, [x3, #0x110]
    5930: fd012fe0     	str	d0, [sp, #0x258]
    5934: 370001c0     	tbnz	w0, #0x0, 0x596c <main+0x6ec>
    5938: f9412fe4     	ldr	x4, [sp, #0x258]
    593c: 91046061     	add	x1, x3, #0x118
    5940: 79401282     	ldrh	w2, [x20, #0x8]
    5944: d2800025     	mov	x5, #0x1                // =1
    5948: 52800020     	mov	w0, #0x1                // =1
    594c: 79001022     	strh	w2, [x1, #0x8]
    5950: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5954: 91002042     	add	x2, x2, #0x8
    5958: 39002820     	strb	w0, [x1, #0xa]
    595c: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5960: 91298000     	add	x0, x0, #0xa60
    5964: a9111065     	stp	x5, x4, [x3, #0x110]
    5968: 97fffce6     	bl	0x4d00 <__cxa_thread_atexit@plt>
    596c: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5970: 91004021     	add	x1, x1, #0x10
    5974: 91046020     	add	x0, x1, #0x118
    5978: 39448821     	ldrb	w1, [x1, #0x122]
    597c: 36000041     	tbz	w1, #0x0, 0x5984 <main+0x704>
    5980: 94000841     	bl	0x7a84 <ay::obfuscated_data<10ull, 6998023196564196829ull>::decrypt() (.part.0)>
    5984: f9400fe0     	ldr	x0, [sp, #0x18]
    5988: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    598c: 91004021     	add	x1, x1, #0x10
    5990: 91046021     	add	x1, x1, #0x118
    5994: 940009b6     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5998: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    599c: 91004063     	add	x3, x3, #0x10
    59a0: f9409460     	ldr	x0, [x3, #0x128]
    59a4: 370001e0     	tbnz	w0, #0x0, 0x59e0 <main+0x760>
    59a8: d28f35c4     	mov	x4, #0x79ae             // =31150
    59ac: 9104c061     	add	x1, x3, #0x130
    59b0: f2ab68c4     	movk	x4, #0x5b46, lsl #16
    59b4: 52800020     	mov	w0, #0x1                // =1
    59b8: f2d38e24     	movk	x4, #0x9c71, lsl #32
    59bc: d2800022     	mov	x2, #0x1                // =1
    59c0: f2ec2f24     	movk	x4, #0x6179, lsl #48
    59c4: 39002020     	strb	w0, [x1, #0x8]
    59c8: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    59cc: 912a0000     	add	x0, x0, #0xa80
    59d0: a9129062     	stp	x2, x4, [x3, #0x128]
    59d4: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    59d8: 91002042     	add	x2, x2, #0x8
    59dc: 97fffcc9     	bl	0x4d00 <__cxa_thread_atexit@plt>
    59e0: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    59e4: 91004021     	add	x1, x1, #0x10
    59e8: 9104c020     	add	x0, x1, #0x130
    59ec: 3944e021     	ldrb	w1, [x1, #0x138]
    59f0: 36000041     	tbz	w1, #0x0, 0x59f8 <main+0x778>
    59f4: 94000835     	bl	0x7ac8 <ay::obfuscated_data<8ull, 6998023196564196829ull>::decrypt() (.part.0)>
    59f8: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    59fc: 91004021     	add	x1, x1, #0x10
    5a00: aa1403e0     	mov	x0, x20
    5a04: 9104c021     	add	x1, x1, #0x130
    5a08: 94000999     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5a0c: f9411fe1     	ldr	x1, [sp, #0x238]
    5a10: aa1403e3     	mov	x3, x20
    5a14: f94123e2     	ldr	x2, [sp, #0x240]
    5a18: f94017f8     	ldr	x24, [sp, #0x28]
    5a1c: aa1803e0     	mov	x0, x24
    5a20: 94000901     	bl	0x7e24 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) (.isra.0)>
    5a24: aa1403e0     	mov	x0, x20
    5a28: 97fffd6e     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5a2c: f9400fe0     	ldr	x0, [sp, #0x18]
    5a30: 9101c3fb     	add	x27, sp, #0x70
    5a34: 97fffd6b     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5a38: f90017f8     	str	x24, [sp, #0x28]
    5a3c: aa1803e0     	mov	x0, x24
    5a40: 94001170     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    5a44: 910763f8     	add	x24, sp, #0x1d8
    5a48: aa1b03e0     	mov	x0, x27
    5a4c: 94002131     	bl	0xdf10 <zplane::StemsPro::StemsPro()>
    5a50: f00c3fc1     	adrp	x1, 0x18800000 <data_start>
    5a54: 91016020     	add	x0, x1, #0x58
    5a58: 91002000     	add	x0, x0, #0x8
    5a5c: 9101e3e1     	add	x1, sp, #0x78
    5a60: f9003ffb     	str	x27, [sp, #0x78]
    5a64: 94000ad1     	bl	0x85a8 <void*& std::vector<void*, std::allocator<void*>>::emplace_back<void*>(void*&&) (.isra.0)>
    5a68: 1e204100     	fmov	s0, s8
    5a6c: 2a1a03e4     	mov	w4, w26
    5a70: 2a1c03e3     	mov	w3, w28
    5a74: 2a1503e2     	mov	w2, w21
    5a78: 2a1703e1     	mov	w1, w23
    5a7c: aa1b03e0     	mov	x0, x27
    5a80: 9400213a     	bl	0xdf68 <zplane::StemsPro::initialize(int, float, int, int, bool)>
    5a84: 940009bf     	bl	0x8180 <(anonymous namespace)::handleErrorCode(int)>
    5a88: 93407eb8     	sxtw	x24, w21
    5a8c: aa1b03e0     	mov	x0, x27
    5a90: aa1803e1     	mov	x1, x24
    5a94: 940021cd     	bl	0xe1c8 <zplane::StemsPro::setOutputBlockSize(unsigned long)>
    5a98: 940009ba     	bl	0x8180 <(anonymous namespace)::handleErrorCode(int)>
    5a9c: aa1803e1     	mov	x1, x24
    5aa0: aa1b03e0     	mov	x0, x27
    5aa4: 940021c9     	bl	0xe1c8 <zplane::StemsPro::setOutputBlockSize(unsigned long)>
    5aa8: 940009b6     	bl	0x8180 <(anonymous namespace)::handleErrorCode(int)>
    5aac: aa1b03e0     	mov	x0, x27
    5ab0: 940021d8     	bl	0xe210 <zplane::StemsPro::getMaxFramesNeeded()>
    5ab4: aa0003f8     	mov	x24, x0
    5ab8: aa1b03e0     	mov	x0, x27
    5abc: 940021d3     	bl	0xe208 <zplane::StemsPro::getFramesNeeded()>
    5ac0: 910303fa     	add	x26, sp, #0xc0
    5ac4: 2a1503e2     	mov	w2, w21
    5ac8: aa1a03e0     	mov	x0, x26
    5acc: 2a1703e1     	mov	w1, w23
    5ad0: f9002bfa     	str	x26, [sp, #0x50]
    5ad4: 940015f3     	bl	0xb2a0 <AudioBuffer::AudioBuffer(int, int)>
    5ad8: 9103c3e1     	add	x1, sp, #0xf0
    5adc: 2a1503e2     	mov	w2, w21
    5ae0: aa0103e0     	mov	x0, x1
    5ae4: 2a1603e1     	mov	w1, w22
    5ae8: f90007e0     	str	x0, [sp, #0x8]
    5aec: 940015ed     	bl	0xb2a0 <AudioBuffer::AudioBuffer(int, int)>
    5af0: f00c3fc1     	adrp	x1, 0x18800000 <data_start>
    5af4: 91016020     	add	x0, x1, #0x58
    5af8: 91002000     	add	x0, x0, #0x8
    5afc: 910203e1     	add	x1, sp, #0x80
    5b00: f90043fa     	str	x26, [sp, #0x80]
    5b04: 94000aa9     	bl	0x85a8 <void*& std::vector<void*, std::allocator<void*>>::emplace_back<void*>(void*&&) (.isra.0)>
    5b08: f94017f6     	ldr	x22, [sp, #0x28]
    5b0c: 0b1802b5     	add	w21, w21, w24
    5b10: 2a1703e1     	mov	w1, w23
    5b14: 2a1503e2     	mov	w2, w21
    5b18: aa1603e0     	mov	x0, x22
    5b1c: 940015e1     	bl	0xb2a0 <AudioBuffer::AudioBuffer(int, int)>
    5b20: aa1b03e0     	mov	x0, x27
    5b24: b90183f5     	str	w21, [sp, #0x180]
    5b28: b90187ff     	str	wzr, [sp, #0x184]
    5b2c: 940021b7     	bl	0xe208 <zplane::StemsPro::getFramesNeeded()>
    5b30: aa0003e2     	mov	x2, x0
    5b34: f00c3fc0     	adrp	x0, 0x18800000 <data_start>
    5b38: 91016000     	add	x0, x0, #0x58
    5b3c: 910223e1     	add	x1, sp, #0x88
    5b40: 91002000     	add	x0, x0, #0x8
    5b44: f9002fe1     	str	x1, [sp, #0x58]
    5b48: f90047f6     	str	x22, [sp, #0x88]
    5b4c: b90183e2     	str	w2, [sp, #0x180]
    5b50: b90187ff     	str	wzr, [sp, #0x184]
    5b54: 94000a95     	bl	0x85a8 <void*& std::vector<void*, std::allocator<void*>>::emplace_back<void*>(void*&&) (.isra.0)>
    5b58: d0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    5b5c: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5b60: 91004063     	add	x3, x3, #0x10
    5b64: f94023e1     	ldr	x1, [sp, #0x40]
    5b68: f90093e1     	str	x1, [sp, #0x120]
    5b6c: fd431000     	ldr	d0, [x0, #0x620]
    5b70: 128d0be0     	mov	w0, #-0x6860            // =-26720
    5b74: 7904c3e0     	strh	w0, [sp, #0x260]
    5b78: f940a060     	ldr	x0, [x3, #0x140]
    5b7c: fd012fe0     	str	d0, [sp, #0x258]
    5b80: 370001c0     	tbnz	w0, #0x0, 0x5bb8 <main+0x938>
    5b84: f9412fe4     	ldr	x4, [sp, #0x258]
    5b88: 91052061     	add	x1, x3, #0x148
    5b8c: 79401282     	ldrh	w2, [x20, #0x8]
    5b90: d2800025     	mov	x5, #0x1                // =1
    5b94: 52800020     	mov	w0, #0x1                // =1
    5b98: 79001022     	strh	w2, [x1, #0x8]
    5b9c: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5ba0: 91002042     	add	x2, x2, #0x8
    5ba4: 39002820     	strb	w0, [x1, #0xa]
    5ba8: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5bac: 912a8000     	add	x0, x0, #0xaa0
    5bb0: a9141065     	stp	x5, x4, [x3, #0x140]
    5bb4: 97fffc53     	bl	0x4d00 <__cxa_thread_atexit@plt>
    5bb8: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5bbc: 91004021     	add	x1, x1, #0x10
    5bc0: 91052020     	add	x0, x1, #0x148
    5bc4: 39454821     	ldrb	w1, [x1, #0x152]
    5bc8: 36000041     	tbz	w1, #0x0, 0x5bd0 <main+0x950>
    5bcc: 940007cf     	bl	0x7b08 <ay::obfuscated_data<10ull, 15121211008207919047ull>::decrypt() (.part.0)>
    5bd0: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5bd4: 91004021     	add	x1, x1, #0x10
    5bd8: aa1903e0     	mov	x0, x25
    5bdc: 91052021     	add	x1, x1, #0x148
    5be0: 94000923     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5be4: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5be8: 91004063     	add	x3, x3, #0x10
    5bec: 52800961     	mov	w1, #0x4b               // =75
    5bf0: 390973e1     	strb	w1, [sp, #0x25c]
    5bf4: 529f1460     	mov	w0, #0xf8a3             // =63651
    5bf8: 72b71360     	movk	w0, #0xb89b, lsl #16
    5bfc: b9025be0     	str	w0, [sp, #0x258]
    5c00: f940ac61     	ldr	x1, [x3, #0x158]
    5c04: 370001c1     	tbnz	w1, #0x0, 0x5c3c <main+0x9bc>
    5c08: 91058061     	add	x1, x3, #0x160
    5c0c: 39401282     	ldrb	w2, [x20, #0x4]
    5c10: 52800025     	mov	w5, #0x1                // =1
    5c14: d2800024     	mov	x4, #0x1                // =1
    5c18: b9016060     	str	w0, [x3, #0x160]
    5c1c: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5c20: 912b0000     	add	x0, x0, #0xac0
    5c24: 39001022     	strb	w2, [x1, #0x4]
    5c28: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5c2c: 91002042     	add	x2, x2, #0x8
    5c30: 39001425     	strb	w5, [x1, #0x5]
    5c34: f900ac64     	str	x4, [x3, #0x158]
    5c38: 97fffc32     	bl	0x4d00 <__cxa_thread_atexit@plt>
    5c3c: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5c40: 91004021     	add	x1, x1, #0x10
    5c44: 91058020     	add	x0, x1, #0x160
    5c48: 39459421     	ldrb	w1, [x1, #0x165]
    5c4c: 36000041     	tbz	w1, #0x0, 0x5c54 <main+0x9d4>
    5c50: 940007be     	bl	0x7b48 <ay::obfuscated_data<5ull, 15121211008207919047ull>::decrypt() (.part.0)>
    5c54: f9400ff5     	ldr	x21, [sp, #0x18]
    5c58: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5c5c: 91004021     	add	x1, x1, #0x10
    5c60: 91058021     	add	x1, x1, #0x160
    5c64: aa1503e0     	mov	x0, x21
    5c68: 94000901     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5c6c: 910483e2     	add	x2, sp, #0x120
    5c70: aa1503e3     	mov	x3, x21
    5c74: f9410fe1     	ldr	x1, [sp, #0x218]
    5c78: aa0203e0     	mov	x0, x2
    5c7c: f94113e2     	ldr	x2, [sp, #0x220]
    5c80: f90003e0     	str	x0, [sp]
    5c84: 94000868     	bl	0x7e24 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) (.isra.0)>
    5c88: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5c8c: 91004063     	add	x3, x3, #0x10
    5c90: d0000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    5c94: 911a6021     	add	x1, x1, #0x698
    5c98: aa0003f5     	mov	x21, x0
    5c9c: 910983e0     	add	x0, sp, #0x260
    5ca0: f940b462     	ldr	x2, [x3, #0x168]
    5ca4: a9409424     	ldp	x4, x5, [x1, #0x8]
    5ca8: a93f9404     	stp	x4, x5, [x0, #-0x8]
    5cac: 79403020     	ldrh	w0, [x1, #0x18]
    5cb0: 79002280     	strh	w0, [x20, #0x10]
    5cb4: 370001a2     	tbnz	w2, #0x0, 0x5ce8 <main+0xa68>
    5cb8: 9105c061     	add	x1, x3, #0x170
    5cbc: a9171464     	stp	x4, x5, [x3, #0x170]
    5cc0: 52800022     	mov	w2, #0x1                // =1
    5cc4: 79002020     	strh	w0, [x1, #0x10]
    5cc8: d2800020     	mov	x0, #0x1                // =1
    5ccc: 39004822     	strb	w2, [x1, #0x12]
    5cd0: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5cd4: 91002042     	add	x2, x2, #0x8
    5cd8: f900b460     	str	x0, [x3, #0x168]
    5cdc: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5ce0: 912b8000     	add	x0, x0, #0xae0
    5ce4: 97fffc07     	bl	0x4d00 <__cxa_thread_atexit@plt>
    5ce8: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5cec: 91004021     	add	x1, x1, #0x10
    5cf0: 9105c020     	add	x0, x1, #0x170
    5cf4: 39460821     	ldrb	w1, [x1, #0x182]
    5cf8: 36000041     	tbz	w1, #0x0, 0x5d00 <main+0xa80>
    5cfc: 940007a3     	bl	0x7b88 <ay::obfuscated_data<18ull, 15240658050002563497ull>::decrypt() (.part.0)>
    5d00: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    5d04: 91004021     	add	x1, x1, #0x10
    5d08: aa1403e0     	mov	x0, x20
    5d0c: 9105c021     	add	x1, x1, #0x170
    5d10: 940008d7     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    5d14: f9412fe1     	ldr	x1, [sp, #0x258]
    5d18: aa1503e0     	mov	x0, x21
    5d1c: f94133e2     	ldr	x2, [sp, #0x260]
    5d20: 910193e3     	add	x3, sp, #0x64
    5d24: 940008b7     	bl	0x8000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<int>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, int const&) (.isra.0)>
    5d28: aa1403e0     	mov	x0, x20
    5d2c: 97fffcad     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5d30: f9400fe0     	ldr	x0, [sp, #0x18]
    5d34: 97fffcab     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5d38: aa1903e0     	mov	x0, x25
    5d3c: 97fffca9     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    5d40: f94003f5     	ldr	x21, [sp]
    5d44: aa1503e0     	mov	x0, x21
    5d48: 940010ae     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    5d4c: f94007e2     	ldr	x2, [sp, #0x8]
    5d50: f00c3fc0     	adrp	x0, 0x18800000 <data_start>
    5d54: 91016000     	add	x0, x0, #0x58
    5d58: aa1503e1     	mov	x1, x21
    5d5c: 91002000     	add	x0, x0, #0x8
    5d60: f90093e2     	str	x2, [sp, #0x120]
    5d64: 94000a11     	bl	0x85a8 <void*& std::vector<void*, std::allocator<void*>>::emplace_back<void*>(void*&&) (.isra.0)>
    5d68: d00c3fd8     	adrp	x24, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    5d6c: f947bb18     	ldr	x24, [x24, #0xf70]
    5d70: d00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    5d74: f9474000     	ldr	x0, [x0, #0xe80]
    5d78: f90013e0     	str	x0, [sp, #0x20]
    5d7c: d503201f     	nop
    5d80: f94003e8     	ldr	x8, [sp]
    5d84: aa1803e0     	mov	x0, x24
    5d88: 94001ad6     	bl	0xc8e0 <imb::paramblock::readParamBlock[abi:cxx11](std::istream&)>
    5d8c: d0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    5d90: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5d94: 91004063     	add	x3, x3, #0x10
    5d98: 52800461     	mov	w1, #0x23               // =35
    5d9c: 39098be1     	strb	w1, [sp, #0x262]
    5da0: fd431400     	ldr	d0, [x0, #0x628]
    5da4: 5281d080     	mov	w0, #0xe84              // =3716
    5da8: 7904c3e0     	strh	w0, [sp, #0x260]
    5dac: f940c460     	ldr	x0, [x3, #0x188]
    5db0: fd012fe0     	str	d0, [sp, #0x258]
    5db4: 370001c0     	tbnz	w0, #0x0, 0x5dec <main+0xb6c>
    5db8: 91064061     	add	x1, x3, #0x190
    5dbc: b8407280     	ldur	w0, [x20, #0x7]
    5dc0: f9400282     	ldr	x2, [x20]
    5dc4: 52800025     	mov	w5, #0x1                // =1
    5dc8: d2800024     	mov	x4, #0x1                // =1
    5dcc: a9188864     	stp	x4, x2, [x3, #0x188]
    5dd0: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5dd4: 91002042     	add	x2, x2, #0x8
    5dd8: b8007020     	stur	w0, [x1, #0x7]
    5ddc: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5de0: 912c0000     	add	x0, x0, #0xb00
    5de4: 39002c25     	strb	w5, [x1, #0xb]
    5de8: 97fffbc6     	bl	0x4d00 <__cxa_thread_atexit@plt>
    5dec: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    5df0: 91004000     	add	x0, x0, #0x10
    5df4: 91064002     	add	x2, x0, #0x190
    5df8: 39466c00     	ldrb	w0, [x0, #0x19b]
    5dfc: 360001e0     	tbz	w0, #0x0, 0x5e38 <main+0xbb8>
    5e00: d2800000     	mov	x0, #0x0                // =0
    5e04: d28fbc24     	mov	x4, #0x7de1             // =32225
    5e08: 38606843     	ldrb	w3, [x2, x0]
    5e0c: f2afe464     	movk	x4, #0x7f23, lsl #16
    5e10: d37d0801     	ubfiz	x1, x0, #3, #3
    5e14: f2d9e664     	movk	x4, #0xcf33, lsl #32
    5e18: f2f5fc64     	movk	x4, #0xafe3, lsl #48
    5e1c: 9ac12481     	lsr	x1, x4, x1
    5e20: 4a030021     	eor	w1, w1, w3
    5e24: 38206841     	strb	w1, [x2, x0]
    5e28: 91000400     	add	x0, x0, #0x1
    5e2c: f1002c1f     	cmp	x0, #0xb
    5e30: 54fffea1     	b.ne	0x5e04 <main+0xb84>
    5e34: 39002c5f     	strb	wzr, [x2, #0xb]
    5e38: 91400279     	add	x25, x19, #0x0, lsl #12 // =0x0
    5e3c: 91004339     	add	x25, x25, #0x10
    5e40: 9109a3f7     	add	x23, sp, #0x268
    5e44: 91064336     	add	x22, x25, #0x190
    5e48: f9012ff7     	str	x23, [sp, #0x258]
    5e4c: aa1603e0     	mov	x0, x22
    5e50: 97fffcbc     	bl	0x5140 <strlen@plt>
    5e54: aa0003f5     	mov	x21, x0
    5e58: f100041f     	cmp	x0, #0x1
    5e5c: 540028e0     	b.eq	0x6378 <main+0x10f8>
    5e60: b40000a0     	cbz	x0, 0x5e74 <main+0xbf4>
    5e64: aa0003e2     	mov	x2, x0
    5e68: aa1603e1     	mov	x1, x22
    5e6c: aa1703e0     	mov	x0, x23
    5e70: 97fffbfc     	bl	0x4e60 <memcpy@plt>
    5e74: f94003e0     	ldr	x0, [sp]
    5e78: f90133f5     	str	x21, [sp, #0x260]
    5e7c: 38356aff     	strb	wzr, [x23, x21]
    5e80: aa1403e1     	mov	x1, x20
    5e84: 9400155f     	bl	0xb400 <int imb::paramblock::fromParamBlock<int>(std::map<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    5e88: f9412fe2     	ldr	x2, [sp, #0x258]
    5e8c: 2a0003f9     	mov	w25, w0
    5e90: eb17005f     	cmp	x2, x23
    5e94: 540000a0     	b.eq	0x5ea8 <main+0xc28>
    5e98: f94137e1     	ldr	x1, [sp, #0x268]
    5e9c: aa0203e0     	mov	x0, x2
    5ea0: 91000421     	add	x1, x1, #0x1
    5ea4: 97fffb4f     	bl	0x4be0 <_ZdlPvm@plt>
    5ea8: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    5eac: 91004063     	add	x3, x3, #0x10
    5eb0: 5289cd00     	mov	w0, #0x4e68             // =20072
    5eb4: 72bb4660     	movk	w0, #0xda33, lsl #16
    5eb8: b9025be0     	str	w0, [sp, #0x258]
    5ebc: 5285fe02     	mov	w2, #0x2ff0             // =12272
    5ec0: 12800381     	mov	w1, #-0x1d              // =-29
    5ec4: f940d060     	ldr	x0, [x3, #0x1a0]
    5ec8: 7904bbe2     	strh	w2, [sp, #0x25c]
    5ecc: 39097be1     	strb	w1, [sp, #0x25e]
    5ed0: 370001c0     	tbnz	w0, #0x0, 0x5f08 <main+0xc88>
    5ed4: d2e02000     	mov	x0, #0x100000000000000  // =72057594037927936
    5ed8: 9106a061     	add	x1, x3, #0x1a8
    5edc: b9400282     	ldr	w2, [x20]
    5ee0: d2800024     	mov	x4, #0x1                // =1
    5ee4: a91a0064     	stp	x4, x0, [x3, #0x1a0]
    5ee8: b8403280     	ldur	w0, [x20, #0x3]
    5eec: b901a862     	str	w2, [x3, #0x1a8]
    5ef0: f00c3fc2     	adrp	x2, 0x18800000 <data_start>
    5ef4: 91002042     	add	x2, x2, #0x8
    5ef8: b8003020     	stur	w0, [x1, #0x3]
    5efc: 90000020     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    5f00: 912c8000     	add	x0, x0, #0xb20
    5f04: 97fffb7f     	bl	0x4d00 <__cxa_thread_atexit@plt>
    5f08: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    5f0c: 91004000     	add	x0, x0, #0x10
    5f10: 9106a002     	add	x2, x0, #0x1a8
    5f14: 3946bc00     	ldrb	w0, [x0, #0x1af]
    5f18: 36000200     	tbz	w0, #0x0, 0x5f58 <main+0xcd8>
    5f1c: 52800000     	mov	w0, #0x0                // =0
    5f20: d285a123     	mov	x3, #0x2d09             // =11529
    5f24: 39400041     	ldrb	w1, [x2]
    5f28: f2b668e3     	movk	x3, #0xb347, lsl #16
    5f2c: f2c833e3     	movk	x3, #0x419f, lsl #32
    5f30: f2e6fc63     	movk	x3, #0x37e3, lsl #48
    5f34: 9ac02463     	lsr	x3, x3, x0
    5f38: 11002000     	add	w0, w0, #0x8
    5f3c: 4a030021     	eor	w1, w1, w3
    5f40: 38001441     	strb	w1, [x2], #0x1
    5f44: 7100e01f     	cmp	w0, #0x38
    5f48: 54fffec1     	b.ne	0x5f20 <main+0xca0>
    5f4c: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    5f50: 91004000     	add	x0, x0, #0x10
    5f54: 3906bc1f     	strb	wzr, [x0, #0x1af]
    5f58: 9140027a     	add	x26, x19, #0x0, lsl #12 // =0x0
    5f5c: 9100435a     	add	x26, x26, #0x10
    5f60: f9012ff7     	str	x23, [sp, #0x258]
    5f64: 9106a356     	add	x22, x26, #0x1a8
    5f68: aa1603e0     	mov	x0, x22
    5f6c: 97fffc75     	bl	0x5140 <strlen@plt>
    5f70: aa0003f5     	mov	x21, x0
    5f74: f100041f     	cmp	x0, #0x1
    5f78: 54001fa0     	b.eq	0x636c <main+0x10ec>
    5f7c: b40000a0     	cbz	x0, 0x5f90 <main+0xd10>
    5f80: aa0003e2     	mov	x2, x0
    5f84: aa1603e1     	mov	x1, x22
    5f88: aa1703e0     	mov	x0, x23
    5f8c: 97fffbb5     	bl	0x4e60 <memcpy@plt>
    5f90: f94003e0     	ldr	x0, [sp]
    5f94: f90133f5     	str	x21, [sp, #0x260]
    5f98: 38356aff     	strb	wzr, [x23, x21]
    5f9c: aa1403e1     	mov	x1, x20
    5fa0: 94001310     	bl	0xabe0 <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::find(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) const>
    5fa4: aa0003e1     	mov	x1, x0
    5fa8: 9104a3e0     	add	x0, sp, #0x128
    5fac: eb00003f     	cmp	x1, x0
    5fb0: 910923e0     	add	x0, sp, #0x248
    5fb4: f9000be0     	str	x0, [sp, #0x10]
    5fb8: f9011fe0     	str	x0, [sp, #0x238]
    5fbc: 54001e40     	b.eq	0x6384 <main+0x1104>
    5fc0: a9440821     	ldp	x1, x2, [x1, #0x40]
    5fc4: f9400fe0     	ldr	x0, [sp, #0x18]
    5fc8: 8b020022     	add	x2, x1, x2
    5fcc: 940007b5     	bl	0x7ea0 <void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_construct<char*>(char*, char*, std::forward_iterator_tag) (.isra.0)>
    5fd0: f9412fe0     	ldr	x0, [sp, #0x258]
    5fd4: eb17001f     	cmp	x0, x23
    5fd8: 54000080     	b.eq	0x5fe8 <main+0xd68>
    5fdc: f94137e1     	ldr	x1, [sp, #0x268]
    5fe0: 91000421     	add	x1, x1, #0x1
    5fe4: 97fffaff     	bl	0x4be0 <_ZdlPvm@plt>
    5fe8: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    5fec: 91004000     	add	x0, x0, #0x10
    5ff0: 128850a1     	mov	w1, #-0x4286            // =-17030
    5ff4: 7904bbe1     	strh	w1, [sp, #0x25c]
    5ff8: 528e67e2     	mov	w2, #0x733f             // =29503
    5ffc: 72af5982     	movk	w2, #0x7acc, lsl #16
    6000: b9025be2     	str	w2, [sp, #0x258]
    6004: f940d801     	ldr	x1, [x0, #0x1b0]
    6008: 370001e1     	tbnz	w1, #0x0, 0x6044 <main+0xdc4>
    600c: 9106e001     	add	x1, x0, #0x1b8
    6010: 79400a83     	ldrh	w3, [x20, #0x4]
    6014: b9400284     	ldr	w4, [x20]
    6018: 52800022     	mov	w2, #0x1                // =1
    601c: b901b804     	str	w4, [x0, #0x1b8]
    6020: 79000823     	strh	w3, [x1, #0x4]
    6024: d2800023     	mov	x3, #0x1                // =1
    6028: 39001822     	strb	w2, [x1, #0x6]
    602c: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6030: 91002042     	add	x2, x2, #0x8
    6034: f900d803     	str	x3, [x0, #0x1b0]
    6038: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    603c: 912d0000     	add	x0, x0, #0xb40
    6040: 97fffb30     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6044: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6048: 91004000     	add	x0, x0, #0x10
    604c: 9106e002     	add	x2, x0, #0x1b8
    6050: 3946f800     	ldrb	w0, [x0, #0x1be]
    6054: 36000220     	tbz	w0, #0x0, 0x6098 <main+0xe18>
    6058: 52800000     	mov	w0, #0x0                // =0
    605c: d503201f     	nop
    6060: d283eba3     	mov	x3, #0x1f5d             // =8029
    6064: 39400041     	ldrb	w1, [x2]
    6068: f2a33463     	movk	x3, #0x19a3, lsl #16
    606c: f2d7a223     	movk	x3, #0xbd11, lsl #32
    6070: f2e36ea3     	movk	x3, #0x1b75, lsl #48
    6074: 9ac02463     	lsr	x3, x3, x0
    6078: 11002000     	add	w0, w0, #0x8
    607c: 4a030021     	eor	w1, w1, w3
    6080: 38001441     	strb	w1, [x2], #0x1
    6084: 7100c01f     	cmp	w0, #0x30
    6088: 54fffec1     	b.ne	0x6060 <main+0xde0>
    608c: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6090: 91004000     	add	x0, x0, #0x10
    6094: 3906f81f     	strb	wzr, [x0, #0x1be]
    6098: 9140027a     	add	x26, x19, #0x0, lsl #12 // =0x0
    609c: 9100435a     	add	x26, x26, #0x10
    60a0: f9012ff7     	str	x23, [sp, #0x258]
    60a4: 9106e356     	add	x22, x26, #0x1b8
    60a8: aa1603e0     	mov	x0, x22
    60ac: 97fffc25     	bl	0x5140 <strlen@plt>
    60b0: aa0003f5     	mov	x21, x0
    60b4: f100041f     	cmp	x0, #0x1
    60b8: 54001540     	b.eq	0x6360 <main+0x10e0>
    60bc: b40000a0     	cbz	x0, 0x60d0 <main+0xe50>
    60c0: aa0003e2     	mov	x2, x0
    60c4: aa1603e1     	mov	x1, x22
    60c8: aa1703e0     	mov	x0, x23
    60cc: 97fffb65     	bl	0x4e60 <memcpy@plt>
    60d0: f90133f5     	str	x21, [sp, #0x260]
    60d4: 38356aff     	strb	wzr, [x23, x21]
    60d8: f94123e2     	ldr	x2, [sp, #0x240]
    60dc: f94133e0     	ldr	x0, [sp, #0x260]
    60e0: eb00005f     	cmp	x2, x0
    60e4: 54001240     	b.eq	0x632c <main+0x10ac>
    60e8: f9412fe0     	ldr	x0, [sp, #0x258]
    60ec: eb17001f     	cmp	x0, x23
    60f0: 54000080     	b.eq	0x6100 <main+0xe80>
    60f4: f94137e1     	ldr	x1, [sp, #0x268]
    60f8: 91000421     	add	x1, x1, #0x1
    60fc: 97fffab9     	bl	0x4be0 <_ZdlPvm@plt>
    6100: f9400fe0     	ldr	x0, [sp, #0x18]
    6104: b00c3fd3     	adrp	x19, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6108: f9474273     	ldr	x19, [x19, #0xe80]
    610c: 97fffbb5     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6110: f9409be0     	ldr	x0, [sp, #0x130]
    6114: 94000866     	bl	0x82ac <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::_M_erase(std::_Rb_tree_node<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>*) (.isra.0)>
    6118: 14000009     	b	0x613c <main+0xebc>
    611c: f94087e3     	ldr	x3, [sp, #0x108]
    6120: aa1b03e0     	mov	x0, x27
    6124: d2800002     	mov	x2, #0x0                // =0
    6128: 94001ffe     	bl	0xe120 <zplane::StemsPro::process(float const* const*, unsigned long, float* const*)>
    612c: f94007e0     	ldr	x0, [sp, #0x8]
    6130: aa1303e1     	mov	x1, x19
    6134: 12800002     	mov	w2, #-0x1               // =-1
    6138: 94000fc2     	bl	0xa040 <writeAudioParamBlock(AudioBuffer const&, std::ostream&, int)>
    613c: aa1b03e0     	mov	x0, x27
    6140: 94002032     	bl	0xe208 <zplane::StemsPro::getFramesNeeded()>
    6144: f940b7e1     	ldr	x1, [sp, #0x168]
    6148: b4fffea0     	cbz	x0, 0x611c <main+0xe9c>
    614c: b98187e2     	ldrsw	x2, [sp, #0x184]
    6150: aa1b03e0     	mov	x0, x27
    6154: 94002001     	bl	0xe158 <zplane::StemsPro::finishProcessing(float const* const*, unsigned long)>
    6158: b00c3fd5     	adrp	x21, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    615c: f94742b5     	ldr	x21, [x21, #0xe80]
    6160: 52800156     	mov	w22, #0xa               // =10
    6164: 14000004     	b	0x6174 <main+0xef4>
    6168: f94007e0     	ldr	x0, [sp, #0x8]
    616c: aa1503e1     	mov	x1, x21
    6170: 94000fb4     	bl	0xa040 <writeAudioParamBlock(AudioBuffer const&, std::ostream&, int)>
    6174: f94003e2     	ldr	x2, [sp]
    6178: aa1b03e0     	mov	x0, x27
    617c: f94087e1     	ldr	x1, [sp, #0x108]
    6180: f90093ff     	str	xzr, [sp, #0x120]
    6184: 94002003     	bl	0xe190 <zplane::StemsPro::flushBuffer(float* const*, unsigned long&)>
    6188: 2a0003f3     	mov	w19, w0
    618c: 350084c0     	cbnz	w0, 0x7224 <main+0x1fa4>
    6190: f94093e2     	ldr	x2, [sp, #0x120]
    6194: b4003602     	cbz	x2, 0x6854 <main+0x15d4>
    6198: d00c3fc0     	adrp	x0, 0x18800000 <data_start>
    619c: d00c3fc1     	adrp	x1, 0x18800000 <data_start>
    61a0: 91016033     	add	x19, x1, #0x58
    61a4: 39416000     	ldrb	w0, [x0, #0x58]
    61a8: 3607fe00     	tbz	w0, #0x0, 0x6168 <main+0xee8>
    61ac: 97fffaf9     	bl	0x4d90 <rand@plt>
    61b0: 1ad60c01     	sdiv	w1, w0, w22
    61b4: 0b010821     	add	w1, w1, w1, lsl #2
    61b8: 4b010401     	sub	w1, w0, w1, lsl #1
    61bc: 7100103f     	cmp	w1, #0x4
    61c0: 54000a00     	b.eq	0x6300 <main+0x1080>
    61c4: f94093e2     	ldr	x2, [sp, #0x120]
    61c8: 17ffffe8     	b	0x6168 <main+0xee8>
    61cc: b0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    61d0: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    61d4: 91004063     	add	x3, x3, #0x10
    61d8: fd432000     	ldr	d0, [x0, #0x640]
    61dc: 5286f640     	mov	w0, #0x37b2             // =14258
    61e0: 7904c3e0     	strh	w0, [sp, #0x260]
    61e4: f940ec60     	ldr	x0, [x3, #0x1d8]
    61e8: fd012fe0     	str	d0, [sp, #0x258]
    61ec: 370001c0     	tbnz	w0, #0x0, 0x6224 <main+0xfa4>
    61f0: f9412fe4     	ldr	x4, [sp, #0x258]
    61f4: 91078061     	add	x1, x3, #0x1e0
    61f8: 79401287     	ldrh	w7, [x20, #0x8]
    61fc: 52800026     	mov	w6, #0x1                // =1
    6200: d2800025     	mov	x5, #0x1                // =1
    6204: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6208: 79001027     	strh	w7, [x1, #0x8]
    620c: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    6210: 91002042     	add	x2, x2, #0x8
    6214: 91280000     	add	x0, x0, #0xa00
    6218: 39002826     	strb	w6, [x1, #0xa]
    621c: a91d9065     	stp	x5, x4, [x3, #0x1d8]
    6220: 97fffab8     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6224: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6228: 91004000     	add	x0, x0, #0x10
    622c: 91078002     	add	x2, x0, #0x1e0
    6230: 3947a800     	ldrb	w0, [x0, #0x1ea]
    6234: 360001e0     	tbz	w0, #0x0, 0x6270 <main+0xff0>
    6238: d286fae4     	mov	x4, #0x37d7             // =14295
    623c: d2800000     	mov	x0, #0x0                // =0
    6240: f2b468a4     	movk	x4, #0xa345, lsl #16
    6244: f2dd7024     	movk	x4, #0xeb81, lsl #32
    6248: f2ebbc64     	movk	x4, #0x5de3, lsl #48
    624c: 38606843     	ldrb	w3, [x2, x0]
    6250: d37d0801     	ubfiz	x1, x0, #3, #3
    6254: 9ac12481     	lsr	x1, x4, x1
    6258: 4a030021     	eor	w1, w1, w3
    625c: 38206841     	strb	w1, [x2, x0]
    6260: 91000400     	add	x0, x0, #0x1
    6264: f100281f     	cmp	x0, #0xa
    6268: 54ffff21     	b.ne	0x624c <main+0xfcc>
    626c: 3900285f     	strb	wzr, [x2, #0xa]
    6270: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6274: 91004021     	add	x1, x1, #0x10
    6278: aa1403e0     	mov	x0, x20
    627c: 91078021     	add	x1, x1, #0x1e0
    6280: 9400077b     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6284: f9401be0     	ldr	x0, [sp, #0x30]
    6288: aa1403e1     	mov	x1, x20
    628c: 94000fdd     	bl	0xa200 <bool std::operator==<char, std::char_traits<char>, std::allocator<char>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)>
    6290: 12001c13     	and	w19, w0, #0xff
    6294: aa1403e0     	mov	x0, x20
    6298: 97fffb52     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    629c: 370032f3     	tbnz	w19, #0x0, 0x68f8 <main+0x1678>
    62a0: f9401fe0     	ldr	x0, [sp, #0x38]
    62a4: 97fffb4f     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    62a8: f9401be0     	ldr	x0, [sp, #0x30]
    62ac: 97fffb4d     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    62b0: f9428bf7     	ldr	x23, [sp, #0x510]
    62b4: f9428ff8     	ldr	x24, [sp, #0x518]
    62b8: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    62bc: f947d400     	ldr	x0, [x0, #0xfa8]
    62c0: f9426fe2     	ldr	x2, [sp, #0x4d8]
    62c4: f9400001     	ldr	x1, [x0]
    62c8: eb010042     	subs	x2, x2, x1
    62cc: d2800001     	mov	x1, #0x0                // =0
    62d0: 54003341     	b.ne	0x6938 <main+0x16b8>
    62d4: f9427bf3     	ldr	x19, [sp, #0x4f0]
    62d8: 52800000     	mov	w0, #0x0                // =0
    62dc: f9427ff4     	ldr	x20, [sp, #0x4f8]
    62e0: 911383ff     	add	sp, sp, #0x4e0
    62e4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
    62e8: a9446bf9     	ldp	x25, x26, [sp, #0x40]
    62ec: a94573fb     	ldp	x27, x28, [sp, #0x50]
    62f0: fd4033e8     	ldr	d8, [sp, #0x60]
    62f4: a8c77bfd     	ldp	x29, x30, [sp], #0x70
    62f8: d50323bf     	autiasp
    62fc: d65f03c0     	ret
    6300: a940de60     	ldp	x0, x23, [x19, #0x8]
    6304: cb0002f7     	sub	x23, x23, x0
    6308: 97fffaa2     	bl	0x4d90 <rand@plt>
    630c: f9400662     	ldr	x2, [x19, #0x8]
    6310: 9343fef7     	asr	x23, x23, #3
    6314: 1ad70c01     	sdiv	w1, w0, w23
    6318: 1b178021     	msub	w1, w1, w23, w0
    631c: f861d840     	ldr	x0, [x2, w1, sxtw #3]
    6320: a9007c1f     	stp	xzr, xzr, [x0]
    6324: f94093e2     	ldr	x2, [sp, #0x120]
    6328: 17ffff90     	b	0x6168 <main+0xee8>
    632c: f9411fe0     	ldr	x0, [sp, #0x238]
    6330: f9412ff5     	ldr	x21, [sp, #0x258]
    6334: b40002e2     	cbz	x2, 0x6390 <main+0x1110>
    6338: aa1503e1     	mov	x1, x21
    633c: 97fffbad     	bl	0x51f0 <memcmp@plt>
    6340: 34000280     	cbz	w0, 0x6390 <main+0x1110>
    6344: eb1702bf     	cmp	x21, x23
    6348: 54ffedc0     	b.eq	0x6100 <main+0xe80>
    634c: f94137e1     	ldr	x1, [sp, #0x268]
    6350: aa1503e0     	mov	x0, x21
    6354: 91000421     	add	x1, x1, #0x1
    6358: 97fffa22     	bl	0x4be0 <_ZdlPvm@plt>
    635c: 17ffff69     	b	0x6100 <main+0xe80>
    6360: 3946e340     	ldrb	w0, [x26, #0x1b8]
    6364: 3909a3e0     	strb	w0, [sp, #0x268]
    6368: 17ffff5a     	b	0x60d0 <main+0xe50>
    636c: 3946a340     	ldrb	w0, [x26, #0x1a8]
    6370: 3909a3e0     	strb	w0, [sp, #0x268]
    6374: 17ffff07     	b	0x5f90 <main+0xd10>
    6378: 39464320     	ldrb	w0, [x25, #0x190]
    637c: 3909a3e0     	strb	w0, [sp, #0x268]
    6380: 17fffebd     	b	0x5e74 <main+0xbf4>
    6384: f90123ff     	str	xzr, [sp, #0x240]
    6388: 390923ff     	strb	wzr, [sp, #0x248]
    638c: 17ffff11     	b	0x5fd0 <main+0xd50>
    6390: eb1702bf     	cmp	x21, x23
    6394: 540000a0     	b.eq	0x63a8 <main+0x1128>
    6398: f94137e1     	ldr	x1, [sp, #0x268]
    639c: aa1503e0     	mov	x0, x21
    63a0: 91000421     	add	x1, x1, #0x1
    63a4: 97fffa0f     	bl	0x4be0 <_ZdlPvm@plt>
    63a8: a94c03e1     	ldp	x1, x0, [sp, #0xc0]
    63ac: eb01001f     	cmp	x0, x1
    63b0: 54000240     	b.eq	0x63f8 <main+0x1178>
    63b4: b201f3fa     	mov	x26, #-0x5555555555555556 // =-6148914691236517206
    63b8: 937e7f3c     	sbfiz	x28, x25, #2, #32
    63bc: d2800016     	mov	x22, #0x0               // =0
    63c0: d2800015     	mov	x21, #0x0               // =0
    63c4: f295557a     	movk	x26, #0xaaab
    63c8: f8766821     	ldr	x1, [x1, x22]
    63cc: aa1c03e2     	mov	x2, x28
    63d0: aa1803e0     	mov	x0, x24
    63d4: 97fffa8f     	bl	0x4e10 <_ZNSi4readEPcl@plt>
    63d8: a94c03e1     	ldp	x1, x0, [sp, #0xc0]
    63dc: 910006b5     	add	x21, x21, #0x1
    63e0: 910062d6     	add	x22, x22, #0x18
    63e4: cb010000     	sub	x0, x0, x1
    63e8: 9343fc00     	asr	x0, x0, #3
    63ec: 9b1a7c00     	mul	x0, x0, x26
    63f0: eb0002bf     	cmp	x21, x0
    63f4: 54fffea3     	b.lo	0x63c8 <main+0x1148>
    63f8: 36f80099     	tbz	w25, #0x1f, 0x6408 <main+0x1188>
    63fc: a9406420     	ldp	x0, x25, [x1]
    6400: cb000339     	sub	x25, x25, x0
    6404: d3428739     	ubfx	x25, x25, #2, #32
    6408: a95513e3     	ldp	x3, x4, [sp, #0x150]
    640c: b201f3f5     	mov	x21, #-0x5555555555555556 // =-6148914691236517206
    6410: b94187e5     	ldr	w5, [sp, #0x184]
    6414: f2955575     	movk	x21, #0xaaab
    6418: f9406ffc     	ldr	x28, [sp, #0xd8]
    641c: a9405860     	ldp	x0, x22, [x3]
    6420: cb030081     	sub	x1, x4, x3
    6424: 9343fc21     	asr	x1, x1, #3
    6428: cb0002d6     	sub	x22, x22, x0
    642c: 9b157c21     	mul	x1, x1, x21
    6430: 9342fed6     	asr	x22, x22, #2
    6434: 4b0502d6     	sub	w22, w22, w5
    6438: 6b1902df     	cmp	w22, w25
    643c: 1a99d2d6     	csel	w22, w22, w25, le
    6440: 7100003f     	cmp	w1, #0x0
    6444: 5400028d     	b.le	0x6494 <main+0x1214>
    6448: 937e7eda     	sbfiz	x26, x22, #2, #32
    644c: d2800019     	mov	x25, #0x0               // =0
    6450: 14000003     	b	0x645c <main+0x11dc>
    6454: 8b190720     	add	x0, x25, x25, lsl #1
    6458: f8607860     	ldr	x0, [x3, x0, lsl #3]
    645c: 8b25c800     	add	x0, x0, w5, sxtw #2
    6460: f8797b81     	ldr	x1, [x28, x25, lsl #3]
    6464: f100135f     	cmp	x26, #0x4
    6468: 54000f8d     	b.le	0x6658 <main+0x13d8>
    646c: aa1a03e2     	mov	x2, x26
    6470: 97fff9d8     	bl	0x4bd0 <memmove@plt>
    6474: a95513e3     	ldp	x3, x4, [sp, #0x150]
    6478: b94187e5     	ldr	w5, [sp, #0x184]
    647c: cb030080     	sub	x0, x4, x3
    6480: 91000739     	add	x25, x25, #0x1
    6484: 9343fc00     	asr	x0, x0, #3
    6488: 9b157c00     	mul	x0, x0, x21
    648c: 6b19001f     	cmp	w0, w25
    6490: 54fffe2c     	b.gt	0x6454 <main+0x11d4>
    6494: b94183e2     	ldr	w2, [sp, #0x180]
    6498: 0b1600a5     	add	w5, w5, w22
    649c: b90187e5     	str	w5, [sp, #0x184]
    64a0: 7100005f     	cmp	w2, #0x0
    64a4: 54000e2d     	b.le	0x6668 <main+0x13e8>
    64a8: 6b05005f     	cmp	w2, w5
    64ac: 5400136c     	b.gt	0x6718 <main+0x1498>
    64b0: f94087e3     	ldr	x3, [sp, #0x108]
    64b4: f940b7e1     	ldr	x1, [sp, #0x168]
    64b8: 93407c42     	sxtw	x2, w2
    64bc: aa1b03e0     	mov	x0, x27
    64c0: 94001f18     	bl	0xe120 <zplane::StemsPro::process(float const* const*, unsigned long, float* const*)>
    64c4: 2a0003f5     	mov	w21, w0
    64c8: 35003340     	cbnz	w0, 0x6b30 <main+0x18b0>
    64cc: a95513e3     	ldp	x3, x4, [sp, #0x150]
    64d0: b201f3f5     	mov	x21, #-0x5555555555555556 // =-6148914691236517206
    64d4: f2955575     	movk	x21, #0xaaab
    64d8: b94183e1     	ldr	w1, [sp, #0x180]
    64dc: b94187e5     	ldr	w5, [sp, #0x184]
    64e0: 6b05003f     	cmp	w1, w5
    64e4: cb030080     	sub	x0, x4, x3
    64e8: 1a85d03a     	csel	w26, w1, w5, le
    64ec: 9343fc00     	asr	x0, x0, #3
    64f0: 9b157c00     	mul	x0, x0, x21
    64f4: 7100001f     	cmp	w0, #0x0
    64f8: 5400026d     	b.le	0x6544 <main+0x12c4>
    64fc: 937e7f59     	sbfiz	x25, x26, #2, #32
    6500: d2800017     	mov	x23, #0x0               // =0
    6504: 8b1706e0     	add	x0, x23, x23, lsl #1
    6508: 937e7ca2     	sbfiz	x2, x5, #2, #32
    650c: cb190042     	sub	x2, x2, x25
    6510: f8607860     	ldr	x0, [x3, x0, lsl #3]
    6514: 8b190001     	add	x1, x0, x25
    6518: f100105f     	cmp	x2, #0x4
    651c: 54000eed     	b.le	0x66f8 <main+0x1478>
    6520: 97fff9ac     	bl	0x4bd0 <memmove@plt>
    6524: a95513e3     	ldp	x3, x4, [sp, #0x150]
    6528: b94187e5     	ldr	w5, [sp, #0x184]
    652c: cb030080     	sub	x0, x4, x3
    6530: 910006f7     	add	x23, x23, #0x1
    6534: 9343fc00     	asr	x0, x0, #3
    6538: 9b157c00     	mul	x0, x0, x21
    653c: 6b0002ff     	cmp	w23, w0
    6540: 54fffe2b     	b.lt	0x6504 <main+0x1284>
    6544: 4b1a00a5     	sub	w5, w5, w26
    6548: aa1b03e0     	mov	x0, x27
    654c: b90187e5     	str	w5, [sp, #0x184]
    6550: 94001f2e     	bl	0xe208 <zplane::StemsPro::getFramesNeeded()>
    6554: f94063e1     	ldr	x1, [sp, #0xc0]
    6558: b201f3f5     	mov	x21, #-0x5555555555555556 // =-6148914691236517206
    655c: a95513e3     	ldp	x3, x4, [sp, #0x150]
    6560: f2955575     	movk	x21, #0xaaab
    6564: a9400427     	ldp	x7, x1, [x1]
    6568: b94187e6     	ldr	w6, [sp, #0x184]
    656c: f9406ffc     	ldr	x28, [sp, #0xd8]
    6570: cb030085     	sub	x5, x4, x3
    6574: f9400462     	ldr	x2, [x3, #0x8]
    6578: b90183e0     	str	w0, [sp, #0x180]
    657c: f9400060     	ldr	x0, [x3]
    6580: 9343fca5     	asr	x5, x5, #3
    6584: cb070021     	sub	x1, x1, x7
    6588: cb000042     	sub	x2, x2, x0
    658c: 9342fc21     	asr	x1, x1, #2
    6590: 9b157ca5     	mul	x5, x5, x21
    6594: 9342fc42     	asr	x2, x2, #2
    6598: 4b160021     	sub	w1, w1, w22
    659c: 4b060042     	sub	w2, w2, w6
    65a0: 6b02003f     	cmp	w1, w2
    65a4: 1a82d03a     	csel	w26, w1, w2, le
    65a8: 710000bf     	cmp	w5, #0x0
    65ac: 540002cd     	b.le	0x6604 <main+0x1384>
    65b0: 937e7ed6     	sbfiz	x22, x22, #2, #32
    65b4: 937e7f59     	sbfiz	x25, x26, #2, #32
    65b8: d2800017     	mov	x23, #0x0               // =0
    65bc: 14000003     	b	0x65c8 <main+0x1348>
    65c0: 8b1706e0     	add	x0, x23, x23, lsl #1
    65c4: f8607860     	ldr	x0, [x3, x0, lsl #3]
    65c8: 8b26c800     	add	x0, x0, w6, sxtw #2
    65cc: f8777b85     	ldr	x5, [x28, x23, lsl #3]
    65d0: 8b1600a1     	add	x1, x5, x22
    65d4: f100133f     	cmp	x25, #0x4
    65d8: 5400098d     	b.le	0x6708 <main+0x1488>
    65dc: aa1903e2     	mov	x2, x25
    65e0: 97fff97c     	bl	0x4bd0 <memmove@plt>
    65e4: a95513e3     	ldp	x3, x4, [sp, #0x150]
    65e8: b94187e6     	ldr	w6, [sp, #0x184]
    65ec: cb030080     	sub	x0, x4, x3
    65f0: 910006f7     	add	x23, x23, #0x1
    65f4: 9343fc00     	asr	x0, x0, #3
    65f8: 9b157c00     	mul	x0, x0, x21
    65fc: 6b0002ff     	cmp	w23, w0
    6600: 54fffe0b     	b.lt	0x65c0 <main+0x1340>
    6604: f94007e0     	ldr	x0, [sp, #0x8]
    6608: 0b1a00c3     	add	w3, w6, w26
    660c: f94013e1     	ldr	x1, [sp, #0x20]
    6610: 12800002     	mov	w2, #-0x1               // =-1
    6614: b90187e3     	str	w3, [sp, #0x184]
    6618: 94000e8a     	bl	0xa040 <writeAudioParamBlock(AudioBuffer const&, std::ostream&, int)>
    661c: d00c3fc0     	adrp	x0, 0x18800000 <data_start>
    6620: d00c3fc1     	adrp	x1, 0x18800000 <data_start>
    6624: 91016035     	add	x21, x1, #0x58
    6628: 39416000     	ldrb	w0, [x0, #0x58]
    662c: 37000440     	tbnz	w0, #0x0, 0x66b4 <main+0x1434>
    6630: f9400be1     	ldr	x1, [sp, #0x10]
    6634: f9411fe0     	ldr	x0, [sp, #0x238]
    6638: eb01001f     	cmp	x0, x1
    663c: 54000080     	b.eq	0x664c <main+0x13cc>
    6640: f94127e1     	ldr	x1, [sp, #0x248]
    6644: 91000421     	add	x1, x1, #0x1
    6648: 97fff966     	bl	0x4be0 <_ZdlPvm@plt>
    664c: f9409be0     	ldr	x0, [sp, #0x130]
    6650: 94000717     	bl	0x82ac <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::_M_erase(std::_Rb_tree_node<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>*) (.isra.0)>
    6654: 17fffdcb     	b	0x5d80 <main+0xb00>
    6658: 54fff121     	b.ne	0x647c <main+0x11fc>
    665c: bd400020     	ldr	s0, [x1]
    6660: bd000000     	str	s0, [x0]
    6664: 17ffff86     	b	0x647c <main+0x11fc>
    6668: f94087e3     	ldr	x3, [sp, #0x108]
    666c: f940b7e1     	ldr	x1, [sp, #0x168]
    6670: 54fff241     	b.ne	0x64b8 <main+0x1238>
    6674: aa1b03e0     	mov	x0, x27
    6678: d2800002     	mov	x2, #0x0                // =0
    667c: 94001ea9     	bl	0xe120 <zplane::StemsPro::process(float const* const*, unsigned long, float* const*)>
    6680: aa1b03e0     	mov	x0, x27
    6684: 94001ee1     	bl	0xe208 <zplane::StemsPro::getFramesNeeded()>
    6688: f94013e1     	ldr	x1, [sp, #0x20]
    668c: aa0003e3     	mov	x3, x0
    6690: f94007e0     	ldr	x0, [sp, #0x8]
    6694: 12800002     	mov	w2, #-0x1               // =-1
    6698: b90183e3     	str	w3, [sp, #0x180]
    669c: 94000e69     	bl	0xa040 <writeAudioParamBlock(AudioBuffer const&, std::ostream&, int)>
    66a0: d00c3fc0     	adrp	x0, 0x18800000 <data_start>
    66a4: d00c3fc1     	adrp	x1, 0x18800000 <data_start>
    66a8: 91016035     	add	x21, x1, #0x58
    66ac: 39416000     	ldrb	w0, [x0, #0x58]
    66b0: 3607fc00     	tbz	w0, #0x0, 0x6630 <main+0x13b0>
    66b4: 97fff9b7     	bl	0x4d90 <rand@plt>
    66b8: 52800141     	mov	w1, #0xa                // =10
    66bc: 1ac10c01     	sdiv	w1, w0, w1
    66c0: 0b010821     	add	w1, w1, w1, lsl #2
    66c4: 4b010401     	sub	w1, w0, w1, lsl #1
    66c8: 7100103f     	cmp	w1, #0x4
    66cc: 54fffb21     	b.ne	0x6630 <main+0x13b0>
    66d0: a940daa0     	ldp	x0, x22, [x21, #0x8]
    66d4: cb0002d6     	sub	x22, x22, x0
    66d8: 97fff9ae     	bl	0x4d90 <rand@plt>
    66dc: f94006a2     	ldr	x2, [x21, #0x8]
    66e0: 9343fed6     	asr	x22, x22, #3
    66e4: 1ad60c01     	sdiv	w1, w0, w22
    66e8: 1b168021     	msub	w1, w1, w22, w0
    66ec: f861d840     	ldr	x0, [x2, w1, sxtw #3]
    66f0: a9007c1f     	stp	xzr, xzr, [x0]
    66f4: 17ffffcf     	b	0x6630 <main+0x13b0>
    66f8: 54fff1a1     	b.ne	0x652c <main+0x12ac>
    66fc: bc796800     	ldr	s0, [x0, x25]
    6700: bd000000     	str	s0, [x0]
    6704: 17ffff8a     	b	0x652c <main+0x12ac>
    6708: 54fff721     	b.ne	0x65ec <main+0x136c>
    670c: bc7668a0     	ldr	s0, [x5, x22]
    6710: bd000000     	str	s0, [x0]
    6714: 17ffffb6     	b	0x65ec <main+0x136c>
    6718: b0000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    671c: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6720: 91004000     	add	x0, x0, #0x10
    6724: f94023e2     	ldr	x2, [sp, #0x40]
    6728: f90047e2     	str	x2, [sp, #0x88]
    672c: fd431820     	ldr	d0, [x1, #0x630]
    6730: 52821301     	mov	w1, #0x1098             // =4248
    6734: 72b2d2c1     	movk	w1, #0x9696, lsl #16
    6738: b90263e1     	str	w1, [sp, #0x260]
    673c: f940e001     	ldr	x1, [x0, #0x1c0]
    6740: 12800702     	mov	w2, #-0x39              // =-57
    6744: 390993e2     	strb	w2, [sp, #0x264]
    6748: fd012fe0     	str	d0, [sp, #0x258]
    674c: 370001c1     	tbnz	w1, #0x0, 0x6784 <main+0x1504>
    6750: 91072001     	add	x1, x0, #0x1c8
    6754: 52800022     	mov	w2, #0x1                // =1
    6758: f9400283     	ldr	x3, [x20]
    675c: 39003422     	strb	w2, [x1, #0xd]
    6760: d2800022     	mov	x2, #0x1                // =1
    6764: a91c0c02     	stp	x2, x3, [x0, #0x1c0]
    6768: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    676c: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    6770: f8405283     	ldur	x3, [x20, #0x5]
    6774: 91002042     	add	x2, x2, #0x8
    6778: 912d8000     	add	x0, x0, #0xb60
    677c: f8005023     	stur	x3, [x1, #0x5]
    6780: 97fff960     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6784: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6788: 91004021     	add	x1, x1, #0x10
    678c: 91072020     	add	x0, x1, #0x1c8
    6790: 39475421     	ldrb	w1, [x1, #0x1d5]
    6794: 36000041     	tbz	w1, #0x0, 0x679c <main+0x151c>
    6798: 9400050c     	bl	0x7bc8 <ay::obfuscated_data<13ull, 14785301942539353593ull>::decrypt() (.part.0)>
    679c: 91400279     	add	x25, x19, #0x0, lsl #12 // =0x0
    67a0: 91004339     	add	x25, x25, #0x10
    67a4: f9012ff7     	str	x23, [sp, #0x258]
    67a8: 91072336     	add	x22, x25, #0x1c8
    67ac: aa1603e0     	mov	x0, x22
    67b0: 97fffa64     	bl	0x5140 <strlen@plt>
    67b4: aa0003f5     	mov	x21, x0
    67b8: f100041f     	cmp	x0, #0x1
    67bc: 54000980     	b.eq	0x68ec <main+0x166c>
    67c0: b40000a0     	cbz	x0, 0x67d4 <main+0x1554>
    67c4: aa0003e2     	mov	x2, x0
    67c8: aa1603e1     	mov	x1, x22
    67cc: aa1703e0     	mov	x0, x23
    67d0: 97fff9a4     	bl	0x4e60 <memcpy@plt>
    67d4: f90133f5     	str	x21, [sp, #0x260]
    67d8: 38356aff     	strb	wzr, [x23, x21]
    67dc: f94013e0     	ldr	x0, [sp, #0x20]
    67e0: f9412fe1     	ldr	x1, [sp, #0x258]
    67e4: f94133e2     	ldr	x2, [sp, #0x260]
    67e8: 97fffa4a     	bl	0x5110 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    67ec: 90000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    67f0: aa0003f5     	mov	x21, x0
    67f4: 9117a021     	add	x1, x1, #0x5e8
    67f8: d2800022     	mov	x2, #0x1                // =1
    67fc: 97fffa45     	bl	0x5110 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    6800: aa1503e0     	mov	x0, x21
    6804: 52800001     	mov	w1, #0x0                // =0
    6808: 97fff932     	bl	0x4cd0 <_ZNSolsEi@plt>
    680c: b0000175     	adrp	x21, 0x33000 <_IO_stdin_used+0xa20>
    6810: d2800022     	mov	x2, #0x1                // =1
    6814: 911222a1     	add	x1, x21, #0x488
    6818: 97fffa3e     	bl	0x5110 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    681c: f9412fe0     	ldr	x0, [sp, #0x258]
    6820: eb17001f     	cmp	x0, x23
    6824: 54000080     	b.eq	0x6834 <main+0x15b4>
    6828: f94137e1     	ldr	x1, [sp, #0x268]
    682c: 91000421     	add	x1, x1, #0x1
    6830: 97fff8ec     	bl	0x4be0 <_ZdlPvm@plt>
    6834: 911222a1     	add	x1, x21, #0x488
    6838: d2800022     	mov	x2, #0x1                // =1
    683c: f94013f5     	ldr	x21, [sp, #0x20]
    6840: aa1503e0     	mov	x0, x21
    6844: 97fffa33     	bl	0x5110 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    6848: aa1503e0     	mov	x0, x21
    684c: 97fff97d     	bl	0x4e40 <_ZNSo5flushEv@plt>
    6850: 17ffff73     	b	0x661c <main+0x139c>
    6854: f94023e2     	ldr	x2, [sp, #0x40]
    6858: 90000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    685c: aa1403e0     	mov	x0, x20
    6860: 911b6021     	add	x1, x1, #0x6d8
    6864: f90093e2     	str	x2, [sp, #0x120]
    6868: 94000601     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    686c: f9412fe1     	ldr	x1, [sp, #0x258]
    6870: 90000163     	adrp	x3, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    6874: f94133e2     	ldr	x2, [sp, #0x260]
    6878: 911b8063     	add	x3, x3, #0x6e0
    687c: f94003f3     	ldr	x19, [sp]
    6880: aa1303e0     	mov	x0, x19
    6884: 94000541     	bl	0x7d88 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<char [5]>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, char const (&) [5]) (.isra.0)>
    6888: aa1403e0     	mov	x0, x20
    688c: 97fff9d5     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6890: aa1303e0     	mov	x0, x19
    6894: 94000ddb     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6898: 9105a3e0     	add	x0, sp, #0x168
    689c: 94000dd1     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    68a0: f94017e0     	ldr	x0, [sp, #0x28]
    68a4: 94000da7     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    68a8: 910423e0     	add	x0, sp, #0x108
    68ac: 94000dcd     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    68b0: f94007e0     	ldr	x0, [sp, #0x8]
    68b4: 94000da3     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    68b8: 910363e0     	add	x0, sp, #0xd8
    68bc: 94000dc9     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    68c0: f9402be0     	ldr	x0, [sp, #0x50]
    68c4: 94000d9f     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    68c8: aa1b03e0     	mov	x0, x27
    68cc: 94001d93     	bl	0xdf18 <zplane::StemsPro::~StemsPro()>
    68d0: f94027e0     	ldr	x0, [sp, #0x48]
    68d4: 97fff9c3     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    68d8: f94053e0     	ldr	x0, [sp, #0xa0]
    68dc: 94000674     	bl	0x82ac <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::_M_erase(std::_Rb_tree_node<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>*) (.isra.0)>
    68e0: 910763e0     	add	x0, sp, #0x1d8
    68e4: 94000ce7     	bl	0x9c80 <std::_Function_base::~_Function_base()>
    68e8: 17fffe6e     	b	0x62a0 <main+0x1020>
    68ec: 39472320     	ldrb	w0, [x25, #0x1c8]
    68f0: 3909a3e0     	strb	w0, [sp, #0x268]
    68f4: 17ffffb8     	b	0x67d4 <main+0x1554>
    68f8: 910983e1     	add	x1, sp, #0x260
    68fc: aa1403e0     	mov	x0, x20
    6900: a93ffc3f     	stp	xzr, xzr, [x1, #-0x8]
    6904: f90137ff     	str	xzr, [sp, #0x268]
    6908: f9013bff     	str	xzr, [sp, #0x270]
    690c: 94000735     	bl	0x85e0 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)>
    6910: aa1403e0     	mov	x0, x20
    6914: 94000cdb     	bl	0x9c80 <std::_Function_base::~_Function_base()>
    6918: 17fffe62     	b	0x62a0 <main+0x1020>
    691c: aa1803e0     	mov	x0, x24
    6920: 94000e50     	bl	0xa260 <std::function<void ()>::operator()() const>
    6924: 17fffbdf     	b	0x58a0 <main+0x620>
    6928: 52800000     	mov	w0, #0x0                // =0
    692c: f9028bf7     	str	x23, [sp, #0x510]
    6930: f9028ff8     	str	x24, [sp, #0x518]
    6934: 97fff8db     	bl	0x4ca0 <exit@plt>
    6938: f9028bf7     	str	x23, [sp, #0x510]
    693c: f9028ff8     	str	x24, [sp, #0x518]
    6940: 97fffa24     	bl	0x51d0 <__stack_chk_fail@plt>
    6944: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    6948: 91004063     	add	x3, x3, #0x10
    694c: b0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    6950: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6954: 52800024     	mov	w4, #0x1                // =1
    6958: fd431c00     	ldr	d0, [x0, #0x638]
    695c: f9406c61     	ldr	x1, [x3, #0xd8]
    6960: 39016044     	strb	w4, [x2, #0x58]
    6964: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6968: f9474000     	ldr	x0, [x0, #0xe80]
    696c: 12808f62     	mov	w2, #-0x47c             // =-1148
    6970: f90093e0     	str	x0, [sp, #0x120]
    6974: 7904c3e2     	strh	w2, [sp, #0x260]
    6978: fd012fe0     	str	d0, [sp, #0x258]
    697c: 370001a1     	tbnz	w1, #0x0, 0x69b0 <main+0x1730>
    6980: f9412fe5     	ldr	x5, [sp, #0x258]
    6984: d2800026     	mov	x6, #0x1                // =1
    6988: 79401287     	ldrh	w7, [x20, #0x8]
    698c: 91038061     	add	x1, x3, #0xe0
    6990: 79001027     	strh	w7, [x1, #0x8]
    6994: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6998: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    699c: 91002042     	add	x2, x2, #0x8
    69a0: 91260000     	add	x0, x0, #0x980
    69a4: 39002824     	strb	w4, [x1, #0xa]
    69a8: a90d9466     	stp	x6, x5, [x3, #0xd8]
    69ac: 97fff8d5     	bl	0x4d00 <__cxa_thread_atexit@plt>
    69b0: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    69b4: 91004021     	add	x1, x1, #0x10
    69b8: 91038020     	add	x0, x1, #0xe0
    69bc: 3943a821     	ldrb	w1, [x1, #0xea]
    69c0: 36000221     	tbz	w1, #0x0, 0x6a04 <main+0x1784>
    69c4: d29f7c63     	mov	x3, #0xfbe3             // =64483
    69c8: d2800002     	mov	x2, #0x0                // =0
    69cc: f2abf423     	movk	x3, #0x5fa1, lsl #16
    69d0: f2cfb6e3     	movk	x3, #0x7db7, lsl #32
    69d4: f2e3b963     	movk	x3, #0x1dcb, lsl #48
    69d8: 39400004     	ldrb	w4, [x0]
    69dc: d37d0841     	ubfiz	x1, x2, #3, #3
    69e0: 91000442     	add	x2, x2, #0x1
    69e4: 9ac12461     	lsr	x1, x3, x1
    69e8: 4a040021     	eor	w1, w1, w4
    69ec: 38001401     	strb	w1, [x0], #0x1
    69f0: f100285f     	cmp	x2, #0xa
    69f4: 54ffff21     	b.ne	0x69d8 <main+0x1758>
    69f8: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    69fc: 91004000     	add	x0, x0, #0x10
    6a00: 3903a81f     	strb	wzr, [x0, #0xea]
    6a04: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6a08: 91004021     	add	x1, x1, #0x10
    6a0c: 9108e3e0     	add	x0, sp, #0x238
    6a10: 91038021     	add	x1, x1, #0xe0
    6a14: f9000fe0     	str	x0, [sp, #0x18]
    6a18: 94000595     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6a1c: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    6a20: 91004063     	add	x3, x3, #0x10
    6a24: 529350a0     	mov	w0, #0x9a85             // =39557
    6a28: 72a67900     	movk	w0, #0x33c8, lsl #16
    6a2c: 52833a44     	mov	w4, #0x19d2             // =6610
    6a30: 12800682     	mov	w2, #-0x35              // =-53
    6a34: b9025be0     	str	w0, [sp, #0x258]
    6a38: f9407861     	ldr	x1, [x3, #0xf0]
    6a3c: 7904bbe4     	strh	w4, [sp, #0x25c]
    6a40: 39097be2     	strb	w2, [sp, #0x25e]
    6a44: 370001a1     	tbnz	w1, #0x0, 0x6a78 <main+0x17f8>
    6a48: b8403285     	ldur	w5, [x20, #0x3]
    6a4c: 9103e061     	add	x1, x3, #0xf8
    6a50: d2e02002     	mov	x2, #0x100000000000000  // =72057594037927936
    6a54: d2800024     	mov	x4, #0x1                // =1
    6a58: a90f0864     	stp	x4, x2, [x3, #0xf0]
    6a5c: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6a60: 91002042     	add	x2, x2, #0x8
    6a64: b900f860     	str	w0, [x3, #0xf8]
    6a68: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    6a6c: 91268000     	add	x0, x0, #0x9a0
    6a70: b8003025     	stur	w5, [x1, #0x3]
    6a74: 97fff8a3     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6a78: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6a7c: 91004021     	add	x1, x1, #0x10
    6a80: 9103e020     	add	x0, x1, #0xf8
    6a84: 3943fc21     	ldrb	w1, [x1, #0xff]
    6a88: 36000201     	tbz	w1, #0x0, 0x6ac8 <main+0x1848>
    6a8c: d29f7c63     	mov	x3, #0xfbe3             // =64483
    6a90: 52800001     	mov	w1, #0x0                // =0
    6a94: f2abf423     	movk	x3, #0x5fa1, lsl #16
    6a98: f2cfb6e3     	movk	x3, #0x7db7, lsl #32
    6a9c: f2e3b963     	movk	x3, #0x1dcb, lsl #48
    6aa0: 39400002     	ldrb	w2, [x0]
    6aa4: 9ac12464     	lsr	x4, x3, x1
    6aa8: 11002021     	add	w1, w1, #0x8
    6aac: 4a040042     	eor	w2, w2, w4
    6ab0: 38001402     	strb	w2, [x0], #0x1
    6ab4: 7100e03f     	cmp	w1, #0x38
    6ab8: 54ffff41     	b.ne	0x6aa0 <main+0x1820>
    6abc: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6ac0: 91004000     	add	x0, x0, #0x10
    6ac4: 3903fc1f     	strb	wzr, [x0, #0xff]
    6ac8: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6acc: 91004021     	add	x1, x1, #0x10
    6ad0: aa1403e0     	mov	x0, x20
    6ad4: 9103e021     	add	x1, x1, #0xf8
    6ad8: 94000565     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6adc: f9411fe1     	ldr	x1, [sp, #0x238]
    6ae0: 910483f3     	add	x19, sp, #0x120
    6ae4: f94123e2     	ldr	x2, [sp, #0x240]
    6ae8: aa1303e0     	mov	x0, x19
    6aec: aa1403e3     	mov	x3, x20
    6af0: f90003f3     	str	x19, [sp]
    6af4: 940004cc     	bl	0x7e24 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) (.isra.0)>
    6af8: aa1403e0     	mov	x0, x20
    6afc: 97fff939     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6b00: f9400fe0     	ldr	x0, [sp, #0x18]
    6b04: 97fff937     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6b08: aa1303e0     	mov	x0, x19
    6b0c: 94000d3d     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6b10: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6b14: f947d400     	ldr	x0, [x0, #0xfa8]
    6b18: f9426fe2     	ldr	x2, [sp, #0x4d8]
    6b1c: f9400001     	ldr	x1, [x0]
    6b20: eb010042     	subs	x2, x2, x1
    6b24: d2800001     	mov	x1, #0x0                // =0
    6b28: 54000341     	b.ne	0x6b90 <main+0x1910>
    6b2c: 97fff9c5     	bl	0x5240 <(anonymous namespace)::errorExit(bool) (.isra.0)>
    6b30: d2800300     	mov	x0, #0x18               // =24
    6b34: 97fff887     	bl	0x4d50 <__cxa_allocate_exception@plt>
    6b38: b0000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    6b3c: aa0003f3     	mov	x19, x0
    6b40: 91184021     	add	x1, x1, #0x610
    6b44: aa1403e0     	mov	x0, x20
    6b48: 94000549     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6b4c: aa1403e1     	mov	x1, x20
    6b50: aa1303e0     	mov	x0, x19
    6b54: 97fff843     	bl	0x4c60 <_ZNSt13runtime_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@plt>
    6b58: b00c3fd6     	adrp	x22, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6b5c: 911382d6     	add	x22, x22, #0x4e0
    6b60: 910042c1     	add	x1, x22, #0x10
    6b64: f9000261     	str	x1, [x19]
    6b68: b9001275     	str	w21, [x19, #0x10]
    6b6c: aa1403e0     	mov	x0, x20
    6b70: 97fff91c     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6b74: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6b78: f947d400     	ldr	x0, [x0, #0xfa8]
    6b7c: f9426fe2     	ldr	x2, [sp, #0x4d8]
    6b80: f9400001     	ldr	x1, [x0]
    6b84: eb010042     	subs	x2, x2, x1
    6b88: d2800001     	mov	x1, #0x0                // =0
    6b8c: 54004600     	b.eq	0x744c <main+0x21cc>
    6b90: 97fff990     	bl	0x51d0 <__stack_chk_fail@plt>
    6b94: d503249f     	bti	j
    6b98: aa0003f6     	mov	x22, x0
    6b9c: aa0103f3     	mov	x19, x1
    6ba0: aa1403e0     	mov	x0, x20
    6ba4: 97fff90f     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6ba8: f9400fe0     	ldr	x0, [sp, #0x18]
    6bac: 97fff90d     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6bb0: f94003e0     	ldr	x0, [sp]
    6bb4: aa1303f5     	mov	x21, x19
    6bb8: 94000d12     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6bbc: f9428bf7     	ldr	x23, [sp, #0x510]
    6bc0: f9428ff8     	ldr	x24, [sp, #0x518]
    6bc4: f9401fe0     	ldr	x0, [sp, #0x38]
    6bc8: 97fff906     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6bcc: f9401be0     	ldr	x0, [sp, #0x30]
    6bd0: 97fff904     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6bd4: aa1603e0     	mov	x0, x22
    6bd8: f10006bf     	cmp	x21, #0x1
    6bdc: 540014e1     	b.ne	0x6e78 <main+0x1bf8>
    6be0: 97fff7f8     	bl	0x4bc0 <__cxa_begin_catch@plt>
    6be4: d53bd053     	mrs	x19, TPIDR_EL0
    6be8: f9400001     	ldr	x1, [x0]
    6bec: aa0003f6     	mov	x22, x0
    6bf0: f9400821     	ldr	x1, [x1, #0x10]
    6bf4: d63f0020     	blr	x1
    6bf8: b0000160     	adrp	x0, 0x33000 <_IO_stdin_used+0xa20>
    6bfc: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    6c00: 91004063     	add	x3, x3, #0x10
    6c04: 528d6d01     	mov	w1, #0x6b68             // =27496
    6c08: 7904c3e1     	strh	w1, [sp, #0x260]
    6c0c: fd432400     	ldr	d0, [x0, #0x648]
    6c10: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6c14: f9474000     	ldr	x0, [x0, #0xe80]
    6c18: f900abe0     	str	x0, [sp, #0x150]
    6c1c: f940f860     	ldr	x0, [x3, #0x1f0]
    6c20: fd012fe0     	str	d0, [sp, #0x258]
    6c24: 37000180     	tbnz	w0, #0x0, 0x6c54 <main+0x19d4>
    6c28: f9412fe4     	ldr	x4, [sp, #0x258]
    6c2c: 9107e061     	add	x1, x3, #0x1f8
    6c30: 79401285     	ldrh	w5, [x20, #0x8]
    6c34: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6c38: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    6c3c: 91002042     	add	x2, x2, #0x8
    6c40: 79001025     	strh	w5, [x1, #0x8]
    6c44: 91288000     	add	x0, x0, #0xa20
    6c48: 39002835     	strb	w21, [x1, #0xa]
    6c4c: a91f1075     	stp	x21, x4, [x3, #0x1f0]
    6c50: 97fff82c     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6c54: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6c58: 91004021     	add	x1, x1, #0x10
    6c5c: 9107e020     	add	x0, x1, #0x1f8
    6c60: 39480821     	ldrb	w1, [x1, #0x202]
    6c64: 37001101     	tbnz	w1, #0x0, 0x6e84 <main+0x1c04>
    6c68: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6c6c: 91004021     	add	x1, x1, #0x10
    6c70: 9108e3e0     	add	x0, sp, #0x238
    6c74: 9107e021     	add	x1, x1, #0x1f8
    6c78: f9000fe0     	str	x0, [sp, #0x18]
    6c7c: 940004fc     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6c80: f9411fe1     	ldr	x1, [sp, #0x238]
    6c84: 910543e0     	add	x0, sp, #0x150
    6c88: f94123e2     	ldr	x2, [sp, #0x240]
    6c8c: 910042c3     	add	x3, x22, #0x10
    6c90: f90017e0     	str	x0, [sp, #0x28]
    6c94: 940004db     	bl	0x8000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>& imb::paramblock::detail::ParamBlockWriter<std::ostream>::operator()<int>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, int const&) (.isra.0)>
    6c98: 91400263     	add	x3, x19, #0x0, lsl #12  // =0x0
    6c9c: 91004063     	add	x3, x3, #0x10
    6ca0: b0000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    6ca4: aa0003f5     	mov	x21, x0
    6ca8: fd432820     	ldr	d0, [x1, #0x650]
    6cac: 529d3cc1     	mov	w1, #0xe9e6             // =59878
    6cb0: f9410460     	ldr	x0, [x3, #0x208]
    6cb4: 72b96481     	movk	w1, #0xcb24, lsl #16
    6cb8: b90263e1     	str	w1, [sp, #0x260]
    6cbc: fd012fe0     	str	d0, [sp, #0x258]
    6cc0: 370001e0     	tbnz	w0, #0x0, 0x6cfc <main+0x1a7c>
    6cc4: f9412fe4     	ldr	x4, [sp, #0x258]
    6cc8: 91084061     	add	x1, x3, #0x210
    6ccc: b9400a87     	ldr	w7, [x20, #0x8]
    6cd0: 52800026     	mov	w6, #0x1                // =1
    6cd4: d2800025     	mov	x5, #0x1                // =1
    6cd8: d00c3fc2     	adrp	x2, 0x18800000 <data_start>
    6cdc: b9000827     	str	w7, [x1, #0x8]
    6ce0: f0000000     	adrp	x0, 0x9000 <void (anonymous namespace)::doAudioProcessing<StemsAttenuator>(std::function<void ()> const&) (.constprop.0)+0xa20>
    6ce4: 91002042     	add	x2, x2, #0x8
    6ce8: 91290000     	add	x0, x0, #0xa40
    6cec: 39003026     	strb	w6, [x1, #0xc]
    6cf0: f9010465     	str	x5, [x3, #0x208]
    6cf4: f9010864     	str	x4, [x3, #0x210]
    6cf8: 97fff802     	bl	0x4d00 <__cxa_thread_atexit@plt>
    6cfc: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6d00: 91004021     	add	x1, x1, #0x10
    6d04: 91084020     	add	x0, x1, #0x210
    6d08: 39487021     	ldrb	w1, [x1, #0x21c]
    6d0c: 370010c1     	tbnz	w1, #0x0, 0x6f24 <main+0x1ca4>
    6d10: 91400261     	add	x1, x19, #0x0, lsl #12  // =0x0
    6d14: 91004021     	add	x1, x1, #0x10
    6d18: aa1403e0     	mov	x0, x20
    6d1c: 91084021     	add	x1, x1, #0x210
    6d20: 940004d3     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    6d24: f94002c1     	ldr	x1, [x22]
    6d28: aa1603e0     	mov	x0, x22
    6d2c: f9400821     	ldr	x1, [x1, #0x10]
    6d30: d63f0020     	blr	x1
    6d34: aa0003f3     	mov	x19, x0
    6d38: f94002a0     	ldr	x0, [x21]
    6d3c: f9412fe1     	ldr	x1, [sp, #0x258]
    6d40: f94133e2     	ldr	x2, [sp, #0x260]
    6d44: 97fff8f3     	bl	0x5110 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    6d48: 90000161     	adrp	x1, 0x32000 <pffft_transform_internal(PFFFT_Setup*, float const*, float*, __Float32x4_t*, pffft_direction_t, int)+0x318>
    6d4c: 9117a021     	add	x1, x1, #0x5e8
    6d50: 97fff858     	bl	0x4eb0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    6d54: aa1303e1     	mov	x1, x19
    6d58: 97fff856     	bl	0x4eb0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    6d5c: b0000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    6d60: 91122021     	add	x1, x1, #0x488
    6d64: 97fff853     	bl	0x4eb0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    6d68: aa1403e0     	mov	x0, x20
    6d6c: 97fff89d     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6d70: f9400fe0     	ldr	x0, [sp, #0x18]
    6d74: 97fff89b     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6d78: f94017e0     	ldr	x0, [sp, #0x28]
    6d7c: 94000ca1     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6d80: 97fff88c     	bl	0x4fb0 <__cxa_end_catch@plt>
    6d84: 17fffd4d     	b	0x62b8 <main+0x1038>
    6d88: d503249f     	bti	j
    6d8c: aa0003f6     	mov	x22, x0
    6d90: aa0103f3     	mov	x19, x1
    6d94: 910483e0     	add	x0, sp, #0x120
    6d98: f90003e0     	str	x0, [sp]
    6d9c: 17ffff83     	b	0x6ba8 <main+0x1928>
    6da0: d503249f     	bti	j
    6da4: aa0003f6     	mov	x22, x0
    6da8: aa0103f3     	mov	x19, x1
    6dac: 910483e0     	add	x0, sp, #0x120
    6db0: f90003e0     	str	x0, [sp]
    6db4: 17ffff7f     	b	0x6bb0 <main+0x1930>
    6db8: d503249f     	bti	j
    6dbc: aa0003f6     	mov	x22, x0
    6dc0: aa0103f5     	mov	x21, x1
    6dc4: aa1403e0     	mov	x0, x20
    6dc8: 94000bae     	bl	0x9c80 <std::_Function_base::~_Function_base()>
    6dcc: f9428bf7     	ldr	x23, [sp, #0x510]
    6dd0: f9428ff8     	ldr	x24, [sp, #0x518]
    6dd4: 17ffff7c     	b	0x6bc4 <main+0x1944>
    6dd8: d503249f     	bti	j
    6ddc: aa0003f3     	mov	x19, x0
    6de0: aa0103f5     	mov	x21, x1
    6de4: 14000006     	b	0x6dfc <main+0x1b7c>
    6de8: d503249f     	bti	j
    6dec: aa0003f3     	mov	x19, x0
    6df0: aa0103f5     	mov	x21, x1
    6df4: aa1403e0     	mov	x0, x20
    6df8: 97fff87a     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6dfc: f94003e0     	ldr	x0, [sp]
    6e00: aa1303f7     	mov	x23, x19
    6e04: aa1503f3     	mov	x19, x21
    6e08: 94000c7e     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6e0c: 9105a3e0     	add	x0, sp, #0x168
    6e10: 94000c74     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    6e14: f94017e0     	ldr	x0, [sp, #0x28]
    6e18: aa1703f5     	mov	x21, x23
    6e1c: 94000c49     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    6e20: 910423e0     	add	x0, sp, #0x108
    6e24: 94000c6f     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    6e28: f94007e0     	ldr	x0, [sp, #0x8]
    6e2c: 94000c45     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    6e30: 910363e0     	add	x0, sp, #0xd8
    6e34: 94000c6b     	bl	0x9fe0 <std::vector<float*, std::allocator<float*>>::~vector()>
    6e38: f9402be0     	ldr	x0, [sp, #0x50]
    6e3c: 94000c41     	bl	0x9f40 <std::vector<std::vector<float, std::allocator<float>>, std::allocator<std::vector<float, std::allocator<float>>>>::~vector()>
    6e40: 910763f8     	add	x24, sp, #0x1d8
    6e44: aa1b03e0     	mov	x0, x27
    6e48: 94001c34     	bl	0xdf18 <zplane::StemsPro::~StemsPro()>
    6e4c: f94027e0     	ldr	x0, [sp, #0x48]
    6e50: 97fff864     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6e54: f94053e0     	ldr	x0, [sp, #0xa0]
    6e58: aa1503f6     	mov	x22, x21
    6e5c: 94000514     	bl	0x82ac <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::_M_erase(std::_Rb_tree_node<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>*) (.isra.0)>
    6e60: aa1803e0     	mov	x0, x24
    6e64: aa1303f5     	mov	x21, x19
    6e68: 94000b86     	bl	0x9c80 <std::_Function_base::~_Function_base()>
    6e6c: f9428bf7     	ldr	x23, [sp, #0x510]
    6e70: f9428ff8     	ldr	x24, [sp, #0x518]
    6e74: 17ffff54     	b	0x6bc4 <main+0x1944>
    6e78: 97fff752     	bl	0x4bc0 <__cxa_begin_catch@plt>
    6e7c: 97fff84d     	bl	0x4fb0 <__cxa_end_catch@plt>
    6e80: 17fffd0e     	b	0x62b8 <main+0x1038>
    6e84: d28d61a3     	mov	x3, #0x6b0d             // =27405
    6e88: d2800002     	mov	x2, #0x0                // =0
    6e8c: f2aa2f63     	movk	x3, #0x517b, lsl #16
    6e90: f2cfffe3     	movk	x3, #0x7fff, lsl #32
    6e94: f2e8a823     	movk	x3, #0x4541, lsl #48
    6e98: 39400004     	ldrb	w4, [x0]
    6e9c: d37d0841     	ubfiz	x1, x2, #3, #3
    6ea0: 91000442     	add	x2, x2, #0x1
    6ea4: 9ac12461     	lsr	x1, x3, x1
    6ea8: 4a040021     	eor	w1, w1, w4
    6eac: 38001401     	strb	w1, [x0], #0x1
    6eb0: f100285f     	cmp	x2, #0xa
    6eb4: 54ffff21     	b.ne	0x6e98 <main+0x1c18>
    6eb8: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6ebc: 91004000     	add	x0, x0, #0x10
    6ec0: 3908081f     	strb	wzr, [x0, #0x202]
    6ec4: 17ffff69     	b	0x6c68 <main+0x19e8>
    6ec8: d503249f     	bti	j
    6ecc: aa0003f3     	mov	x19, x0
    6ed0: f9400fe0     	ldr	x0, [sp, #0x18]
    6ed4: 97fff843     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6ed8: f94017e0     	ldr	x0, [sp, #0x28]
    6edc: 94000c49     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    6ee0: 97fff834     	bl	0x4fb0 <__cxa_end_catch@plt>
    6ee4: b00c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    6ee8: f947d400     	ldr	x0, [x0, #0xfa8]
    6eec: f9426fe2     	ldr	x2, [sp, #0x4d8]
    6ef0: f9400001     	ldr	x1, [x0]
    6ef4: eb010042     	subs	x2, x2, x1
    6ef8: d2800001     	mov	x1, #0x0                // =0
    6efc: f9028bf7     	str	x23, [sp, #0x510]
    6f00: f9028ff8     	str	x24, [sp, #0x518]
    6f04: 54ffe461     	b.ne	0x6b90 <main+0x1910>
    6f08: aa1303e0     	mov	x0, x19
    6f0c: 97fff80d     	bl	0x4f40 <_Unwind_Resume@plt>
    6f10: d503249f     	bti	j
    6f14: 910543e1     	add	x1, sp, #0x150
    6f18: aa0003f3     	mov	x19, x0
    6f1c: f90017e1     	str	x1, [sp, #0x28]
    6f20: 17ffffee     	b	0x6ed8 <main+0x1c58>
    6f24: d290f1e3     	mov	x3, #0x878f             // =34703
    6f28: d2800002     	mov	x2, #0x0                // =0
    6f2c: f2b96863     	movk	x3, #0xcb43, lsl #16
    6f30: f2d7e3e3     	movk	x3, #0xbf1f, lsl #32
    6f34: f2e42be3     	movk	x3, #0x215f, lsl #48
    6f38: 39400004     	ldrb	w4, [x0]
    6f3c: d37d0841     	ubfiz	x1, x2, #3, #3
    6f40: 91000442     	add	x2, x2, #0x1
    6f44: 9ac12461     	lsr	x1, x3, x1
    6f48: 4a040021     	eor	w1, w1, w4
    6f4c: 38001401     	strb	w1, [x0], #0x1
    6f50: f100305f     	cmp	x2, #0xc
    6f54: 54ffff21     	b.ne	0x6f38 <main+0x1cb8>
    6f58: 91400260     	add	x0, x19, #0x0, lsl #12  // =0x0
    6f5c: 91004000     	add	x0, x0, #0x10
    6f60: 3908701f     	strb	wzr, [x0, #0x21c]
    6f64: 17ffff6b     	b	0x6d10 <main+0x1a90>
    6f68: d503249f     	bti	j
    6f6c: aa0003f3     	mov	x19, x0
    6f70: aa1403e0     	mov	x0, x20
    6f74: 97fff81b     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6f78: 17ffffd6     	b	0x6ed0 <main+0x1c50>
    6f7c: d503249f     	bti	j
    6f80: aa0003f6     	mov	x22, x0
    6f84: aa0103f3     	mov	x19, x1
    6f88: f9428bf7     	ldr	x23, [sp, #0x510]
    6f8c: 9106e3e1     	add	x1, sp, #0x1b8
    6f90: f9428ff8     	ldr	x24, [sp, #0x518]
    6f94: d2800040     	mov	x0, #0x2                // =2
    6f98: f9001fe1     	str	x1, [sp, #0x38]
    6f9c: d2800095     	mov	x21, #0x4               // =4
    6fa0: cb0002b5     	sub	x21, x21, x0
    6fa4: 8b151e95     	add	x21, x20, x21, lsl #7
    6fa8: eb1402bf     	cmp	x21, x20
    6fac: 54000341     	b.ne	0x7014 <main+0x1d94>
    6fb0: aa1303f5     	mov	x21, x19
    6fb4: 17ffff04     	b	0x6bc4 <main+0x1944>
    6fb8: d503249f     	bti	j
    6fbc: aa0003f6     	mov	x22, x0
    6fc0: aa0103f3     	mov	x19, x1
    6fc4: aa1703e0     	mov	x0, x23
    6fc8: 97fff806     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6fcc: f9428bf7     	ldr	x23, [sp, #0x510]
    6fd0: 9106e3e1     	add	x1, sp, #0x1b8
    6fd4: f9428ff8     	ldr	x24, [sp, #0x518]
    6fd8: d2800060     	mov	x0, #0x3                // =3
    6fdc: f9001fe1     	str	x1, [sp, #0x38]
    6fe0: 17ffffef     	b	0x6f9c <main+0x1d1c>
    6fe4: d503249f     	bti	j
    6fe8: aa0003f6     	mov	x22, x0
    6fec: aa0103f3     	mov	x19, x1
    6ff0: 910763f8     	add	x24, sp, #0x1d8
    6ff4: 17ffff9b     	b	0x6e60 <main+0x1be0>
    6ff8: d503249f     	bti	j
    6ffc: aa0003f6     	mov	x22, x0
    7000: aa0103f3     	mov	x19, x1
    7004: f94017e0     	ldr	x0, [sp, #0x28]
    7008: 910763f8     	add	x24, sp, #0x1d8
    700c: 94000bfd     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    7010: 17ffff94     	b	0x6e60 <main+0x1be0>
    7014: d10202b5     	sub	x21, x21, #0x80
    7018: aa1503e0     	mov	x0, x21
    701c: 94000ba1     	bl	0x9ea0 <imb::params::Parameter::~Parameter()>
    7020: 17ffffe2     	b	0x6fa8 <main+0x1d28>
    7024: d503249f     	bti	j
    7028: aa0003f6     	mov	x22, x0
    702c: aa0103f3     	mov	x19, x1
    7030: aa1903e0     	mov	x0, x25
    7034: 97fff7eb     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7038: 17fffff3     	b	0x7004 <main+0x1d84>
    703c: d503249f     	bti	j
    7040: aa0003f6     	mov	x22, x0
    7044: aa0103f3     	mov	x19, x1
    7048: f9400fe0     	ldr	x0, [sp, #0x18]
    704c: 97fff7e5     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7050: 17fffff8     	b	0x7030 <main+0x1db0>
    7054: d503249f     	bti	j
    7058: aa0003f6     	mov	x22, x0
    705c: aa0103f3     	mov	x19, x1
    7060: aa1403e0     	mov	x0, x20
    7064: 97fff7df     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7068: 17fffff8     	b	0x7048 <main+0x1dc8>
    706c: d503249f     	bti	j
    7070: aa0003f5     	mov	x21, x0
    7074: aa0103f3     	mov	x19, x1
    7078: 910763f8     	add	x24, sp, #0x1d8
    707c: 17ffff76     	b	0x6e54 <main+0x1bd4>
    7080: d503249f     	bti	j
    7084: aa0003f5     	mov	x21, x0
    7088: aa0103f3     	mov	x19, x1
    708c: aa1403e0     	mov	x0, x20
    7090: 910763f8     	add	x24, sp, #0x1d8
    7094: 97fff7d3     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7098: 17ffff6f     	b	0x6e54 <main+0x1bd4>
    709c: d503249f     	bti	j
    70a0: 17fffff9     	b	0x7084 <main+0x1e04>
    70a4: d503249f     	bti	j
    70a8: 17fffff7     	b	0x7084 <main+0x1e04>
    70ac: d503249f     	bti	j
    70b0: 17fffff5     	b	0x7084 <main+0x1e04>
    70b4: d503249f     	bti	j
    70b8: aa0003f6     	mov	x22, x0
    70bc: aa0103f3     	mov	x19, x1
    70c0: f94017e0     	ldr	x0, [sp, #0x28]
    70c4: d2800095     	mov	x21, #0x4               // =4
    70c8: 94000e8e     	bl	0xab00 <std::vector<imb::params::Parameter, std::allocator<imb::params::Parameter>>::~vector()>
    70cc: 8b151e80     	add	x0, x20, x21, lsl #7
    70d0: d10006b5     	sub	x21, x21, #0x1
    70d4: 94000b73     	bl	0x9ea0 <imb::params::Parameter::~Parameter()>
    70d8: b10006bf     	cmn	x21, #0x1
    70dc: 54ffff81     	b.ne	0x70cc <main+0x1e4c>
    70e0: f9428bf7     	ldr	x23, [sp, #0x510]
    70e4: d2800080     	mov	x0, #0x4                // =4
    70e8: f9428ff8     	ldr	x24, [sp, #0x518]
    70ec: 17ffffac     	b	0x6f9c <main+0x1d1c>
    70f0: d503249f     	bti	j
    70f4: f940abe2     	ldr	x2, [sp, #0x150]
    70f8: aa0003f6     	mov	x22, x0
    70fc: f940b3e3     	ldr	x3, [sp, #0x160]
    7100: aa0103f3     	mov	x19, x1
    7104: aa0203e0     	mov	x0, x2
    7108: d2800095     	mov	x21, #0x4               // =4
    710c: cb020061     	sub	x1, x3, x2
    7110: 97fff6b4     	bl	0x4be0 <_ZdlPvm@plt>
    7114: 17ffffee     	b	0x70cc <main+0x1e4c>
    7118: d503249f     	bti	j
    711c: aa0003f6     	mov	x22, x0
    7120: aa0103f3     	mov	x19, x1
    7124: d2800095     	mov	x21, #0x4               // =4
    7128: 17ffffe9     	b	0x70cc <main+0x1e4c>
    712c: d503249f     	bti	j
    7130: aa0103f5     	mov	x21, x1
    7134: aa0003f6     	mov	x22, x0
    7138: aa1303e0     	mov	x0, x19
    713c: 97fff7a9     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7140: f9428bf7     	ldr	x23, [sp, #0x510]
    7144: aa1503f3     	mov	x19, x21
    7148: f9428ff8     	ldr	x24, [sp, #0x518]
    714c: d2800000     	mov	x0, #0x0                // =0
    7150: 17ffff93     	b	0x6f9c <main+0x1d1c>
    7154: d503249f     	bti	j
    7158: aa0003f6     	mov	x22, x0
    715c: aa0103f3     	mov	x19, x1
    7160: 17ffff9b     	b	0x6fcc <main+0x1d4c>
    7164: d503249f     	bti	j
    7168: aa0003f6     	mov	x22, x0
    716c: aa0103f3     	mov	x19, x1
    7170: aa1403e0     	mov	x0, x20
    7174: 97fff79b     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7178: 910663e0     	add	x0, sp, #0x198
    717c: f9001be0     	str	x0, [sp, #0x30]
    7180: 9106e3e0     	add	x0, sp, #0x1b8
    7184: f9001fe0     	str	x0, [sp, #0x38]
    7188: d2800080     	mov	x0, #0x4                // =4
    718c: 17ffff84     	b	0x6f9c <main+0x1d1c>
    7190: d503249f     	bti	j
    7194: f9428bf7     	ldr	x23, [sp, #0x510]
    7198: aa0003f6     	mov	x22, x0
    719c: f9428ff8     	ldr	x24, [sp, #0x518]
    71a0: aa0103f3     	mov	x19, x1
    71a4: d2800020     	mov	x0, #0x1                // =1
    71a8: 17ffff7d     	b	0x6f9c <main+0x1d1c>
    71ac: d503249f     	bti	j
    71b0: aa0003f6     	mov	x22, x0
    71b4: aa0103f3     	mov	x19, x1
    71b8: aa1703e0     	mov	x0, x23
    71bc: 97fff789     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    71c0: 17ffff72     	b	0x6f88 <main+0x1d08>
    71c4: d503249f     	bti	j
    71c8: aa0003f5     	mov	x21, x0
    71cc: aa0103f3     	mov	x19, x1
    71d0: f9400fe0     	ldr	x0, [sp, #0x18]
    71d4: 910763f8     	add	x24, sp, #0x1d8
    71d8: 97fff782     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    71dc: 17ffff1c     	b	0x6e4c <main+0x1bcc>
    71e0: 900c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    71e4: f947d400     	ldr	x0, [x0, #0xfa8]
    71e8: f9426fe2     	ldr	x2, [sp, #0x4d8]
    71ec: f9400001     	ldr	x1, [x0]
    71f0: eb010042     	subs	x2, x2, x1
    71f4: d2800001     	mov	x1, #0x0                // =0
    71f8: 54ffccc1     	b.ne	0x6b90 <main+0x1910>
    71fc: 910763f8     	add	x24, sp, #0x1d8
    7200: 97fff810     	bl	0x5240 <(anonymous namespace)::errorExit(bool) (.isra.0)>
    7204: d503249f     	bti	j
    7208: aa0003f7     	mov	x23, x0
    720c: aa0103f3     	mov	x19, x1
    7210: aa1403e0     	mov	x0, x20
    7214: 97fff773     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7218: f9409be0     	ldr	x0, [sp, #0x130]
    721c: 94000424     	bl	0x82ac <std::_Rb_tree<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::_Select1st<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>, std::less<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>>::_M_erase(std::_Rb_tree_node<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>>>*) (.isra.0)>
    7220: 17fffefb     	b	0x6e0c <main+0x1b8c>
    7224: d2800300     	mov	x0, #0x18               // =24
    7228: 97fff6ca     	bl	0x4d50 <__cxa_allocate_exception@plt>
    722c: 90000161     	adrp	x1, 0x33000 <_IO_stdin_used+0xa20>
    7230: aa0003f5     	mov	x21, x0
    7234: 91184021     	add	x1, x1, #0x610
    7238: aa1403e0     	mov	x0, x20
    723c: 9400038c     	bl	0x806c <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&) (.constprop.0)>
    7240: aa1403e1     	mov	x1, x20
    7244: aa1503e0     	mov	x0, x21
    7248: 97fff686     	bl	0x4c60 <_ZNSt13runtime_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@plt>
    724c: 900c3fd6     	adrp	x22, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    7250: 911382d6     	add	x22, x22, #0x4e0
    7254: 910042c1     	add	x1, x22, #0x10
    7258: f90002a1     	str	x1, [x21]
    725c: b90012b3     	str	w19, [x21, #0x10]
    7260: aa1403e0     	mov	x0, x20
    7264: 97fff75f     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7268: 900c3fc0     	adrp	x0, 0x187ff000 <strlen@GLIBC_2.17+0x187ff000>
    726c: f947d400     	ldr	x0, [x0, #0xfa8]
    7270: f9426fe2     	ldr	x2, [sp, #0x4d8]
    7274: f9400001     	ldr	x1, [x0]
    7278: eb010042     	subs	x2, x2, x1
    727c: d2800001     	mov	x1, #0x0                // =0
    7280: 54ffc881     	b.ne	0x6b90 <main+0x1910>
    7284: 90000002     	adrp	x2, 0x7000 <main+0x1d80>
    7288: 910222c1     	add	x1, x22, #0x88
    728c: aa1503e0     	mov	x0, x21
    7290: 9128b042     	add	x2, x2, #0xa2c
    7294: 97fff71f     	bl	0x4f10 <__cxa_throw@plt>
    7298: d503249f     	bti	j
    729c: aa0003f3     	mov	x19, x0
    72a0: aa0103f6     	mov	x22, x1
    72a4: aa1403e0     	mov	x0, x20
    72a8: 97fff74e     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    72ac: aa1503e0     	mov	x0, x21
    72b0: aa1303f7     	mov	x23, x19
    72b4: 97fff76f     	bl	0x5070 <__cxa_free_exception@plt>
    72b8: aa1603f3     	mov	x19, x22
    72bc: 17fffed4     	b	0x6e0c <main+0x1b8c>
    72c0: d503249f     	bti	j
    72c4: aa0003f3     	mov	x19, x0
    72c8: aa0103f6     	mov	x22, x1
    72cc: 17fffff8     	b	0x72ac <main+0x202c>
    72d0: d503249f     	bti	j
    72d4: aa0003f5     	mov	x21, x0
    72d8: aa0103f3     	mov	x19, x1
    72dc: 17fffed5     	b	0x6e30 <main+0x1bb0>
    72e0: d503249f     	bti	j
    72e4: aa0003f5     	mov	x21, x0
    72e8: aa0103f3     	mov	x19, x1
    72ec: 17fffecd     	b	0x6e20 <main+0x1ba0>
    72f0: d503249f     	bti	j
    72f4: aa0003f7     	mov	x23, x0
    72f8: aa0103f3     	mov	x19, x1
    72fc: 17fffec4     	b	0x6e0c <main+0x1b8c>
    7300: d503249f     	bti	j
    7304: aa0103f3     	mov	x19, x1
    7308: aa0003f7     	mov	x23, x0
    730c: 910483e0     	add	x0, sp, #0x120
    7310: f90003e0     	str	x0, [sp]
    7314: f94003e0     	ldr	x0, [sp]
    7318: 94000b3a     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    731c: 17fffebc     	b	0x6e0c <main+0x1b8c>
    7320: d503249f     	bti	j
    7324: 17ffff58     	b	0x7084 <main+0x1e04>
    7328: d503249f     	bti	j
    732c: 17ffff56     	b	0x7084 <main+0x1e04>
    7330: d503249f     	bti	j
    7334: aa0003f5     	mov	x21, x0
    7338: aa0103f3     	mov	x19, x1
    733c: 17fffec4     	b	0x6e4c <main+0x1bcc>
    7340: d503249f     	bti	j
    7344: 17ffff50     	b	0x7084 <main+0x1e04>
    7348: d503249f     	bti	j
    734c: f9428bf7     	ldr	x23, [sp, #0x510]
    7350: aa0003f6     	mov	x22, x0
    7354: f9428ff8     	ldr	x24, [sp, #0x518]
    7358: aa0103f3     	mov	x19, x1
    735c: d2800000     	mov	x0, #0x0                // =0
    7360: 17ffff0f     	b	0x6f9c <main+0x1d1c>
    7364: d503249f     	bti	j
    7368: aa0003f6     	mov	x22, x0
    736c: aa0103f3     	mov	x19, x1
    7370: aa1703e0     	mov	x0, x23
    7374: 97fff71b     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7378: f9428bf7     	ldr	x23, [sp, #0x510]
    737c: d2800020     	mov	x0, #0x1                // =1
    7380: f9428ff8     	ldr	x24, [sp, #0x518]
    7384: 17ffff06     	b	0x6f9c <main+0x1d1c>
    7388: d503249f     	bti	j
    738c: f9428bf7     	ldr	x23, [sp, #0x510]
    7390: aa0003f6     	mov	x22, x0
    7394: f9428ff8     	ldr	x24, [sp, #0x518]
    7398: aa0103f5     	mov	x21, x1
    739c: 17fffe0a     	b	0x6bc4 <main+0x1944>
    73a0: d503249f     	bti	j
    73a4: aa0103f3     	mov	x19, x1
    73a8: 910663e1     	add	x1, sp, #0x198
    73ac: aa0003f6     	mov	x22, x0
    73b0: d2800080     	mov	x0, #0x4                // =4
    73b4: f9001be1     	str	x1, [sp, #0x30]
    73b8: 9106e3e1     	add	x1, sp, #0x1b8
    73bc: f9001fe1     	str	x1, [sp, #0x38]
    73c0: 17fffef7     	b	0x6f9c <main+0x1d1c>
    73c4: d503249f     	bti	j
    73c8: aa0103f3     	mov	x19, x1
    73cc: aa0003f7     	mov	x23, x0
    73d0: 910483e0     	add	x0, sp, #0x120
    73d4: f90003e0     	str	x0, [sp]
    73d8: aa1903e0     	mov	x0, x25
    73dc: 97fff701     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    73e0: 17ffffcd     	b	0x7314 <main+0x2094>
    73e4: d503249f     	bti	j
    73e8: aa0003f7     	mov	x23, x0
    73ec: aa0103f3     	mov	x19, x1
    73f0: f9400fe0     	ldr	x0, [sp, #0x18]
    73f4: 97fff6fb     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    73f8: 17fffff8     	b	0x73d8 <main+0x2158>
    73fc: d503249f     	bti	j
    7400: aa0103f5     	mov	x21, x1
    7404: aa0003f7     	mov	x23, x0
    7408: aa1503f3     	mov	x19, x21
    740c: aa1403e0     	mov	x0, x20
    7410: 97fff6f4     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7414: 17fffff7     	b	0x73f0 <main+0x2170>
    7418: d503249f     	bti	j
    741c: 17ffff7b     	b	0x7208 <main+0x1f88>
    7420: d503249f     	bti	j
    7424: aa0103f5     	mov	x21, x1
    7428: aa0003f7     	mov	x23, x0
    742c: aa1403e0     	mov	x0, x20
    7430: 97fff6ec     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7434: f9402fe0     	ldr	x0, [sp, #0x58]
    7438: aa1503f3     	mov	x19, x21
    743c: 94000af1     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    7440: f9400fe0     	ldr	x0, [sp, #0x18]
    7444: 97fff6e7     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7448: 17ffff74     	b	0x7218 <main+0x1f98>
    744c: 90000002     	adrp	x2, 0x7000 <main+0x1d80>
    7450: 910222c1     	add	x1, x22, #0x88
    7454: aa1303e0     	mov	x0, x19
    7458: 9128b042     	add	x2, x2, #0xa2c
    745c: 97fff6ad     	bl	0x4f10 <__cxa_throw@plt>
    7460: d503249f     	bti	j
    7464: aa0003f5     	mov	x21, x0
    7468: aa0103f6     	mov	x22, x1
    746c: aa1403e0     	mov	x0, x20
    7470: 97fff6dc     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7474: aa1303e0     	mov	x0, x19
    7478: aa1503f7     	mov	x23, x21
    747c: aa1603f3     	mov	x19, x22
    7480: 97fff6fc     	bl	0x5070 <__cxa_free_exception@plt>
    7484: 17ffffef     	b	0x7440 <main+0x21c0>
    7488: d503249f     	bti	j
    748c: aa0003f5     	mov	x21, x0
    7490: aa0103f6     	mov	x22, x1
    7494: 17fffff8     	b	0x7474 <main+0x21f4>
    7498: d503249f     	bti	j
    749c: aa0003f7     	mov	x23, x0
    74a0: aa0103f3     	mov	x19, x1
    74a4: 17ffffe7     	b	0x7440 <main+0x21c0>
    74a8: d503249f     	bti	j
    74ac: aa0003f5     	mov	x21, x0
    74b0: aa0103f3     	mov	x19, x1
    74b4: aa1403e0     	mov	x0, x20
    74b8: 910763f8     	add	x24, sp, #0x1d8
    74bc: 97fff6c9     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    74c0: 17fffe63     	b	0x6e4c <main+0x1bcc>
    74c4: d503249f     	bti	j
    74c8: aa0003f5     	mov	x21, x0
    74cc: aa0103f3     	mov	x19, x1
    74d0: f94017e0     	ldr	x0, [sp, #0x28]
    74d4: 910763f8     	add	x24, sp, #0x1d8
    74d8: 94000aca     	bl	0xa000 <imb::paramblock::detail::ParamBlockWriter<std::ostream>::~ParamBlockWriter()>
    74dc: 17fffe5c     	b	0x6e4c <main+0x1bcc>
    74e0: d503249f     	bti	j
    74e4: aa0003f5     	mov	x21, x0
    74e8: aa0103f3     	mov	x19, x1
    74ec: f9400fe0     	ldr	x0, [sp, #0x18]
    74f0: 97fff6bc     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    74f4: 17fffff7     	b	0x74d0 <main+0x2250>
    74f8: d503249f     	bti	j
    74fc: aa0003f5     	mov	x21, x0
    7500: aa0103f3     	mov	x19, x1
    7504: aa1403e0     	mov	x0, x20
    7508: 97fff6b6     	bl	0x4fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    750c: 17fffff8     	b	0x74ec <main+0x226c>
    7510: d503249f     	bti	j
    7514: aa0003f5     	mov	x21, x0
    7518: aa0103f3     	mov	x19, x1
    751c: 17fffe49     	b	0x6e40 <main+0x1bc0>
