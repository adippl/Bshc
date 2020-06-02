	.file	"parse.c"
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
	.globl	json_typename
	.align 32
	.type	json_typename, @object
	.size	json_typename, 192
json_typename:
	.zero	16
	.string	"ERROR"
	.zero	10
	.string	"DONE"
	.zero	11
	.string	"OBJECT"
	.zero	9
	.string	"OBJECT_END"
	.zero	5
	.string	"ARRAY"
	.zero	10
	.string	"ARRAY_END"
	.zero	6
	.string	"STRING"
	.zero	9
	.string	"NUMBER"
	.zero	9
	.string	"TRUE"
	.zero	11
	.string	"FALSE"
	.zero	10
	.string	"NULL"
	.zero	11
	.text
	.globl	skipToNextObj
	.type	skipToNextObj, @function
skipToNextObj:
.LFB0:
	.file 1 "parse.c"
	.loc 1 19 54
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 20 14
	movq	$0, -8(%rbp)
	.loc 1 23 7
	jmp	.L2
.L8:
	.loc 1 24 5
	cmpb	$0, -13(%rbp)
	je	.L3
	.loc 1 24 15 discriminator 1
	cmpl	$7, -12(%rbp)
	jne	.L3
	.loc 1 25 11
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	json_get_string@PLT
	movq	%rax, -8(%rbp)
	.loc 1 26 6
	cmpq	$0, -8(%rbp)
	je	.L9
	.loc 1 27 11
	movq	-8(%rbp), %rax
	jmp	.L5
.L3:
	.loc 1 30 5
	cmpl	$3, -12(%rbp)
	jne	.L7
	.loc 1 30 33 discriminator 1
	movb	$1, -13(%rbp)
	jmp	.L2
.L7:
	.loc 1 31 17
	movb	$0, -13(%rbp)
.L2:
	.loc 1 23 14
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -12(%rbp)
	.loc 1 23 7
	cmpl	$2, -12(%rbp)
	jne	.L8
	jmp	.L6
.L9:
	.loc 1 29 5
	nop
.L6:
	.loc 1 32 8
	movl	$0, %eax
.L5:
	.loc 1 32 12
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	skipToNextObj, .-skipToNextObj
	.globl	skipToArrEnd
	.type	skipToArrEnd, @function
skipToArrEnd:
.LFB1:
	.loc 1 35 30
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 37 16
	movq	$1, -8(%rbp)
.L17:
	.loc 1 39 8
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -12(%rbp)
	.loc 1 40 5
	cmpq	$0, -8(%rbp)
	jne	.L11
	.loc 1 40 22 discriminator 1
	movl	$0, %eax
	jmp	.L18
.L11:
	.loc 1 41 3
	cmpl	$5, -12(%rbp)
	je	.L13
	cmpl	$6, -12(%rbp)
	je	.L14
	.loc 1 49 5
	jmp	.L16
.L13:
	.loc 1 43 13
	addq	$1, -8(%rbp)
	.loc 1 44 5
	jmp	.L16
.L14:
	.loc 1 46 13
	subq	$1, -8(%rbp)
	.loc 1 47 5
	nop
.L16:
	.loc 1 39 7 discriminator 1
	jmp	.L17
.L18:
	.loc 1 49 5 discriminator 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	skipToArrEnd, .-skipToArrEnd
	.globl	parseArr
	.type	parseArr, @function
parseArr:
.LFB2:
	.loc 1 54 26
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 56 16
	movq	$1, -8(%rbp)
.L26:
	.loc 1 58 8
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -12(%rbp)
	.loc 1 59 5
	cmpq	$0, -8(%rbp)
	jne	.L20
	.loc 1 59 22 discriminator 1
	movl	$0, %eax
	jmp	.L27
.L20:
	.loc 1 60 3
	cmpl	$5, -12(%rbp)
	je	.L22
	cmpl	$6, -12(%rbp)
	je	.L23
	.loc 1 68 5
	jmp	.L25
.L22:
	.loc 1 62 13
	addq	$1, -8(%rbp)
	.loc 1 63 5
	jmp	.L25
.L23:
	.loc 1 65 13
	subq	$1, -8(%rbp)
	.loc 1 66 5
	nop
.L25:
	.loc 1 58 7 discriminator 1
	jmp	.L26
.L27:
	.loc 1 68 5 discriminator 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	parseArr, .-parseArr
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/types/struct_FILE.h"
	.file 5 "/usr/include/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/bits/stdint-uintn.h"
	.file 8 "/usr/include/stdint.h"
	.file 9 "/usr/include/time.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "submod/pdjson/pdjson.h"
	.file 12 "submod/libctfb/conf.h"
	.file 13 "submod/libctfb/draw.h"
	.file 14 "submod/libctfb/input.h"
	.file 15 "parse.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa21
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF140
	.byte	0xc
	.long	.LASF141
	.long	.LASF142
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF1
	.byte	0x2
	.value	0x141
	.byte	0xd
	.long	0x52
	.uleb128 0x5
	.long	0x40
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
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x70
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x77
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x59
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x59
	.uleb128 0x8
	.byte	0x8
	.long	0xc2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x5
	.long	0xc2
	.uleb128 0x9
	.long	.LASF71
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x255
	.uleb128 0xa
	.long	.LASF15
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x52
	.byte	0
	.uleb128 0xa
	.long	.LASF16
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xbc
	.byte	0x8
	.uleb128 0xa
	.long	.LASF17
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xbc
	.byte	0x10
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xbc
	.byte	0x18
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xbc
	.byte	0x20
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xbc
	.byte	0x28
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xbc
	.byte	0x30
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xbc
	.byte	0x38
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xbc
	.byte	0x40
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xbc
	.byte	0x48
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xbc
	.byte	0x50
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xbc
	.byte	0x58
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x26e
	.byte	0x60
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x274
	.byte	0x68
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x52
	.byte	0x70
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x52
	.byte	0x74
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xa4
	.byte	0x78
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x77
	.byte	0x80
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x7e
	.byte	0x82
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x27a
	.byte	0x83
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x28a
	.byte	0x88
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xb0
	.byte	0x90
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x295
	.byte	0x98
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2a0
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x274
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x6e
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF41
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x52
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2a6
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF44
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xce
	.uleb128 0xb
	.long	.LASF143
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xc
	.long	.LASF45
	.uleb128 0x8
	.byte	0x8
	.long	0x269
	.uleb128 0x8
	.byte	0x8
	.long	0xce
	.uleb128 0xd
	.long	0xc2
	.long	0x28a
	.uleb128 0xe
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x261
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x8
	.byte	0x8
	.long	0x290
	.uleb128 0xc
	.long	.LASF47
	.uleb128 0x8
	.byte	0x8
	.long	0x29b
	.uleb128 0xd
	.long	0xc2
	.long	0x2b6
	.uleb128 0xe
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF48
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x2c2
	.uleb128 0x8
	.byte	0x8
	.long	0x255
	.uleb128 0xf
	.long	.LASF49
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x2c2
	.uleb128 0xf
	.long	.LASF50
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x2c2
	.uleb128 0x2
	.long	.LASF51
	.byte	0x7
	.byte	0x18
	.byte	0x13
	.long	0x85
	.uleb128 0x5
	.long	0x2e0
	.uleb128 0x2
	.long	.LASF52
	.byte	0x7
	.byte	0x19
	.byte	0x14
	.long	0x98
	.uleb128 0x5
	.long	0x2f1
	.uleb128 0x2
	.long	.LASF53
	.byte	0x8
	.byte	0x4a
	.byte	0x1b
	.long	0x39
	.uleb128 0x8
	.byte	0x8
	.long	0xc9
	.uleb128 0xd
	.long	0xbc
	.long	0x324
	.uleb128 0xe
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF54
	.byte	0x9
	.byte	0x9f
	.byte	0xe
	.long	0x314
	.uleb128 0xf
	.long	.LASF55
	.byte	0x9
	.byte	0xa0
	.byte	0xc
	.long	0x52
	.uleb128 0xf
	.long	.LASF56
	.byte	0x9
	.byte	0xa1
	.byte	0x11
	.long	0x59
	.uleb128 0x10
	.long	.LASF57
	.byte	0xa
	.value	0x21f
	.byte	0xf
	.long	0x355
	.uleb128 0x8
	.byte	0x8
	.long	0xbc
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF58
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF59
	.uleb128 0x11
	.long	.LASF144
	.byte	0x7
	.byte	0x4
	.long	0x67
	.byte	0xb
	.byte	0x18
	.byte	0x6
	.long	0x3be
	.uleb128 0x12
	.long	.LASF60
	.byte	0x1
	.uleb128 0x12
	.long	.LASF61
	.byte	0x2
	.uleb128 0x12
	.long	.LASF62
	.byte	0x3
	.uleb128 0x12
	.long	.LASF63
	.byte	0x4
	.uleb128 0x12
	.long	.LASF64
	.byte	0x5
	.uleb128 0x12
	.long	.LASF65
	.byte	0x6
	.uleb128 0x12
	.long	.LASF66
	.byte	0x7
	.uleb128 0x12
	.long	.LASF67
	.byte	0x8
	.uleb128 0x12
	.long	.LASF68
	.byte	0x9
	.uleb128 0x12
	.long	.LASF69
	.byte	0xa
	.uleb128 0x12
	.long	.LASF70
	.byte	0xb
	.byte	0
	.uleb128 0x9
	.long	.LASF72
	.byte	0x18
	.byte	0xb
	.byte	0x1e
	.byte	0x8
	.long	0x3f3
	.uleb128 0xa
	.long	.LASF73
	.byte	0xb
	.byte	0x1f
	.byte	0xd
	.long	0x402
	.byte	0
	.uleb128 0xa
	.long	.LASF74
	.byte	0xb
	.byte	0x20
	.byte	0xd
	.long	0x41c
	.byte	0x8
	.uleb128 0xa
	.long	.LASF75
	.byte	0xb
	.byte	0x21
	.byte	0xc
	.long	0x42d
	.byte	0x10
	.byte	0
	.uleb128 0x13
	.long	0x6e
	.long	0x402
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3f3
	.uleb128 0x13
	.long	0x6e
	.long	0x41c
	.uleb128 0x14
	.long	0x6e
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x408
	.uleb128 0x15
	.long	0x42d
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x422
	.uleb128 0x2
	.long	.LASF76
	.byte	0xb
	.byte	0x24
	.byte	0xf
	.long	0x43f
	.uleb128 0x8
	.byte	0x8
	.long	0x445
	.uleb128 0x13
	.long	0x52
	.long	0x454
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x2
	.long	.LASF77
	.byte	0xb
	.byte	0x26
	.byte	0x1c
	.long	0x460
	.uleb128 0x16
	.long	.LASF77
	.value	0x110
	.byte	0xb
	.byte	0x5b
	.byte	0x8
	.long	0x4fe
	.uleb128 0xa
	.long	.LASF78
	.byte	0xb
	.byte	0x5c
	.byte	0xc
	.long	0x2d
	.byte	0
	.uleb128 0xa
	.long	.LASF79
	.byte	0xb
	.byte	0x5e
	.byte	0x18
	.long	0x62b
	.byte	0x8
	.uleb128 0xa
	.long	.LASF80
	.byte	0xb
	.byte	0x5f
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF81
	.byte	0xb
	.byte	0x60
	.byte	0xc
	.long	0x2d
	.byte	0x18
	.uleb128 0xa
	.long	.LASF82
	.byte	0xb
	.byte	0x61
	.byte	0x14
	.long	0x369
	.byte	0x20
	.uleb128 0xa
	.long	.LASF83
	.byte	0xb
	.byte	0x62
	.byte	0xe
	.long	0x67
	.byte	0x24
	.uleb128 0xa
	.long	.LASF84
	.byte	0xb
	.byte	0x68
	.byte	0x7
	.long	0x5f5
	.byte	0x28
	.uleb128 0xa
	.long	.LASF85
	.byte	0xb
	.byte	0x6a
	.byte	0xc
	.long	0x2d
	.byte	0x40
	.uleb128 0xa
	.long	.LASF86
	.byte	0xb
	.byte	0x6c
	.byte	0x18
	.long	0x598
	.byte	0x48
	.uleb128 0xa
	.long	.LASF87
	.byte	0xb
	.byte	0x6d
	.byte	0x1b
	.long	0x3be
	.byte	0x78
	.uleb128 0xa
	.long	.LASF88
	.byte	0xb
	.byte	0x6e
	.byte	0xa
	.long	0x631
	.byte	0x90
	.byte	0
	.uleb128 0x17
	.byte	0x8
	.byte	0xb
	.byte	0x4c
	.byte	0x9
	.long	0x515
	.uleb128 0xa
	.long	.LASF89
	.byte	0xb
	.byte	0x4d
	.byte	0x13
	.long	0x2c2
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x10
	.byte	0xb
	.byte	0x4f
	.byte	0x9
	.long	0x539
	.uleb128 0xa
	.long	.LASF90
	.byte	0xb
	.byte	0x50
	.byte	0x19
	.long	0x30e
	.byte	0
	.uleb128 0xa
	.long	.LASF91
	.byte	0xb
	.byte	0x51
	.byte	0x14
	.long	0x2d
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.byte	0x18
	.byte	0xb
	.byte	0x53
	.byte	0x9
	.long	0x56a
	.uleb128 0x18
	.string	"ptr"
	.byte	0xb
	.byte	0x54
	.byte	0x13
	.long	0x6e
	.byte	0
	.uleb128 0x18
	.string	"get"
	.byte	0xb
	.byte	0x55
	.byte	0x1a
	.long	0x433
	.byte	0x8
	.uleb128 0xa
	.long	.LASF92
	.byte	0xb
	.byte	0x56
	.byte	0x1a
	.long	0x433
	.byte	0x10
	.byte	0
	.uleb128 0x19
	.byte	0x18
	.byte	0xb
	.byte	0x4b
	.byte	0x5
	.long	0x598
	.uleb128 0x1a
	.long	.LASF89
	.byte	0xb
	.byte	0x4e
	.byte	0xb
	.long	0x4fe
	.uleb128 0x1a
	.long	.LASF90
	.byte	0xb
	.byte	0x52
	.byte	0xb
	.long	0x515
	.uleb128 0x1a
	.long	.LASF93
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.long	0x539
	.byte	0
	.uleb128 0x9
	.long	.LASF94
	.byte	0x30
	.byte	0xb
	.byte	0x47
	.byte	0x8
	.long	0x5da
	.uleb128 0x18
	.string	"get"
	.byte	0xb
	.byte	0x48
	.byte	0xb
	.long	0x5ef
	.byte	0
	.uleb128 0xa
	.long	.LASF92
	.byte	0xb
	.byte	0x49
	.byte	0xb
	.long	0x5ef
	.byte	0x8
	.uleb128 0xa
	.long	.LASF95
	.byte	0xb
	.byte	0x4a
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF86
	.byte	0xb
	.byte	0x58
	.byte	0x7
	.long	0x56a
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.long	0x52
	.long	0x5e9
	.uleb128 0x14
	.long	0x5e9
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x598
	.uleb128 0x8
	.byte	0x8
	.long	0x5da
	.uleb128 0x17
	.byte	0x18
	.byte	0xb
	.byte	0x64
	.byte	0x5
	.long	0x626
	.uleb128 0xa
	.long	.LASF96
	.byte	0xb
	.byte	0x65
	.byte	0xf
	.long	0xbc
	.byte	0
	.uleb128 0xa
	.long	.LASF97
	.byte	0xb
	.byte	0x66
	.byte	0x10
	.long	0x2d
	.byte	0x8
	.uleb128 0xa
	.long	.LASF98
	.byte	0xb
	.byte	0x67
	.byte	0x10
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.long	.LASF99
	.uleb128 0x8
	.byte	0x8
	.long	0x626
	.uleb128 0xd
	.long	0xc2
	.long	0x641
	.uleb128 0xe
	.long	0x39
	.byte	0x7f
	.byte	0
	.uleb128 0x1b
	.long	.LASF100
	.byte	0xc
	.byte	0x13
	.byte	0x10
	.long	0x2fd
	.uleb128 0x9
	.byte	0x3
	.quad	__VERS
	.uleb128 0xd
	.long	0x4d
	.long	0x667
	.uleb128 0xe
	.long	0x39
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	0x657
	.uleb128 0x1b
	.long	.LASF101
	.byte	0xd
	.byte	0x6
	.byte	0xf
	.long	0x667
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARS
	.uleb128 0x1b
	.long	.LASF102
	.byte	0xd
	.byte	0x7
	.byte	0xf
	.long	0x667
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARSD
	.uleb128 0x1c
	.long	.LASF103
	.byte	0xe
	.byte	0x5
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ESC
	.uleb128 0x1c
	.long	.LASF104
	.byte	0xe
	.byte	0x7
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RET
	.uleb128 0x1c
	.long	.LASF105
	.byte	0xe
	.byte	0xa
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII4_CTRL_D
	.uleb128 0x1c
	.long	.LASF106
	.byte	0xe
	.byte	0xb
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII8_DEL
	.uleb128 0x1c
	.long	.LASF107
	.byte	0xe
	.byte	0xc
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII21_CTRL_U
	.uleb128 0x1c
	.long	.LASF108
	.byte	0xe
	.byte	0xd
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_BACKSPACE
	.uleb128 0x1c
	.long	.LASF109
	.byte	0xe
	.byte	0x10
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP
	.uleb128 0x1c
	.long	.LASF110
	.byte	0xe
	.byte	0x11
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT
	.uleb128 0x1c
	.long	.LASF111
	.byte	0xe
	.byte	0x12
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT
	.uleb128 0x1c
	.long	.LASF112
	.byte	0xe
	.byte	0x13
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN
	.uleb128 0x1c
	.long	.LASF113
	.byte	0xe
	.byte	0x15
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP_SHIFT
	.uleb128 0x1c
	.long	.LASF114
	.byte	0xe
	.byte	0x16
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT_SHIFT
	.uleb128 0x1c
	.long	.LASF115
	.byte	0xe
	.byte	0x17
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT_SHIFT
	.uleb128 0x1c
	.long	.LASF116
	.byte	0xe
	.byte	0x18
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN_SHIFT
	.uleb128 0x1c
	.long	.LASF117
	.byte	0xe
	.byte	0x1a
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE
	.uleb128 0x1c
	.long	.LASF118
	.byte	0xe
	.byte	0x1b
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE
	.uleb128 0x1c
	.long	.LASF119
	.byte	0xe
	.byte	0x1c
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW
	.uleb128 0x1c
	.long	.LASF120
	.byte	0xe
	.byte	0x1d
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW
	.uleb128 0x1c
	.long	.LASF121
	.byte	0xe
	.byte	0x1f
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE_SHIFT
	.uleb128 0x1c
	.long	.LASF122
	.byte	0xe
	.byte	0x20
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE_SHIFT
	.uleb128 0x1c
	.long	.LASF123
	.byte	0xe
	.byte	0x21
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW_SHIFT
	.uleb128 0x1c
	.long	.LASF124
	.byte	0xe
	.byte	0x22
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW_SHIFT
	.uleb128 0x1c
	.long	.LASF125
	.byte	0xe
	.byte	0x24
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F1
	.uleb128 0x1c
	.long	.LASF126
	.byte	0xe
	.byte	0x25
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F2
	.uleb128 0x1c
	.long	.LASF127
	.byte	0xe
	.byte	0x26
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F3
	.uleb128 0x1c
	.long	.LASF128
	.byte	0xe
	.byte	0x27
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F4
	.uleb128 0xd
	.long	0xc9
	.long	0x8ea
	.uleb128 0xe
	.long	0x39
	.byte	0xb
	.uleb128 0xe
	.long	0x39
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x8d4
	.uleb128 0x1b
	.long	.LASF129
	.byte	0xf
	.byte	0x6
	.byte	0xc
	.long	0x8ea
	.uleb128 0x9
	.byte	0x3
	.quad	json_typename
	.uleb128 0x1d
	.long	.LASF132
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.long	0x52
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x954
	.uleb128 0x1e
	.string	"js"
	.byte	0x1
	.byte	0x36
	.byte	0x17
	.long	0x954
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF130
	.byte	0x1
	.byte	0x37
	.byte	0x11
	.long	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.long	.LASF131
	.byte	0x1
	.byte	0x38
	.byte	0x10
	.long	0x302
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x454
	.uleb128 0x1d
	.long	.LASF133
	.byte	0x1
	.byte	0x23
	.byte	0x1
	.long	0x52
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a9
	.uleb128 0x1e
	.string	"js"
	.byte	0x1
	.byte	0x23
	.byte	0x1b
	.long	0x954
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF130
	.byte	0x1
	.byte	0x24
	.byte	0x11
	.long	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.long	.LASF131
	.byte	0x1
	.byte	0x25
	.byte	0x10
	.long	0x302
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF134
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0x30e
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0xa17
	.uleb128 0x1f
	.long	.LASF135
	.byte	0x1
	.byte	0x13
	.byte	0x1c
	.long	0x954
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF136
	.byte	0x1
	.byte	0x13
	.byte	0x2d
	.long	0xa17
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.long	.LASF137
	.byte	0x1
	.byte	0x14
	.byte	0xe
	.long	0x30e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF130
	.byte	0x1
	.byte	0x15
	.byte	0x11
	.long	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.long	.LASF138
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.long	0xa1d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2d
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF139
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x19
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0x1a
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
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1f
	.uleb128 0x5
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
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF77:
	.string	"json_stream"
.LASF34:
	.string	"_shortbuf"
.LASF143:
	.string	"_IO_lock_t"
.LASF72:
	.string	"json_allocator"
.LASF50:
	.string	"stderr"
.LASF23:
	.string	"_IO_buf_end"
.LASF135:
	.string	"jstream"
.LASF83:
	.string	"flags"
.LASF113:
	.string	"CTFB_UP_SHIFT"
.LASF134:
	.string	"skipToNextObj"
.LASF90:
	.string	"buffer"
.LASF62:
	.string	"JSON_OBJECT"
.LASF21:
	.string	"_IO_write_end"
.LASF5:
	.string	"unsigned int"
.LASF82:
	.string	"next"
.LASF39:
	.string	"_freeres_list"
.LASF111:
	.string	"CTFB_RIGHT"
.LASF15:
	.string	"_flags"
.LASF108:
	.string	"CTFB_BACKSPACE"
.LASF1:
	.string	"wchar_t"
.LASF69:
	.string	"JSON_FALSE"
.LASF27:
	.string	"_markers"
.LASF78:
	.string	"lineno"
.LASF123:
	.string	"CTFB_NW_SHIFT"
.LASF106:
	.string	"CTFB_ASCII8_DEL"
.LASF80:
	.string	"stack_top"
.LASF138:
	.string	"prevIsObj"
.LASF66:
	.string	"JSON_STRING"
.LASF56:
	.string	"__timezone"
.LASF68:
	.string	"JSON_TRUE"
.LASF49:
	.string	"stdout"
.LASF122:
	.string	"CTFB_SE_SHIFT"
.LASF26:
	.string	"_IO_save_end"
.LASF101:
	.string	"FRAMECHARS"
.LASF58:
	.string	"float"
.LASF46:
	.string	"_IO_codecvt"
.LASF73:
	.string	"malloc"
.LASF131:
	.string	"arrDepth"
.LASF124:
	.string	"CTFB_SW_SHIFT"
.LASF85:
	.string	"ntokens"
.LASF11:
	.string	"__uint16_t"
.LASF140:
	.string	"GNU C99 9.3.0 -mtune=generic -march=x86-64 -g -std=c99 -fpie"
.LASF25:
	.string	"_IO_backup_base"
.LASF36:
	.string	"_offset"
.LASF29:
	.string	"_fileno"
.LASF117:
	.string	"CTFB_NE"
.LASF61:
	.string	"JSON_DONE"
.LASF93:
	.string	"user"
.LASF0:
	.string	"size_t"
.LASF119:
	.string	"CTFB_NW"
.LASF100:
	.string	"__VERS"
.LASF102:
	.string	"FRAMECHARSD"
.LASF70:
	.string	"JSON_NULL"
.LASF18:
	.string	"_IO_read_base"
.LASF139:
	.string	"_Bool"
.LASF48:
	.string	"stdin"
.LASF75:
	.string	"free"
.LASF96:
	.string	"string"
.LASF60:
	.string	"JSON_ERROR"
.LASF14:
	.string	"char"
.LASF42:
	.string	"_mode"
.LASF55:
	.string	"__daylight"
.LASF45:
	.string	"_IO_marker"
.LASF16:
	.string	"_IO_read_ptr"
.LASF121:
	.string	"CTFB_NE_SHIFT"
.LASF84:
	.string	"data"
.LASF99:
	.string	"json_stack"
.LASF116:
	.string	"CTFB_DOWN_SHIFT"
.LASF51:
	.string	"uint8_t"
.LASF67:
	.string	"JSON_NUMBER"
.LASF104:
	.string	"CTFB_RET"
.LASF19:
	.string	"_IO_write_base"
.LASF141:
	.string	"parse.c"
.LASF4:
	.string	"long long int"
.LASF110:
	.string	"CTFB_LEFT"
.LASF24:
	.string	"_IO_save_base"
.LASF105:
	.string	"CTFB_ASCII4_CTRL_D"
.LASF88:
	.string	"errmsg"
.LASF133:
	.string	"skipToArrEnd"
.LASF129:
	.string	"json_typename"
.LASF40:
	.string	"_freeres_buf"
.LASF53:
	.string	"uint_fast32_t"
.LASF41:
	.string	"__pad5"
.LASF33:
	.string	"_vtable_offset"
.LASF65:
	.string	"JSON_ARRAY_END"
.LASF142:
	.string	"/home/adip/git/bshc"
.LASF114:
	.string	"CTFB_LEFT_SHIFT"
.LASF97:
	.string	"string_fill"
.LASF52:
	.string	"uint16_t"
.LASF118:
	.string	"CTFB_SE"
.LASF120:
	.string	"CTFB_SW"
.LASF17:
	.string	"_IO_read_end"
.LASF87:
	.string	"alloc"
.LASF10:
	.string	"short int"
.LASF3:
	.string	"long int"
.LASF91:
	.string	"length"
.LASF47:
	.string	"_IO_wide_data"
.LASF136:
	.string	"r_length"
.LASF57:
	.string	"__environ"
.LASF63:
	.string	"JSON_OBJECT_END"
.LASF9:
	.string	"__uint8_t"
.LASF86:
	.string	"source"
.LASF132:
	.string	"parseArr"
.LASF94:
	.string	"json_source"
.LASF125:
	.string	"CTFB_F1"
.LASF126:
	.string	"CTFB_F2"
.LASF79:
	.string	"stack"
.LASF128:
	.string	"CTFB_F4"
.LASF115:
	.string	"CTFB_RIGHT_SHIFT"
.LASF38:
	.string	"_wide_data"
.LASF109:
	.string	"CTFB_UP"
.LASF35:
	.string	"_lock"
.LASF2:
	.string	"long unsigned int"
.LASF103:
	.string	"CTFB_ESC"
.LASF107:
	.string	"CTFB_ASCII21_CTRL_U"
.LASF31:
	.string	"_old_offset"
.LASF71:
	.string	"_IO_FILE"
.LASF130:
	.string	"type"
.LASF6:
	.string	"unsigned char"
.LASF54:
	.string	"__tzname"
.LASF20:
	.string	"_IO_write_ptr"
.LASF137:
	.string	"retStr"
.LASF64:
	.string	"JSON_ARRAY"
.LASF37:
	.string	"_codecvt"
.LASF74:
	.string	"realloc"
.LASF12:
	.string	"__off_t"
.LASF144:
	.string	"json_type"
.LASF8:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF127:
	.string	"CTFB_F3"
.LASF59:
	.string	"double"
.LASF81:
	.string	"stack_size"
.LASF28:
	.string	"_chain"
.LASF112:
	.string	"CTFB_DOWN"
.LASF44:
	.string	"FILE"
.LASF30:
	.string	"_flags2"
.LASF98:
	.string	"string_size"
.LASF76:
	.string	"json_user_io"
.LASF92:
	.string	"peek"
.LASF32:
	.string	"_cur_column"
.LASF95:
	.string	"position"
.LASF13:
	.string	"__off64_t"
.LASF43:
	.string	"_unused2"
.LASF22:
	.string	"_IO_buf_base"
.LASF89:
	.string	"stream"
	.ident	"GCC: (Gentoo Hardened 9.3.0 p2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
