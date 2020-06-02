	.file	"tests.c"
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
	.globl	test_resources
	.type	test_resources, @function
test_resources:
.LFB0:
	.file 1 "tests/tests.c"
	.loc 1 70 17
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 71 21
	movl	$152, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 72 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	resourcesFinalize@PLT
	.loc 1 74 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	resourcesFree@PLT
	.loc 1 76 8
	movl	$0, %eax
	.loc 1 76 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test_resources, .-test_resources
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"res/conf.json"
.LC2:
	.string	"test %s failed to open %s"
.LC3:
	.string	"next obj \"%s\"\n"
.LC4:
	.string	"PARISING ERROR %s\n"
	.text
	.globl	test_resourcesReadConfig
	.type	test_resourcesReadConfig, @function
test_resourcesReadConfig:
.LFB1:
	.loc 1 79 27
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$480, %rsp
	.loc 1 79 27
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 80 22
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -464(%rbp)
	.loc 1 81 6
	movb	$0, -473(%rbp)
	.loc 1 82 4
	cmpq	$0, -464(%rbp)
	jne	.L4
	.loc 1 83 3
	movq	stderr(%rip), %rax
	leaq	.LC1(%rip), %rcx
	leaq	__func__.4637(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 84 9
	movl	$1, %eax
	jmp	.L5
.L4:
.LBB2:
	.loc 1 86 15
	leaq	-288(%rbp), %rdx
	movl	$0, %eax
	movl	$34, %ecx
	movq	%rdx, %rdi
	rep stosq
	.loc 1 87 3
	movq	-464(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	json_open_stream@PLT
	.loc 1 88 3
	leaq	-288(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	json_set_streaming@PLT
	.loc 1 90 15
	movq	$0, -456(%rbp)
	.loc 1 91 10
	movq	$0, -472(%rbp)
	.loc 1 92 7
	leaq	-472(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	skipToNextObj@PLT
	movq	%rax, -456(%rbp)
	.loc 1 93 3
	movq	-456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 94 17
	leaq	-448(%rbp), %rdx
	movl	$0, %eax
	movl	$19, %ecx
	movq	%rdx, %rdi
	rep stosq
	.loc 1 95 3
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	resourcesFinalize@PLT
	.loc 1 96 3
	leaq	-288(%rbp), %rdx
	leaq	-448(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	resourcesParse@PLT
	.loc 1 99 5
	cmpb	$0, -473(%rbp)
	je	.L6
	.loc 1 100 4
	movq	stderr(%rip), %rax
	leaq	__func__.4637(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L6:
	.loc 1 102 3
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	resources_Dump@PLT
	.loc 1 103 3
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	resourcesClean@PLT
	.loc 1 106 3
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	json_close@PLT
	.loc 1 107 3
	movq	-464(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 108 9
	movl	$0, %eax
.L5:
.LBE2:
	.loc 1 109 2 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	.loc 1 109 2 is_stmt 0
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	test_resourcesReadConfig, .-test_resourcesReadConfig
	.globl	test_ship
	.type	test_ship, @function
test_ship:
.LFB2:
	.loc 1 112 12 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 113 16
	movl	$192, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -16(%rbp)
	.loc 1 114 2
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	obj_ship_finalize@PLT
	.loc 1 115 20
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	obj_ship_copy@PLT
	movq	%rax, -8(%rbp)
	.loc 1 116 2
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	obj_ship_free@PLT
	.loc 1 117 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	obj_ship_free@PLT
	.loc 1 118 8
	movl	$0, %eax
	.loc 1 118 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	test_ship, .-test_ship
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 130 7
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 131 2
	movl	$0, %eax
	call	test_resources
	.loc 1 132 2
	movl	$0, %eax
	call	test_ship
	.loc 1 133 2
	movl	$0, %eax
	call	test_resourcesReadConfig
	.loc 1 134 8
	movl	$0, %eax
	.loc 1 134 20
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	__func__.4637, @object
	.size	__func__.4637, 25
__func__.4637:
	.string	"test_resourcesReadConfig"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/types/struct_FILE.h"
	.file 5 "/usr/include/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/bits/stdint-intn.h"
	.file 8 "/usr/include/bits/stdint-uintn.h"
	.file 9 "/usr/include/time.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "tests/../submod/pdjson/pdjson.h"
	.file 12 "tests/../submod/libctfb/conf.h"
	.file 13 "tests/../submod/libctfb/draw.h"
	.file 14 "tests/../submod/libctfb/input.h"
	.file 15 "tests/../parse.h"
	.file 16 "tests/../smodule.h"
	.file 17 "tests/../submod/cstl/tmpl/obj.h"
	.file 18 "tests/../submod/cstl/tmpl/arr.h"
	.file 19 "tests/../ship.h"
	.file 20 "tests/../state.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xfdb
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF176
	.byte	0xc
	.long	.LASF177
	.long	.LASF178
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
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x27
	.byte	0x1a
	.long	0x9d
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x28
	.byte	0x1c
	.long	0x77
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x59
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x59
	.uleb128 0x8
	.byte	0x8
	.long	0xce
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x5
	.long	0xce
	.uleb128 0x9
	.long	.LASF72
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x261
	.uleb128 0xa
	.long	.LASF16
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x52
	.byte	0
	.uleb128 0xa
	.long	.LASF17
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xc8
	.byte	0x8
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xc8
	.byte	0x10
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xc8
	.byte	0x18
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xc8
	.byte	0x20
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xc8
	.byte	0x28
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xc8
	.byte	0x30
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xc8
	.byte	0x38
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xc8
	.byte	0x40
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xc8
	.byte	0x48
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xc8
	.byte	0x50
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xc8
	.byte	0x58
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x27a
	.byte	0x60
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x280
	.byte	0x68
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x52
	.byte	0x70
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x52
	.byte	0x74
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xb0
	.byte	0x78
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x77
	.byte	0x80
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x7e
	.byte	0x82
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x286
	.byte	0x83
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x296
	.byte	0x88
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xbc
	.byte	0x90
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2a1
	.byte	0x98
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2ac
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x280
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF41
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x6e
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF43
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x52
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF44
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2b2
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF45
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xda
	.uleb128 0xb
	.long	.LASF179
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x8
	.byte	0x8
	.long	0x275
	.uleb128 0x8
	.byte	0x8
	.long	0xda
	.uleb128 0xd
	.long	0xce
	.long	0x296
	.uleb128 0xe
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x26d
	.uleb128 0xc
	.long	.LASF47
	.uleb128 0x8
	.byte	0x8
	.long	0x29c
	.uleb128 0xc
	.long	.LASF48
	.uleb128 0x8
	.byte	0x8
	.long	0x2a7
	.uleb128 0xd
	.long	0xce
	.long	0x2c2
	.uleb128 0xe
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF49
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x2ce
	.uleb128 0x8
	.byte	0x8
	.long	0x261
	.uleb128 0xf
	.long	.LASF50
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x2ce
	.uleb128 0xf
	.long	.LASF51
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x2ce
	.uleb128 0x2
	.long	.LASF52
	.byte	0x7
	.byte	0x19
	.byte	0x13
	.long	0x91
	.uleb128 0x2
	.long	.LASF53
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.long	0x85
	.uleb128 0x5
	.long	0x2f8
	.uleb128 0x2
	.long	.LASF54
	.byte	0x8
	.byte	0x19
	.byte	0x14
	.long	0xa4
	.uleb128 0x5
	.long	0x309
	.uleb128 0x8
	.byte	0x8
	.long	0xd5
	.uleb128 0xd
	.long	0xc8
	.long	0x330
	.uleb128 0xe
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF55
	.byte	0x9
	.byte	0x9f
	.byte	0xe
	.long	0x320
	.uleb128 0xf
	.long	.LASF56
	.byte	0x9
	.byte	0xa0
	.byte	0xc
	.long	0x52
	.uleb128 0xf
	.long	.LASF57
	.byte	0x9
	.byte	0xa1
	.byte	0x11
	.long	0x59
	.uleb128 0x10
	.long	.LASF58
	.byte	0xa
	.value	0x21f
	.byte	0xf
	.long	0x361
	.uleb128 0x8
	.byte	0x8
	.long	0xc8
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF59
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF60
	.uleb128 0x11
	.long	.LASF180
	.byte	0x7
	.byte	0x4
	.long	0x67
	.byte	0xb
	.byte	0x18
	.byte	0x6
	.long	0x3ca
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.uleb128 0x12
	.long	.LASF62
	.byte	0x2
	.uleb128 0x12
	.long	.LASF63
	.byte	0x3
	.uleb128 0x12
	.long	.LASF64
	.byte	0x4
	.uleb128 0x12
	.long	.LASF65
	.byte	0x5
	.uleb128 0x12
	.long	.LASF66
	.byte	0x6
	.uleb128 0x12
	.long	.LASF67
	.byte	0x7
	.uleb128 0x12
	.long	.LASF68
	.byte	0x8
	.uleb128 0x12
	.long	.LASF69
	.byte	0x9
	.uleb128 0x12
	.long	.LASF70
	.byte	0xa
	.uleb128 0x12
	.long	.LASF71
	.byte	0xb
	.byte	0
	.uleb128 0x9
	.long	.LASF73
	.byte	0x18
	.byte	0xb
	.byte	0x1e
	.byte	0x8
	.long	0x3ff
	.uleb128 0xa
	.long	.LASF74
	.byte	0xb
	.byte	0x1f
	.byte	0xd
	.long	0x40e
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0xb
	.byte	0x20
	.byte	0xd
	.long	0x428
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0xb
	.byte	0x21
	.byte	0xc
	.long	0x439
	.byte	0x10
	.byte	0
	.uleb128 0x13
	.long	0x6e
	.long	0x40e
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3ff
	.uleb128 0x13
	.long	0x6e
	.long	0x428
	.uleb128 0x14
	.long	0x6e
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x414
	.uleb128 0x15
	.long	0x439
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x42e
	.uleb128 0x2
	.long	.LASF77
	.byte	0xb
	.byte	0x24
	.byte	0xf
	.long	0x44b
	.uleb128 0x8
	.byte	0x8
	.long	0x451
	.uleb128 0x13
	.long	0x52
	.long	0x460
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x2
	.long	.LASF78
	.byte	0xb
	.byte	0x26
	.byte	0x1c
	.long	0x46c
	.uleb128 0x16
	.long	.LASF78
	.value	0x110
	.byte	0xb
	.byte	0x5b
	.byte	0x8
	.long	0x50a
	.uleb128 0xa
	.long	.LASF79
	.byte	0xb
	.byte	0x5c
	.byte	0xc
	.long	0x2d
	.byte	0
	.uleb128 0xa
	.long	.LASF80
	.byte	0xb
	.byte	0x5e
	.byte	0x18
	.long	0x637
	.byte	0x8
	.uleb128 0xa
	.long	.LASF81
	.byte	0xb
	.byte	0x5f
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF82
	.byte	0xb
	.byte	0x60
	.byte	0xc
	.long	0x2d
	.byte	0x18
	.uleb128 0xa
	.long	.LASF83
	.byte	0xb
	.byte	0x61
	.byte	0x14
	.long	0x375
	.byte	0x20
	.uleb128 0xa
	.long	.LASF84
	.byte	0xb
	.byte	0x62
	.byte	0xe
	.long	0x67
	.byte	0x24
	.uleb128 0xa
	.long	.LASF85
	.byte	0xb
	.byte	0x68
	.byte	0x7
	.long	0x601
	.byte	0x28
	.uleb128 0xa
	.long	.LASF86
	.byte	0xb
	.byte	0x6a
	.byte	0xc
	.long	0x2d
	.byte	0x40
	.uleb128 0xa
	.long	.LASF87
	.byte	0xb
	.byte	0x6c
	.byte	0x18
	.long	0x5a4
	.byte	0x48
	.uleb128 0xa
	.long	.LASF88
	.byte	0xb
	.byte	0x6d
	.byte	0x1b
	.long	0x3ca
	.byte	0x78
	.uleb128 0xa
	.long	.LASF89
	.byte	0xb
	.byte	0x6e
	.byte	0xa
	.long	0x63d
	.byte	0x90
	.byte	0
	.uleb128 0x17
	.byte	0x8
	.byte	0xb
	.byte	0x4c
	.byte	0x9
	.long	0x521
	.uleb128 0xa
	.long	.LASF90
	.byte	0xb
	.byte	0x4d
	.byte	0x13
	.long	0x2ce
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x10
	.byte	0xb
	.byte	0x4f
	.byte	0x9
	.long	0x545
	.uleb128 0xa
	.long	.LASF91
	.byte	0xb
	.byte	0x50
	.byte	0x19
	.long	0x31a
	.byte	0
	.uleb128 0xa
	.long	.LASF92
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
	.long	0x576
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
	.long	0x43f
	.byte	0x8
	.uleb128 0xa
	.long	.LASF93
	.byte	0xb
	.byte	0x56
	.byte	0x1a
	.long	0x43f
	.byte	0x10
	.byte	0
	.uleb128 0x19
	.byte	0x18
	.byte	0xb
	.byte	0x4b
	.byte	0x5
	.long	0x5a4
	.uleb128 0x1a
	.long	.LASF90
	.byte	0xb
	.byte	0x4e
	.byte	0xb
	.long	0x50a
	.uleb128 0x1a
	.long	.LASF91
	.byte	0xb
	.byte	0x52
	.byte	0xb
	.long	0x521
	.uleb128 0x1a
	.long	.LASF94
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.long	0x545
	.byte	0
	.uleb128 0x9
	.long	.LASF95
	.byte	0x30
	.byte	0xb
	.byte	0x47
	.byte	0x8
	.long	0x5e6
	.uleb128 0x18
	.string	"get"
	.byte	0xb
	.byte	0x48
	.byte	0xb
	.long	0x5fb
	.byte	0
	.uleb128 0xa
	.long	.LASF93
	.byte	0xb
	.byte	0x49
	.byte	0xb
	.long	0x5fb
	.byte	0x8
	.uleb128 0xa
	.long	.LASF96
	.byte	0xb
	.byte	0x4a
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF87
	.byte	0xb
	.byte	0x58
	.byte	0x7
	.long	0x576
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.long	0x52
	.long	0x5f5
	.uleb128 0x14
	.long	0x5f5
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x5a4
	.uleb128 0x8
	.byte	0x8
	.long	0x5e6
	.uleb128 0x17
	.byte	0x18
	.byte	0xb
	.byte	0x64
	.byte	0x5
	.long	0x632
	.uleb128 0xa
	.long	.LASF97
	.byte	0xb
	.byte	0x65
	.byte	0xf
	.long	0xc8
	.byte	0
	.uleb128 0xa
	.long	.LASF98
	.byte	0xb
	.byte	0x66
	.byte	0x10
	.long	0x2d
	.byte	0x8
	.uleb128 0xa
	.long	.LASF99
	.byte	0xb
	.byte	0x67
	.byte	0x10
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.long	.LASF100
	.uleb128 0x8
	.byte	0x8
	.long	0x632
	.uleb128 0xd
	.long	0xce
	.long	0x64d
	.uleb128 0xe
	.long	0x39
	.byte	0x7f
	.byte	0
	.uleb128 0x1b
	.long	.LASF101
	.byte	0xc
	.byte	0x13
	.byte	0x10
	.long	0x315
	.uleb128 0x9
	.byte	0x3
	.quad	__VERS
	.uleb128 0xd
	.long	0x4d
	.long	0x673
	.uleb128 0xe
	.long	0x39
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	0x663
	.uleb128 0x1b
	.long	.LASF102
	.byte	0xd
	.byte	0x6
	.byte	0xf
	.long	0x673
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARS
	.uleb128 0x1b
	.long	.LASF103
	.byte	0xd
	.byte	0x7
	.byte	0xf
	.long	0x673
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARSD
	.uleb128 0x1c
	.long	.LASF104
	.byte	0xe
	.byte	0x5
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ESC
	.uleb128 0x1c
	.long	.LASF105
	.byte	0xe
	.byte	0x7
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RET
	.uleb128 0x1c
	.long	.LASF106
	.byte	0xe
	.byte	0xa
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII4_CTRL_D
	.uleb128 0x1c
	.long	.LASF107
	.byte	0xe
	.byte	0xb
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII8_DEL
	.uleb128 0x1c
	.long	.LASF108
	.byte	0xe
	.byte	0xc
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII21_CTRL_U
	.uleb128 0x1c
	.long	.LASF109
	.byte	0xe
	.byte	0xd
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_BACKSPACE
	.uleb128 0x1c
	.long	.LASF110
	.byte	0xe
	.byte	0x10
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP
	.uleb128 0x1c
	.long	.LASF111
	.byte	0xe
	.byte	0x11
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT
	.uleb128 0x1c
	.long	.LASF112
	.byte	0xe
	.byte	0x12
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT
	.uleb128 0x1c
	.long	.LASF113
	.byte	0xe
	.byte	0x13
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN
	.uleb128 0x1c
	.long	.LASF114
	.byte	0xe
	.byte	0x15
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP_SHIFT
	.uleb128 0x1c
	.long	.LASF115
	.byte	0xe
	.byte	0x16
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT_SHIFT
	.uleb128 0x1c
	.long	.LASF116
	.byte	0xe
	.byte	0x17
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT_SHIFT
	.uleb128 0x1c
	.long	.LASF117
	.byte	0xe
	.byte	0x18
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN_SHIFT
	.uleb128 0x1c
	.long	.LASF118
	.byte	0xe
	.byte	0x1a
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE
	.uleb128 0x1c
	.long	.LASF119
	.byte	0xe
	.byte	0x1b
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE
	.uleb128 0x1c
	.long	.LASF120
	.byte	0xe
	.byte	0x1c
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW
	.uleb128 0x1c
	.long	.LASF121
	.byte	0xe
	.byte	0x1d
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW
	.uleb128 0x1c
	.long	.LASF122
	.byte	0xe
	.byte	0x1f
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE_SHIFT
	.uleb128 0x1c
	.long	.LASF123
	.byte	0xe
	.byte	0x20
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE_SHIFT
	.uleb128 0x1c
	.long	.LASF124
	.byte	0xe
	.byte	0x21
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW_SHIFT
	.uleb128 0x1c
	.long	.LASF125
	.byte	0xe
	.byte	0x22
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW_SHIFT
	.uleb128 0x1c
	.long	.LASF126
	.byte	0xe
	.byte	0x24
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F1
	.uleb128 0x1c
	.long	.LASF127
	.byte	0xe
	.byte	0x25
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F2
	.uleb128 0x1c
	.long	.LASF128
	.byte	0xe
	.byte	0x26
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F3
	.uleb128 0x1c
	.long	.LASF129
	.byte	0xe
	.byte	0x27
	.byte	0x16
	.long	0x304
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F4
	.uleb128 0xd
	.long	0xd5
	.long	0x8f6
	.uleb128 0xe
	.long	0x39
	.byte	0xb
	.uleb128 0xe
	.long	0x39
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x8e0
	.uleb128 0x1b
	.long	.LASF130
	.byte	0xf
	.byte	0x6
	.byte	0xc
	.long	0x8f6
	.uleb128 0x9
	.byte	0x3
	.quad	json_typename
	.uleb128 0x2
	.long	.LASF131
	.byte	0x10
	.byte	0x7
	.byte	0x18
	.long	0x91d
	.uleb128 0x9
	.long	.LASF132
	.byte	0x60
	.byte	0x10
	.byte	0x8
	.byte	0x8
	.long	0x9ec
	.uleb128 0xa
	.long	.LASF133
	.byte	0x11
	.byte	0x2
	.byte	0x11
	.long	0x9fd
	.byte	0
	.uleb128 0xa
	.long	.LASF134
	.byte	0x11
	.byte	0x3
	.byte	0x11
	.long	0x9fd
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0x11
	.byte	0x4
	.byte	0x9
	.long	0xa0e
	.byte	0x10
	.uleb128 0xa
	.long	.LASF135
	.byte	0x11
	.byte	0x5
	.byte	0x9
	.long	0xa0e
	.byte	0x18
	.uleb128 0xa
	.long	.LASF136
	.byte	0x11
	.byte	0x6
	.byte	0x11
	.long	0xa23
	.byte	0x20
	.uleb128 0xa
	.long	.LASF137
	.byte	0x11
	.byte	0x7
	.byte	0x11
	.long	0xa23
	.byte	0x28
	.uleb128 0xa
	.long	.LASF138
	.byte	0x11
	.byte	0x8
	.byte	0x9
	.long	0x2d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF139
	.byte	0x11
	.byte	0x9
	.byte	0xb
	.long	0x309
	.byte	0x38
	.uleb128 0xa
	.long	.LASF140
	.byte	0x10
	.byte	0x10
	.byte	0x6
	.long	0x52
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF141
	.byte	0x10
	.byte	0x11
	.byte	0x8
	.long	0xc8
	.byte	0x40
	.uleb128 0x18
	.string	"hp"
	.byte	0x10
	.byte	0x12
	.byte	0x6
	.long	0x52
	.byte	0x48
	.uleb128 0xa
	.long	.LASF142
	.byte	0x10
	.byte	0x13
	.byte	0x6
	.long	0x52
	.byte	0x4c
	.uleb128 0xa
	.long	.LASF143
	.byte	0x10
	.byte	0x14
	.byte	0x6
	.long	0x52
	.byte	0x50
	.uleb128 0x18
	.string	"ap"
	.byte	0x10
	.byte	0x15
	.byte	0x6
	.long	0x52
	.byte	0x54
	.uleb128 0xa
	.long	.LASF144
	.byte	0x10
	.byte	0x16
	.byte	0x6
	.long	0x52
	.byte	0x58
	.byte	0
	.uleb128 0x1d
	.long	0x9f7
	.long	0x9f7
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x911
	.uleb128 0x8
	.byte	0x8
	.long	0x9ec
	.uleb128 0x15
	.long	0xa0e
	.uleb128 0x14
	.long	0x9f7
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xa03
	.uleb128 0x13
	.long	0x9f7
	.long	0xa23
	.uleb128 0x14
	.long	0x9f7
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xa14
	.uleb128 0x2
	.long	.LASF145
	.byte	0x12
	.byte	0x12
	.byte	0x29
	.long	0xa35
	.uleb128 0x9
	.long	.LASF145
	.byte	0x58
	.byte	0x12
	.byte	0x14
	.byte	0x8
	.long	0xb06
	.uleb128 0xa
	.long	.LASF133
	.byte	0x12
	.byte	0x1d
	.byte	0x1e
	.long	0xb17
	.byte	0
	.uleb128 0xa
	.long	.LASF134
	.byte	0x12
	.byte	0x1e
	.byte	0x1e
	.long	0xb17
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0x12
	.byte	0x1f
	.byte	0x9
	.long	0xb2e
	.byte	0x10
	.uleb128 0xa
	.long	.LASF136
	.byte	0x12
	.byte	0x20
	.byte	0x1e
	.long	0xb43
	.byte	0x18
	.uleb128 0xa
	.long	.LASF137
	.byte	0x12
	.byte	0x21
	.byte	0x1e
	.long	0xb43
	.byte	0x20
	.uleb128 0xa
	.long	.LASF138
	.byte	0x12
	.byte	0x22
	.byte	0x9
	.long	0x2d
	.byte	0x28
	.uleb128 0xa
	.long	.LASF139
	.byte	0x12
	.byte	0x23
	.byte	0xb
	.long	0x309
	.byte	0x30
	.uleb128 0xa
	.long	.LASF146
	.byte	0x12
	.byte	0x29
	.byte	0x9
	.long	0x2d
	.byte	0x38
	.uleb128 0xa
	.long	.LASF147
	.byte	0x12
	.byte	0x2a
	.byte	0xb
	.long	0x309
	.byte	0x40
	.uleb128 0xa
	.long	.LASF148
	.byte	0x12
	.byte	0x2c
	.byte	0xb
	.long	0x309
	.byte	0x42
	.uleb128 0xa
	.long	.LASF149
	.byte	0x12
	.byte	0x2d
	.byte	0xb
	.long	0x309
	.byte	0x44
	.uleb128 0xa
	.long	.LASF150
	.byte	0x12
	.byte	0x2e
	.byte	0xb
	.long	0x309
	.byte	0x46
	.uleb128 0xa
	.long	.LASF151
	.byte	0x12
	.byte	0x2f
	.byte	0xa
	.long	0x2ec
	.byte	0x48
	.uleb128 0xa
	.long	.LASF152
	.byte	0x12
	.byte	0x31
	.byte	0xb
	.long	0x309
	.byte	0x4a
	.uleb128 0xa
	.long	.LASF153
	.byte	0x12
	.byte	0x33
	.byte	0xf
	.long	0x9f7
	.byte	0x50
	.byte	0
	.uleb128 0x1d
	.long	0xb11
	.long	0xb11
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xa29
	.uleb128 0x8
	.byte	0x8
	.long	0xb06
	.uleb128 0x15
	.long	0xb28
	.uleb128 0x14
	.long	0xb28
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xa35
	.uleb128 0x8
	.byte	0x8
	.long	0xb1d
	.uleb128 0x13
	.long	0xb11
	.long	0xb43
	.uleb128 0x14
	.long	0xb11
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xb34
	.uleb128 0x2
	.long	.LASF154
	.byte	0x13
	.byte	0x9
	.byte	0x15
	.long	0xb55
	.uleb128 0x9
	.long	.LASF155
	.byte	0xc0
	.byte	0x13
	.byte	0xa
	.byte	0x8
	.long	0xc58
	.uleb128 0xa
	.long	.LASF133
	.byte	0x11
	.byte	0x2
	.byte	0xe
	.long	0xc69
	.byte	0
	.uleb128 0xa
	.long	.LASF134
	.byte	0x11
	.byte	0x3
	.byte	0xe
	.long	0xc69
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0x11
	.byte	0x4
	.byte	0x9
	.long	0xc7a
	.byte	0x10
	.uleb128 0xa
	.long	.LASF135
	.byte	0x11
	.byte	0x5
	.byte	0x9
	.long	0xc7a
	.byte	0x18
	.uleb128 0xa
	.long	.LASF136
	.byte	0x11
	.byte	0x6
	.byte	0xe
	.long	0xc8f
	.byte	0x20
	.uleb128 0xa
	.long	.LASF137
	.byte	0x11
	.byte	0x7
	.byte	0xe
	.long	0xc8f
	.byte	0x28
	.uleb128 0xa
	.long	.LASF138
	.byte	0x11
	.byte	0x8
	.byte	0x9
	.long	0x2d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF139
	.byte	0x11
	.byte	0x9
	.byte	0xb
	.long	0x309
	.byte	0x38
	.uleb128 0xa
	.long	.LASF156
	.byte	0x13
	.byte	0x12
	.byte	0x6
	.long	0x52
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF141
	.byte	0x13
	.byte	0x13
	.byte	0x8
	.long	0xc8
	.byte	0x40
	.uleb128 0x18
	.string	"hp"
	.byte	0x13
	.byte	0x14
	.byte	0x6
	.long	0x52
	.byte	0x48
	.uleb128 0xa
	.long	.LASF157
	.byte	0x13
	.byte	0x15
	.byte	0x6
	.long	0x52
	.byte	0x4c
	.uleb128 0xa
	.long	.LASF158
	.byte	0x13
	.byte	0x16
	.byte	0x6
	.long	0x52
	.byte	0x50
	.uleb128 0xa
	.long	.LASF159
	.byte	0x13
	.byte	0x17
	.byte	0x6
	.long	0x52
	.byte	0x54
	.uleb128 0xa
	.long	.LASF160
	.byte	0x13
	.byte	0x18
	.byte	0x6
	.long	0x52
	.byte	0x58
	.uleb128 0x18
	.string	"ap"
	.byte	0x13
	.byte	0x19
	.byte	0x6
	.long	0x52
	.byte	0x5c
	.uleb128 0xa
	.long	.LASF161
	.byte	0x13
	.byte	0x1a
	.byte	0x6
	.long	0x52
	.byte	0x60
	.uleb128 0xa
	.long	.LASF162
	.byte	0x13
	.byte	0x1b
	.byte	0x6
	.long	0x52
	.byte	0x64
	.uleb128 0xa
	.long	.LASF163
	.byte	0x13
	.byte	0x1d
	.byte	0x1b
	.long	0xa29
	.byte	0x68
	.byte	0
	.uleb128 0x1d
	.long	0xc63
	.long	0xc63
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xb49
	.uleb128 0x8
	.byte	0x8
	.long	0xc58
	.uleb128 0x15
	.long	0xc7a
	.uleb128 0x14
	.long	0xc63
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xc6f
	.uleb128 0x13
	.long	0xc63
	.long	0xc8f
	.uleb128 0x14
	.long	0xc63
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xc80
	.uleb128 0x2
	.long	.LASF164
	.byte	0x12
	.byte	0x12
	.byte	0x26
	.long	0xca1
	.uleb128 0x9
	.long	.LASF164
	.byte	0x58
	.byte	0x12
	.byte	0x14
	.byte	0x8
	.long	0xd72
	.uleb128 0xa
	.long	.LASF133
	.byte	0x12
	.byte	0x1d
	.byte	0x1b
	.long	0xd83
	.byte	0
	.uleb128 0xa
	.long	.LASF134
	.byte	0x12
	.byte	0x1e
	.byte	0x1b
	.long	0xd83
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0x12
	.byte	0x1f
	.byte	0x9
	.long	0xd9a
	.byte	0x10
	.uleb128 0xa
	.long	.LASF136
	.byte	0x12
	.byte	0x20
	.byte	0x1b
	.long	0xdaf
	.byte	0x18
	.uleb128 0xa
	.long	.LASF137
	.byte	0x12
	.byte	0x21
	.byte	0x1b
	.long	0xdaf
	.byte	0x20
	.uleb128 0xa
	.long	.LASF138
	.byte	0x12
	.byte	0x22
	.byte	0x9
	.long	0x2d
	.byte	0x28
	.uleb128 0xa
	.long	.LASF139
	.byte	0x12
	.byte	0x23
	.byte	0xb
	.long	0x309
	.byte	0x30
	.uleb128 0xa
	.long	.LASF146
	.byte	0x12
	.byte	0x29
	.byte	0x9
	.long	0x2d
	.byte	0x38
	.uleb128 0xa
	.long	.LASF147
	.byte	0x12
	.byte	0x2a
	.byte	0xb
	.long	0x309
	.byte	0x40
	.uleb128 0xa
	.long	.LASF148
	.byte	0x12
	.byte	0x2c
	.byte	0xb
	.long	0x309
	.byte	0x42
	.uleb128 0xa
	.long	.LASF149
	.byte	0x12
	.byte	0x2d
	.byte	0xb
	.long	0x309
	.byte	0x44
	.uleb128 0xa
	.long	.LASF150
	.byte	0x12
	.byte	0x2e
	.byte	0xb
	.long	0x309
	.byte	0x46
	.uleb128 0xa
	.long	.LASF151
	.byte	0x12
	.byte	0x2f
	.byte	0xa
	.long	0x2ec
	.byte	0x48
	.uleb128 0xa
	.long	.LASF152
	.byte	0x12
	.byte	0x31
	.byte	0xb
	.long	0x309
	.byte	0x4a
	.uleb128 0xa
	.long	.LASF153
	.byte	0x12
	.byte	0x33
	.byte	0xc
	.long	0xc63
	.byte	0x50
	.byte	0
	.uleb128 0x1d
	.long	0xd7d
	.long	0xd7d
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xc95
	.uleb128 0x8
	.byte	0x8
	.long	0xd72
	.uleb128 0x15
	.long	0xd94
	.uleb128 0x14
	.long	0xd94
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xca1
	.uleb128 0x8
	.byte	0x8
	.long	0xd89
	.uleb128 0x13
	.long	0xd7d
	.long	0xdaf
	.uleb128 0x14
	.long	0xd7d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xda0
	.uleb128 0x2
	.long	.LASF165
	.byte	0x14
	.byte	0x9
	.byte	0x1a
	.long	0xdc1
	.uleb128 0x9
	.long	.LASF166
	.byte	0x98
	.byte	0x14
	.byte	0xa
	.byte	0x8
	.long	0xe51
	.uleb128 0xa
	.long	.LASF133
	.byte	0x11
	.byte	0x2
	.byte	0x13
	.long	0xe62
	.byte	0
	.uleb128 0xa
	.long	.LASF134
	.byte	0x11
	.byte	0x3
	.byte	0x13
	.long	0xe62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF76
	.byte	0x11
	.byte	0x4
	.byte	0x9
	.long	0xe73
	.byte	0x10
	.uleb128 0xa
	.long	.LASF135
	.byte	0x11
	.byte	0x5
	.byte	0x9
	.long	0xe73
	.byte	0x18
	.uleb128 0xa
	.long	.LASF136
	.byte	0x11
	.byte	0x6
	.byte	0x13
	.long	0xe88
	.byte	0x20
	.uleb128 0xa
	.long	.LASF137
	.byte	0x11
	.byte	0x7
	.byte	0x13
	.long	0xe88
	.byte	0x28
	.uleb128 0xa
	.long	.LASF138
	.byte	0x11
	.byte	0x8
	.byte	0x9
	.long	0x2d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF139
	.byte	0x11
	.byte	0x9
	.byte	0xb
	.long	0x309
	.byte	0x38
	.uleb128 0xa
	.long	.LASF167
	.byte	0x14
	.byte	0x11
	.byte	0x6
	.long	0x52
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF168
	.byte	0x14
	.byte	0x13
	.byte	0x18
	.long	0xc95
	.byte	0x40
	.byte	0
	.uleb128 0x1d
	.long	0xe5c
	.long	0xe5c
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xdb5
	.uleb128 0x8
	.byte	0x8
	.long	0xe51
	.uleb128 0x15
	.long	0xe73
	.uleb128 0x14
	.long	0xe5c
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xe68
	.uleb128 0x13
	.long	0xe5c
	.long	0xe88
	.uleb128 0x14
	.long	0xe5c
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xe79
	.uleb128 0x1f
	.long	.LASF181
	.byte	0x1
	.byte	0x82
	.byte	0x1
	.long	0x52
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.long	.LASF170
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.long	0x52
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xeed
	.uleb128 0x21
	.string	"obj"
	.byte	0x1
	.byte	0x71
	.byte	0xc
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.long	.LASF169
	.byte	0x1
	.byte	0x73
	.byte	0xc
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.long	.LASF171
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.long	0x52
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xf94
	.uleb128 0x1c
	.long	.LASF172
	.byte	0x1
	.byte	0x50
	.byte	0x8
	.long	0x2ce
	.uleb128 0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0x1c
	.long	.LASF173
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.long	0xf94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -489
	.uleb128 0x22
	.long	.LASF182
	.long	0xfab
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4637
	.uleb128 0x23
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x21
	.string	"JS"
	.byte	0x1
	.byte	0x56
	.byte	0xf
	.long	0x460
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x21
	.string	"str"
	.byte	0x1
	.byte	0x5a
	.byte	0xf
	.long	0x31a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -472
	.uleb128 0x1c
	.long	.LASF174
	.byte	0x1
	.byte	0x5b
	.byte	0xa
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -488
	.uleb128 0x21
	.string	"obj"
	.byte	0x1
	.byte	0x5e
	.byte	0x11
	.long	0xdb5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF175
	.uleb128 0xd
	.long	0xd5
	.long	0xfab
	.uleb128 0xe
	.long	0x39
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.long	0xf9b
	.uleb128 0x24
	.long	.LASF183
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.long	0x52
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.string	"obj"
	.byte	0x1
	.byte	0x47
	.byte	0x11
	.long	0xe5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x34
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
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x24
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
.LASF137:
	.string	"copyDeep"
.LASF78:
	.string	"json_stream"
.LASF162:
	.string	"visibility"
.LASF35:
	.string	"_shortbuf"
.LASF146:
	.string	"_typeSize"
.LASF179:
	.string	"_IO_lock_t"
.LASF73:
	.string	"json_allocator"
.LASF51:
	.string	"stderr"
.LASF150:
	.string	"capacity"
.LASF24:
	.string	"_IO_buf_end"
.LASF84:
	.string	"flags"
.LASF114:
	.string	"CTFB_UP_SHIFT"
.LASF155:
	.string	"ship"
.LASF91:
	.string	"buffer"
.LASF63:
	.string	"JSON_OBJECT"
.LASF152:
	.string	"_resizeCounter"
.LASF22:
	.string	"_IO_write_end"
.LASF5:
	.string	"unsigned int"
.LASF83:
	.string	"next"
.LASF147:
	.string	"allocationSize"
.LASF157:
	.string	"water"
.LASF40:
	.string	"_freeres_list"
.LASF112:
	.string	"CTFB_RIGHT"
.LASF153:
	.string	"p_array"
.LASF16:
	.string	"_flags"
.LASF109:
	.string	"CTFB_BACKSPACE"
.LASF1:
	.string	"wchar_t"
.LASF70:
	.string	"JSON_FALSE"
.LASF28:
	.string	"_markers"
.LASF79:
	.string	"lineno"
.LASF124:
	.string	"CTFB_NW_SHIFT"
.LASF107:
	.string	"CTFB_ASCII8_DEL"
.LASF81:
	.string	"stack_top"
.LASF177:
	.string	"tests/tests.c"
.LASF67:
	.string	"JSON_STRING"
.LASF57:
	.string	"__timezone"
.LASF136:
	.string	"copy"
.LASF69:
	.string	"JSON_TRUE"
.LASF167:
	.string	"vers"
.LASF50:
	.string	"stdout"
.LASF123:
	.string	"CTFB_SE_SHIFT"
.LASF27:
	.string	"_IO_save_end"
.LASF102:
	.string	"FRAMECHARS"
.LASF143:
	.string	"hitChance"
.LASF59:
	.string	"float"
.LASF47:
	.string	"_IO_codecvt"
.LASF74:
	.string	"malloc"
.LASF142:
	.string	"powergen"
.LASF132:
	.string	"smodule"
.LASF52:
	.string	"int16_t"
.LASF125:
	.string	"CTFB_SW_SHIFT"
.LASF171:
	.string	"test_resourcesReadConfig"
.LASF86:
	.string	"ntokens"
.LASF12:
	.string	"__uint16_t"
.LASF176:
	.string	"GNU C99 9.3.0 -mtune=generic -march=x86-64 -g -std=c99 -fpie"
.LASF26:
	.string	"_IO_backup_base"
.LASF37:
	.string	"_offset"
.LASF135:
	.string	"clean"
.LASF30:
	.string	"_fileno"
.LASF168:
	.string	"shipTeplates"
.LASF118:
	.string	"CTFB_NE"
.LASF62:
	.string	"JSON_DONE"
.LASF94:
	.string	"user"
.LASF0:
	.string	"size_t"
.LASF120:
	.string	"CTFB_NW"
.LASF101:
	.string	"__VERS"
.LASF149:
	.string	"startPosition"
.LASF103:
	.string	"FRAMECHARSD"
.LASF71:
	.string	"JSON_NULL"
.LASF19:
	.string	"_IO_read_base"
.LASF175:
	.string	"_Bool"
.LASF49:
	.string	"stdin"
.LASF76:
	.string	"free"
.LASF138:
	.string	"objSize"
.LASF97:
	.string	"string"
.LASF61:
	.string	"JSON_ERROR"
.LASF173:
	.string	"error"
.LASF15:
	.string	"char"
.LASF43:
	.string	"_mode"
.LASF56:
	.string	"__daylight"
.LASF46:
	.string	"_IO_marker"
.LASF17:
	.string	"_IO_read_ptr"
.LASF122:
	.string	"CTFB_NE_SHIFT"
.LASF85:
	.string	"data"
.LASF100:
	.string	"json_stack"
.LASF131:
	.string	"obj_smodule"
.LASF139:
	.string	"objName"
.LASF117:
	.string	"CTFB_DOWN_SHIFT"
.LASF53:
	.string	"uint8_t"
.LASF156:
	.string	"shipTemplateID"
.LASF68:
	.string	"JSON_NUMBER"
.LASF105:
	.string	"CTFB_RET"
.LASF20:
	.string	"_IO_write_base"
.LASF165:
	.string	"obj_resources"
.LASF4:
	.string	"long long int"
.LASF145:
	.string	"arr_arrStrct_obj_smodule"
.LASF111:
	.string	"CTFB_LEFT"
.LASF25:
	.string	"_IO_save_base"
.LASF106:
	.string	"CTFB_ASCII4_CTRL_D"
.LASF172:
	.string	"res_conf_json"
.LASF89:
	.string	"errmsg"
.LASF10:
	.string	"__int16_t"
.LASF130:
	.string	"json_typename"
.LASF41:
	.string	"_freeres_buf"
.LASF174:
	.string	"strLength"
.LASF42:
	.string	"__pad5"
.LASF140:
	.string	"smodType"
.LASF34:
	.string	"_vtable_offset"
.LASF66:
	.string	"JSON_ARRAY_END"
.LASF178:
	.string	"/home/adip/git/bshc"
.LASF115:
	.string	"CTFB_LEFT_SHIFT"
.LASF98:
	.string	"string_fill"
.LASF54:
	.string	"uint16_t"
.LASF119:
	.string	"CTFB_SE"
.LASF163:
	.string	"modules"
.LASF121:
	.string	"CTFB_SW"
.LASF144:
	.string	"apGen"
.LASF18:
	.string	"_IO_read_end"
.LASF88:
	.string	"alloc"
.LASF11:
	.string	"short int"
.LASF3:
	.string	"long int"
.LASF166:
	.string	"resources"
.LASF92:
	.string	"length"
.LASF160:
	.string	"manuver"
.LASF48:
	.string	"_IO_wide_data"
.LASF58:
	.string	"__environ"
.LASF64:
	.string	"JSON_OBJECT_END"
.LASF9:
	.string	"__uint8_t"
.LASF87:
	.string	"source"
.LASF141:
	.string	"name"
.LASF95:
	.string	"json_source"
.LASF126:
	.string	"CTFB_F1"
.LASF127:
	.string	"CTFB_F2"
.LASF80:
	.string	"stack"
.LASF129:
	.string	"CTFB_F4"
.LASF116:
	.string	"CTFB_RIGHT_SHIFT"
.LASF39:
	.string	"_wide_data"
.LASF110:
	.string	"CTFB_UP"
.LASF133:
	.string	"init"
.LASF36:
	.string	"_lock"
.LASF2:
	.string	"long unsigned int"
.LASF104:
	.string	"CTFB_ESC"
.LASF108:
	.string	"CTFB_ASCII21_CTRL_U"
.LASF32:
	.string	"_old_offset"
.LASF72:
	.string	"_IO_FILE"
.LASF148:
	.string	"iterIndex"
.LASF6:
	.string	"unsigned char"
.LASF55:
	.string	"__tzname"
.LASF170:
	.string	"test_ship"
.LASF21:
	.string	"_IO_write_ptr"
.LASF134:
	.string	"finalize"
.LASF65:
	.string	"JSON_ARRAY"
.LASF169:
	.string	"objCopy"
.LASF38:
	.string	"_codecvt"
.LASF164:
	.string	"arr_arrStrct_obj_ship"
.LASF154:
	.string	"obj_ship"
.LASF75:
	.string	"realloc"
.LASF159:
	.string	"power"
.LASF183:
	.string	"test_resources"
.LASF13:
	.string	"__off_t"
.LASF180:
	.string	"json_type"
.LASF8:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF181:
	.string	"main"
.LASF161:
	.string	"view"
.LASF151:
	.string	"usedCapacity"
.LASF182:
	.string	"__func__"
.LASF128:
	.string	"CTFB_F3"
.LASF60:
	.string	"double"
.LASF158:
	.string	"drag"
.LASF82:
	.string	"stack_size"
.LASF29:
	.string	"_chain"
.LASF113:
	.string	"CTFB_DOWN"
.LASF45:
	.string	"FILE"
.LASF31:
	.string	"_flags2"
.LASF99:
	.string	"string_size"
.LASF77:
	.string	"json_user_io"
.LASF93:
	.string	"peek"
.LASF33:
	.string	"_cur_column"
.LASF96:
	.string	"position"
.LASF14:
	.string	"__off64_t"
.LASF44:
	.string	"_unused2"
.LASF23:
	.string	"_IO_buf_base"
.LASF90:
	.string	"stream"
	.ident	"GCC: (Gentoo Hardened 9.3.0 p2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
