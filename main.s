	.file	"main.c"
	.text
.Ltext0:
	.comm	__VERS,2,2
	.comm	FRAMECHARS,44,32
	.comm	FRAMECHARSD,44,32
	.section	.rodata
	.type	CTFB_ESC, @object
	.size	CTFB_ESC, 1
CTFB_ESC:
	.byte	27
	.type	CTFB_RET, @object
	.size	CTFB_RET, 1
CTFB_RET:
	.byte	10
	.type	CTFB_ASCII4_CTRL_D, @object
	.size	CTFB_ASCII4_CTRL_D, 1
CTFB_ASCII4_CTRL_D:
	.byte	4
	.type	CTFB_ASCII8_DEL, @object
	.size	CTFB_ASCII8_DEL, 1
CTFB_ASCII8_DEL:
	.byte	8
	.type	CTFB_ASCII21_CTRL_U, @object
	.size	CTFB_ASCII21_CTRL_U, 1
CTFB_ASCII21_CTRL_U:
	.byte	21
	.type	CTFB_BACKSPACE, @object
	.size	CTFB_BACKSPACE, 1
CTFB_BACKSPACE:
	.byte	127
	.type	CTFB_UP, @object
	.size	CTFB_UP, 1
CTFB_UP:
	.byte	-128
	.type	CTFB_LEFT, @object
	.size	CTFB_LEFT, 1
CTFB_LEFT:
	.byte	-127
	.type	CTFB_RIGHT, @object
	.size	CTFB_RIGHT, 1
CTFB_RIGHT:
	.byte	-126
	.type	CTFB_DOWN, @object
	.size	CTFB_DOWN, 1
CTFB_DOWN:
	.byte	-125
	.type	CTFB_UP_SHIFT, @object
	.size	CTFB_UP_SHIFT, 1
CTFB_UP_SHIFT:
	.byte	-124
	.type	CTFB_LEFT_SHIFT, @object
	.size	CTFB_LEFT_SHIFT, 1
CTFB_LEFT_SHIFT:
	.byte	-123
	.type	CTFB_RIGHT_SHIFT, @object
	.size	CTFB_RIGHT_SHIFT, 1
CTFB_RIGHT_SHIFT:
	.byte	-122
	.type	CTFB_DOWN_SHIFT, @object
	.size	CTFB_DOWN_SHIFT, 1
CTFB_DOWN_SHIFT:
	.byte	-121
	.type	CTFB_NE, @object
	.size	CTFB_NE, 1
CTFB_NE:
	.byte	-120
	.type	CTFB_SE, @object
	.size	CTFB_SE, 1
CTFB_SE:
	.byte	-119
	.type	CTFB_NW, @object
	.size	CTFB_NW, 1
CTFB_NW:
	.byte	-118
	.type	CTFB_SW, @object
	.size	CTFB_SW, 1
CTFB_SW:
	.byte	-117
	.type	CTFB_NE_SHIFT, @object
	.size	CTFB_NE_SHIFT, 1
CTFB_NE_SHIFT:
	.byte	-116
	.type	CTFB_SE_SHIFT, @object
	.size	CTFB_SE_SHIFT, 1
CTFB_SE_SHIFT:
	.byte	-115
	.type	CTFB_NW_SHIFT, @object
	.size	CTFB_NW_SHIFT, 1
CTFB_NW_SHIFT:
	.byte	-114
	.type	CTFB_SW_SHIFT, @object
	.size	CTFB_SW_SHIFT, 1
CTFB_SW_SHIFT:
	.byte	-113
	.type	CTFB_F1, @object
	.size	CTFB_F1, 1
CTFB_F1:
	.byte	-112
	.type	CTFB_F2, @object
	.size	CTFB_F2, 1
CTFB_F2:
	.byte	-111
	.type	CTFB_F3, @object
	.size	CTFB_F3, 1
CTFB_F3:
	.byte	-110
	.type	CTFB_F4, @object
	.size	CTFB_F4, 1
CTFB_F4:
	.byte	-109
	.comm	json_typename,192,32
	.text
.Letext0:
	.file 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include/stddef.h"
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/types/struct_FILE.h"
	.file 4 "/usr/include/bits/types/FILE.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/bits/stdint-uintn.h"
	.file 7 "/usr/include/time.h"
	.file 8 "/usr/include/unistd.h"
	.file 9 "submod/libctfb/conf.h"
	.file 10 "submod/libctfb/draw.h"
	.file 11 "submod/libctfb/input.h"
	.file 12 "parse.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x608
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF89
	.byte	0xc
	.long	.LASF90
	.long	.LASF91
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x1
	.byte	0xd1
	.byte	0x1b
	.long	0x29
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF1
	.byte	0x1
	.value	0x141
	.byte	0xd
	.long	0x42
	.uleb128 0x5
	.long	0x30
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x7
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x60
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x67
	.uleb128 0x2
	.long	.LASF12
	.byte	0x2
	.byte	0x98
	.byte	0x12
	.long	0x49
	.uleb128 0x2
	.long	.LASF13
	.byte	0x2
	.byte	0x99
	.byte	0x12
	.long	0x49
	.uleb128 0x8
	.byte	0x8
	.long	0xb2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x5
	.long	0xb2
	.uleb128 0x9
	.long	.LASF92
	.byte	0xd8
	.byte	0x3
	.byte	0x31
	.byte	0x8
	.long	0x245
	.uleb128 0xa
	.long	.LASF15
	.byte	0x3
	.byte	0x33
	.byte	0x7
	.long	0x42
	.byte	0
	.uleb128 0xa
	.long	.LASF16
	.byte	0x3
	.byte	0x36
	.byte	0x9
	.long	0xac
	.byte	0x8
	.uleb128 0xa
	.long	.LASF17
	.byte	0x3
	.byte	0x37
	.byte	0x9
	.long	0xac
	.byte	0x10
	.uleb128 0xa
	.long	.LASF18
	.byte	0x3
	.byte	0x38
	.byte	0x9
	.long	0xac
	.byte	0x18
	.uleb128 0xa
	.long	.LASF19
	.byte	0x3
	.byte	0x39
	.byte	0x9
	.long	0xac
	.byte	0x20
	.uleb128 0xa
	.long	.LASF20
	.byte	0x3
	.byte	0x3a
	.byte	0x9
	.long	0xac
	.byte	0x28
	.uleb128 0xa
	.long	.LASF21
	.byte	0x3
	.byte	0x3b
	.byte	0x9
	.long	0xac
	.byte	0x30
	.uleb128 0xa
	.long	.LASF22
	.byte	0x3
	.byte	0x3c
	.byte	0x9
	.long	0xac
	.byte	0x38
	.uleb128 0xa
	.long	.LASF23
	.byte	0x3
	.byte	0x3d
	.byte	0x9
	.long	0xac
	.byte	0x40
	.uleb128 0xa
	.long	.LASF24
	.byte	0x3
	.byte	0x40
	.byte	0x9
	.long	0xac
	.byte	0x48
	.uleb128 0xa
	.long	.LASF25
	.byte	0x3
	.byte	0x41
	.byte	0x9
	.long	0xac
	.byte	0x50
	.uleb128 0xa
	.long	.LASF26
	.byte	0x3
	.byte	0x42
	.byte	0x9
	.long	0xac
	.byte	0x58
	.uleb128 0xa
	.long	.LASF27
	.byte	0x3
	.byte	0x44
	.byte	0x16
	.long	0x25e
	.byte	0x60
	.uleb128 0xa
	.long	.LASF28
	.byte	0x3
	.byte	0x46
	.byte	0x14
	.long	0x264
	.byte	0x68
	.uleb128 0xa
	.long	.LASF29
	.byte	0x3
	.byte	0x48
	.byte	0x7
	.long	0x42
	.byte	0x70
	.uleb128 0xa
	.long	.LASF30
	.byte	0x3
	.byte	0x49
	.byte	0x7
	.long	0x42
	.byte	0x74
	.uleb128 0xa
	.long	.LASF31
	.byte	0x3
	.byte	0x4a
	.byte	0xb
	.long	0x94
	.byte	0x78
	.uleb128 0xa
	.long	.LASF32
	.byte	0x3
	.byte	0x4d
	.byte	0x12
	.long	0x67
	.byte	0x80
	.uleb128 0xa
	.long	.LASF33
	.byte	0x3
	.byte	0x4e
	.byte	0xf
	.long	0x6e
	.byte	0x82
	.uleb128 0xa
	.long	.LASF34
	.byte	0x3
	.byte	0x4f
	.byte	0x8
	.long	0x26a
	.byte	0x83
	.uleb128 0xa
	.long	.LASF35
	.byte	0x3
	.byte	0x51
	.byte	0xf
	.long	0x27a
	.byte	0x88
	.uleb128 0xa
	.long	.LASF36
	.byte	0x3
	.byte	0x59
	.byte	0xd
	.long	0xa0
	.byte	0x90
	.uleb128 0xa
	.long	.LASF37
	.byte	0x3
	.byte	0x5b
	.byte	0x17
	.long	0x285
	.byte	0x98
	.uleb128 0xa
	.long	.LASF38
	.byte	0x3
	.byte	0x5c
	.byte	0x19
	.long	0x290
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x3
	.byte	0x5d
	.byte	0x14
	.long	0x264
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF40
	.byte	0x3
	.byte	0x5e
	.byte	0x9
	.long	0x5e
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF41
	.byte	0x3
	.byte	0x5f
	.byte	0xa
	.long	0x1d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF42
	.byte	0x3
	.byte	0x60
	.byte	0x7
	.long	0x42
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF43
	.byte	0x3
	.byte	0x62
	.byte	0x8
	.long	0x296
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF44
	.byte	0x4
	.byte	0x7
	.byte	0x19
	.long	0xbe
	.uleb128 0xb
	.long	.LASF93
	.byte	0x3
	.byte	0x2b
	.byte	0xe
	.uleb128 0xc
	.long	.LASF45
	.uleb128 0x8
	.byte	0x8
	.long	0x259
	.uleb128 0x8
	.byte	0x8
	.long	0xbe
	.uleb128 0xd
	.long	0xb2
	.long	0x27a
	.uleb128 0xe
	.long	0x29
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x251
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x8
	.byte	0x8
	.long	0x280
	.uleb128 0xc
	.long	.LASF47
	.uleb128 0x8
	.byte	0x8
	.long	0x28b
	.uleb128 0xd
	.long	0xb2
	.long	0x2a6
	.uleb128 0xe
	.long	0x29
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF48
	.byte	0x5
	.byte	0x89
	.byte	0xe
	.long	0x2b2
	.uleb128 0x8
	.byte	0x8
	.long	0x245
	.uleb128 0xf
	.long	.LASF49
	.byte	0x5
	.byte	0x8a
	.byte	0xe
	.long	0x2b2
	.uleb128 0xf
	.long	.LASF50
	.byte	0x5
	.byte	0x8b
	.byte	0xe
	.long	0x2b2
	.uleb128 0x2
	.long	.LASF51
	.byte	0x6
	.byte	0x18
	.byte	0x13
	.long	0x75
	.uleb128 0x5
	.long	0x2d0
	.uleb128 0x2
	.long	.LASF52
	.byte	0x6
	.byte	0x19
	.byte	0x14
	.long	0x88
	.uleb128 0x5
	.long	0x2e1
	.uleb128 0xd
	.long	0xac
	.long	0x302
	.uleb128 0xe
	.long	0x29
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF53
	.byte	0x7
	.byte	0x9f
	.byte	0xe
	.long	0x2f2
	.uleb128 0xf
	.long	.LASF54
	.byte	0x7
	.byte	0xa0
	.byte	0xc
	.long	0x42
	.uleb128 0xf
	.long	.LASF55
	.byte	0x7
	.byte	0xa1
	.byte	0x11
	.long	0x49
	.uleb128 0x10
	.long	.LASF56
	.byte	0x8
	.value	0x21f
	.byte	0xf
	.long	0x333
	.uleb128 0x8
	.byte	0x8
	.long	0xac
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF57
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF58
	.uleb128 0x11
	.long	.LASF59
	.byte	0x9
	.byte	0x13
	.byte	0x10
	.long	0x2ed
	.uleb128 0x9
	.byte	0x3
	.quad	__VERS
	.uleb128 0xd
	.long	0x3d
	.long	0x36d
	.uleb128 0xe
	.long	0x29
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	0x35d
	.uleb128 0x11
	.long	.LASF60
	.byte	0xa
	.byte	0x6
	.byte	0xf
	.long	0x36d
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARS
	.uleb128 0x11
	.long	.LASF61
	.byte	0xa
	.byte	0x7
	.byte	0xf
	.long	0x36d
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARSD
	.uleb128 0x12
	.long	.LASF62
	.byte	0xb
	.byte	0x5
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ESC
	.uleb128 0x12
	.long	.LASF63
	.byte	0xb
	.byte	0x7
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RET
	.uleb128 0x12
	.long	.LASF64
	.byte	0xb
	.byte	0xa
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII4_CTRL_D
	.uleb128 0x12
	.long	.LASF65
	.byte	0xb
	.byte	0xb
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII8_DEL
	.uleb128 0x12
	.long	.LASF66
	.byte	0xb
	.byte	0xc
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII21_CTRL_U
	.uleb128 0x12
	.long	.LASF67
	.byte	0xb
	.byte	0xd
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_BACKSPACE
	.uleb128 0x12
	.long	.LASF68
	.byte	0xb
	.byte	0x10
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP
	.uleb128 0x12
	.long	.LASF69
	.byte	0xb
	.byte	0x11
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT
	.uleb128 0x12
	.long	.LASF70
	.byte	0xb
	.byte	0x12
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT
	.uleb128 0x12
	.long	.LASF71
	.byte	0xb
	.byte	0x13
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN
	.uleb128 0x12
	.long	.LASF72
	.byte	0xb
	.byte	0x15
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP_SHIFT
	.uleb128 0x12
	.long	.LASF73
	.byte	0xb
	.byte	0x16
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT_SHIFT
	.uleb128 0x12
	.long	.LASF74
	.byte	0xb
	.byte	0x17
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT_SHIFT
	.uleb128 0x12
	.long	.LASF75
	.byte	0xb
	.byte	0x18
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN_SHIFT
	.uleb128 0x12
	.long	.LASF76
	.byte	0xb
	.byte	0x1a
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE
	.uleb128 0x12
	.long	.LASF77
	.byte	0xb
	.byte	0x1b
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE
	.uleb128 0x12
	.long	.LASF78
	.byte	0xb
	.byte	0x1c
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW
	.uleb128 0x12
	.long	.LASF79
	.byte	0xb
	.byte	0x1d
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW
	.uleb128 0x12
	.long	.LASF80
	.byte	0xb
	.byte	0x1f
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE_SHIFT
	.uleb128 0x12
	.long	.LASF81
	.byte	0xb
	.byte	0x20
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE_SHIFT
	.uleb128 0x12
	.long	.LASF82
	.byte	0xb
	.byte	0x21
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW_SHIFT
	.uleb128 0x12
	.long	.LASF83
	.byte	0xb
	.byte	0x22
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW_SHIFT
	.uleb128 0x12
	.long	.LASF84
	.byte	0xb
	.byte	0x24
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F1
	.uleb128 0x12
	.long	.LASF85
	.byte	0xb
	.byte	0x25
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F2
	.uleb128 0x12
	.long	.LASF86
	.byte	0xb
	.byte	0x26
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F3
	.uleb128 0x12
	.long	.LASF87
	.byte	0xb
	.byte	0x27
	.byte	0x16
	.long	0x2dc
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F4
	.uleb128 0xd
	.long	0xb9
	.long	0x5f0
	.uleb128 0xe
	.long	0x29
	.byte	0xb
	.uleb128 0xe
	.long	0x29
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x5da
	.uleb128 0x11
	.long	.LASF88
	.byte	0xc
	.byte	0x6
	.byte	0xc
	.long	0x5f0
	.uleb128 0x9
	.byte	0x3
	.quad	json_typename
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF80:
	.string	"CTFB_NE_SHIFT"
.LASF30:
	.string	"_flags2"
.LASF91:
	.string	"/home/adip/git/bshc"
.LASF31:
	.string	"_old_offset"
.LASF58:
	.string	"double"
.LASF89:
	.string	"GNU C99 9.3.0 -mtune=generic -march=x86-64 -g -std=c99 -fpie"
.LASF92:
	.string	"_IO_FILE"
.LASF26:
	.string	"_IO_save_end"
.LASF10:
	.string	"short int"
.LASF0:
	.string	"size_t"
.LASF36:
	.string	"_offset"
.LASF61:
	.string	"FRAMECHARSD"
.LASF20:
	.string	"_IO_write_ptr"
.LASF15:
	.string	"_flags"
.LASF11:
	.string	"__uint16_t"
.LASF74:
	.string	"CTFB_RIGHT_SHIFT"
.LASF56:
	.string	"__environ"
.LASF27:
	.string	"_markers"
.LASF17:
	.string	"_IO_read_end"
.LASF40:
	.string	"_freeres_buf"
.LASF81:
	.string	"CTFB_SE_SHIFT"
.LASF51:
	.string	"uint8_t"
.LASF71:
	.string	"CTFB_DOWN"
.LASF82:
	.string	"CTFB_NW_SHIFT"
.LASF73:
	.string	"CTFB_LEFT_SHIFT"
.LASF57:
	.string	"float"
.LASF66:
	.string	"CTFB_ASCII21_CTRL_U"
.LASF50:
	.string	"stderr"
.LASF4:
	.string	"long long int"
.LASF84:
	.string	"CTFB_F1"
.LASF85:
	.string	"CTFB_F2"
.LASF86:
	.string	"CTFB_F3"
.LASF87:
	.string	"CTFB_F4"
.LASF55:
	.string	"__timezone"
.LASF35:
	.string	"_lock"
.LASF54:
	.string	"__daylight"
.LASF3:
	.string	"long int"
.LASF72:
	.string	"CTFB_UP_SHIFT"
.LASF32:
	.string	"_cur_column"
.LASF9:
	.string	"__uint8_t"
.LASF68:
	.string	"CTFB_UP"
.LASF6:
	.string	"unsigned char"
.LASF83:
	.string	"CTFB_SW_SHIFT"
.LASF77:
	.string	"CTFB_SE"
.LASF59:
	.string	"__VERS"
.LASF8:
	.string	"signed char"
.LASF37:
	.string	"_codecvt"
.LASF5:
	.string	"unsigned int"
.LASF45:
	.string	"_IO_marker"
.LASF34:
	.string	"_shortbuf"
.LASF19:
	.string	"_IO_write_base"
.LASF63:
	.string	"CTFB_RET"
.LASF16:
	.string	"_IO_read_ptr"
.LASF23:
	.string	"_IO_buf_end"
.LASF78:
	.string	"CTFB_NW"
.LASF1:
	.string	"wchar_t"
.LASF14:
	.string	"char"
.LASF52:
	.string	"uint16_t"
.LASF38:
	.string	"_wide_data"
.LASF39:
	.string	"_freeres_list"
.LASF43:
	.string	"_unused2"
.LASF41:
	.string	"__pad5"
.LASF64:
	.string	"CTFB_ASCII4_CTRL_D"
.LASF65:
	.string	"CTFB_ASCII8_DEL"
.LASF90:
	.string	"main.c"
.LASF2:
	.string	"long unsigned int"
.LASF21:
	.string	"_IO_write_end"
.LASF13:
	.string	"__off64_t"
.LASF42:
	.string	"_mode"
.LASF29:
	.string	"_fileno"
.LASF60:
	.string	"FRAMECHARS"
.LASF28:
	.string	"_chain"
.LASF47:
	.string	"_IO_wide_data"
.LASF76:
	.string	"CTFB_NE"
.LASF53:
	.string	"__tzname"
.LASF12:
	.string	"__off_t"
.LASF25:
	.string	"_IO_backup_base"
.LASF48:
	.string	"stdin"
.LASF22:
	.string	"_IO_buf_base"
.LASF7:
	.string	"short unsigned int"
.LASF46:
	.string	"_IO_codecvt"
.LASF18:
	.string	"_IO_read_base"
.LASF33:
	.string	"_vtable_offset"
.LASF88:
	.string	"json_typename"
.LASF70:
	.string	"CTFB_RIGHT"
.LASF24:
	.string	"_IO_save_base"
.LASF44:
	.string	"FILE"
.LASF79:
	.string	"CTFB_SW"
.LASF67:
	.string	"CTFB_BACKSPACE"
.LASF75:
	.string	"CTFB_DOWN_SHIFT"
.LASF69:
	.string	"CTFB_LEFT"
.LASF49:
	.string	"stdout"
.LASF93:
	.string	"_IO_lock_t"
.LASF62:
	.string	"CTFB_ESC"
	.ident	"GCC: (Gentoo Hardened 9.3.0 p2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
