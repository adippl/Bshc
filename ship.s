	.file	"ship.c"
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
.LC0:
	.string	"nullpointer error at %s %p"
	.text
	.globl	obj_ship_finalize
	.type	obj_ship_finalize, @function
obj_ship_finalize:
.LFB0:
	.file 1 "ship.c"
	.loc 1 4 34
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 5 16
	movq	-8(%rbp), %rax
	leaq	obj_ship_finalize(%rip), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 6 12
	movq	-8(%rbp), %rax
	leaq	obj_ship_free(%rip), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 7 13
	movq	-8(%rbp), %rax
	leaq	obj_ship_clean(%rip), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 8 12
	movq	-8(%rbp), %rax
	leaq	obj_ship_copy(%rip), %rdx
	movq	%rdx, 32(%rax)
	.loc 1 9 16
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	.loc 1 10 15
	movq	-8(%rbp), %rax
	movq	$192, 48(%rax)
	.loc 1 13 22
	movq	-8(%rbp), %rax
	movl	$0, 60(%rax)
	.loc 1 14 13
	movl	$1, %esi
	movl	$64, %edi
	call	calloc@PLT
	movq	%rax, %rdx
	.loc 1 14 12
	movq	-8(%rbp), %rax
	movq	%rdx, 64(%rax)
	.loc 1 15 10
	movq	-8(%rbp), %rax
	movl	$0, 72(%rax)
	.loc 1 16 13
	movq	-8(%rbp), %rax
	movl	$0, 76(%rax)
	.loc 1 17 12
	movq	-8(%rbp), %rax
	movl	$0, 80(%rax)
	.loc 1 18 13
	movq	-8(%rbp), %rax
	movl	$0, 84(%rax)
	.loc 1 19 15
	movq	-8(%rbp), %rax
	movl	$0, 88(%rax)
	.loc 1 20 10
	movq	-8(%rbp), %rax
	movl	$0, 92(%rax)
	.loc 1 21 12
	movq	-8(%rbp), %rax
	movl	$0, 96(%rax)
	.loc 1 23 2
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdi
	call	arr_Finalize_obj_smodule@PLT
	.loc 1 24 20
	movq	-8(%rbp), %rax
	movq	184(%rax), %rax
	.loc 1 24 4
	testq	%rax, %rax
	jne	.L2
	.loc 1 24 47 discriminator 1
	movq	-8(%rbp), %rax
	leaq	184(%rax), %rdx
	.loc 1 24 30 discriminator 1
	movq	stderr(%rip), %rax
	movq	%rdx, %rcx
	leaq	__func__.4543(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 24 73 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L2:
	.loc 1 25 8
	movq	-8(%rbp), %rax
	.loc 1 25 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	obj_ship_finalize, .-obj_ship_finalize
	.globl	obj_ship_free
	.type	obj_ship_free, @function
obj_ship_free:
.LFB1:
	.loc 1 28 30
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 29 5
	movq	-8(%rbp), %rax
	.loc 1 29 4
	testq	%rax, %rax
	jne	.L5
	.loc 1 29 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4547(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 29 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L5:
	.loc 1 30 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	obj_ship_clean
	.loc 1 31 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 32 2
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	obj_ship_free, .-obj_ship_free
	.globl	obj_ship_clean
	.type	obj_ship_clean, @function
obj_ship_clean:
.LFB2:
	.loc 1 35 31
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 36 5
	movq	-8(%rbp), %rax
	.loc 1 36 4
	testq	%rax, %rax
	jne	.L8
	.loc 1 36 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4551(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 36 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L8:
	.loc 1 37 29
	movq	-8(%rbp), %rax
	.loc 1 37 2
	addq	$104, %rax
	movq	%rax, %rdi
	call	arr_Clean_obj_smodule@PLT
	.loc 1 38 2
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	obj_ship_clean, .-obj_ship_clean
	.globl	obj_ship_copy
	.type	obj_ship_copy, @function
obj_ship_copy:
.LFB3:
	.loc 1 41 30
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 42 5
	movq	-24(%rbp), %rax
	.loc 1 42 4
	testq	%rax, %rax
	jne	.L11
	.loc 1 42 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4555(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 42 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L11:
	.loc 1 43 16
	movl	$192, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 44 6
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 44 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	*%rdx
.LVL0:
	.loc 1 45 29
	movq	-24(%rbp), %rax
	movl	60(%rax), %edx
	.loc 1 45 23
	movq	-8(%rbp), %rax
	movl	%edx, 60(%rax)
	.loc 1 46 17
	movq	-24(%rbp), %rax
	movl	72(%rax), %edx
	.loc 1 46 11
	movq	-8(%rbp), %rax
	movl	%edx, 72(%rax)
	.loc 1 47 20
	movq	-24(%rbp), %rax
	movl	76(%rax), %edx
	.loc 1 47 14
	movq	-8(%rbp), %rax
	movl	%edx, 76(%rax)
	.loc 1 48 19
	movq	-24(%rbp), %rax
	movl	80(%rax), %edx
	.loc 1 48 13
	movq	-8(%rbp), %rax
	movl	%edx, 80(%rax)
	.loc 1 49 20
	movq	-24(%rbp), %rax
	movl	84(%rax), %edx
	.loc 1 49 14
	movq	-8(%rbp), %rax
	movl	%edx, 84(%rax)
	.loc 1 50 22
	movq	-24(%rbp), %rax
	movl	88(%rax), %edx
	.loc 1 50 16
	movq	-8(%rbp), %rax
	movl	%edx, 88(%rax)
	.loc 1 51 17
	movq	-24(%rbp), %rax
	movl	92(%rax), %edx
	.loc 1 51 11
	movq	-8(%rbp), %rax
	movl	%edx, 92(%rax)
	.loc 1 52 19
	movq	-24(%rbp), %rax
	movl	96(%rax), %edx
	.loc 1 52 13
	movq	-8(%rbp), %rax
	movl	%edx, 96(%rax)
	.loc 1 53 24
	movq	-24(%rbp), %rax
	movq	64(%rax), %rcx
	.loc 1 53 2
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movl	$64, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 54 2
	movq	-8(%rbp), %rax
	leaq	104(%rax), %rdx
	.loc 1 54 30
	movq	-24(%rbp), %rax
	.loc 1 54 2
	addq	$104, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arr_Copyto_obj_smodule@PLT
	.loc 1 55 8
	movq	-8(%rbp), %rax
	.loc 1 55 2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	obj_ship_copy, .-obj_ship_copy
	.section	.rodata
	.align 8
.LC1:
	.string	"SHIPPARSE FIRST OBJECT PASSED %s\n"
.LC2:
	.string	"FIRST ship STRING %s\n"
.LC3:
	.string	"\t yARRLOOP BB %s\n"
.LC4:
	.string	"unexpected JSON ERROR"
	.align 8
.LC5:
	.string	"json parse error in func %s pos %ld %ld unexpected %s\n"
.LC6:
	.string	"unexprcted array end"
.LC7:
	.string	"shipTemplateID"
.LC8:
	.string	"value is not a number\n"
.LC9:
	.string	"hp"
.LC10:
	.string	"water"
.LC11:
	.string	"drag"
.LC12:
	.string	"power"
.LC13:
	.string	"manuver"
.LC14:
	.string	"ap"
.LC15:
	.string	"visibility"
.LC16:
	.string	"name"
.LC17:
	.string	"value is not a string\n"
.LC18:
	.string	"modules"
	.text
	.globl	shipParse
	.type	shipParse, @function
shipParse:
.LFB4:
	.loc 1 112 43
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 1 113 5
	movq	-56(%rbp), %rax
	.loc 1 113 4
	testq	%rax, %rax
	jne	.L14
	.loc 1 113 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-56(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 113 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L14:
	.loc 1 114 5
	movq	-64(%rbp), %rax
	.loc 1 114 4
	testq	%rax, %rax
	jne	.L15
	.loc 1 114 11 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-64(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 114 54 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L15:
	.loc 1 116 22
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_peek@PLT
	movl	%eax, -36(%rbp)
	.loc 1 117 18
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	json_get_string@PLT
	movq	%rax, -32(%rbp)
	.loc 1 118 6
	movb	$1, -38(%rbp)
	.loc 1 119 15
	movq	$0, -24(%rbp)
	.loc 1 120 58
	movl	-36(%rbp), %eax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	json_typename(%rip), %rax
	addq	%rdx, %rax
	.loc 1 120 1
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 123 2
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 125 6
	movb	$0, -37(%rbp)
.L55:
	cmpl	$11, -36(%rbp)
	ja	.L16
	movl	-36(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L18(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L18(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L16-.L18
	.long	.L21-.L18
	.long	.L21-.L18
	.long	.L21-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.long	.L17-.L18
	.long	.L17-.L18
	.long	.L17-.L18
	.text
.L17:
	.loc 1 132 47
	movl	-36(%rbp), %eax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	json_typename(%rip), %rax
	addq	%rdx, %rax
	.loc 1 132 5
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 133 8
	jmp	.L16
.L19:
	.loc 1 135 8
	movb	$1, -37(%rbp)
	.loc 1 136 8
	jmp	.L16
.L21:
	.loc 1 141 5
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 142 8
	jmp	.L16
.L20:
	.loc 1 144 5
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC6(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 145 11
	movl	$1, %eax
	jmp	.L23
.L22:
	.loc 1 147 11
	movl	$0, %eax
	jmp	.L23
.L16:
	.loc 1 148 5
	cmpb	$0, -37(%rbp)
	je	.L24
	.loc 1 149 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	call	strcmp@PLT
	.loc 1 149 6
	testl	%eax, %eax
	jne	.L25
	.loc 1 149 44 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 149 43 discriminator 1
	cmpl	$8, %eax
	jne	.L26
	.loc 1 149 99 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 149 77 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 149 94 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 149 93 discriminator 2
	movl	%edx, 60(%rax)
	.loc 1 149 4 discriminator 2
	jmp	.L27
.L26:
	.loc 1 149 136 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L25:
	.loc 1 150 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	call	strcmp@PLT
	.loc 1 150 6
	testl	%eax, %eax
	jne	.L28
	.loc 1 150 32 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 150 31 discriminator 1
	cmpl	$8, %eax
	jne	.L29
	.loc 1 150 75 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 150 65 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 150 70 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 150 69 discriminator 2
	movl	%edx, 72(%rax)
	.loc 1 150 4 discriminator 2
	jmp	.L27
.L29:
	.loc 1 150 112 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L28:
	.loc 1 151 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	call	strcmp@PLT
	.loc 1 151 6
	testl	%eax, %eax
	jne	.L30
	.loc 1 151 35 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 151 34 discriminator 1
	cmpl	$8, %eax
	jne	.L31
	.loc 1 151 81 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 151 68 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 151 76 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 151 75 discriminator 2
	movl	%edx, 76(%rax)
	.loc 1 151 4 discriminator 2
	jmp	.L27
.L31:
	.loc 1 151 118 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L30:
	.loc 1 152 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	call	strcmp@PLT
	.loc 1 152 6
	testl	%eax, %eax
	jne	.L32
	.loc 1 152 34 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 152 33 discriminator 1
	cmpl	$8, %eax
	jne	.L33
	.loc 1 152 79 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 152 67 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 152 74 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 152 73 discriminator 2
	movl	%edx, 80(%rax)
	.loc 1 152 4 discriminator 2
	jmp	.L27
.L33:
	.loc 1 152 116 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L32:
	.loc 1 153 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	call	strcmp@PLT
	.loc 1 153 6
	testl	%eax, %eax
	jne	.L34
	.loc 1 153 35 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 153 34 discriminator 1
	cmpl	$8, %eax
	jne	.L35
	.loc 1 153 81 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 153 68 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 153 76 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 153 75 discriminator 2
	movl	%edx, 84(%rax)
	.loc 1 153 4 discriminator 2
	jmp	.L27
.L35:
	.loc 1 153 118 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L34:
	.loc 1 154 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rdi
	call	strcmp@PLT
	.loc 1 154 6
	testl	%eax, %eax
	jne	.L36
	.loc 1 154 37 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 154 36 discriminator 1
	cmpl	$8, %eax
	jne	.L37
	.loc 1 154 85 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 154 70 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 154 80 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 154 79 discriminator 2
	movl	%edx, 88(%rax)
	.loc 1 154 4 discriminator 2
	jmp	.L27
.L37:
	.loc 1 154 122 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L36:
	.loc 1 155 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	call	strcmp@PLT
	.loc 1 155 6
	testl	%eax, %eax
	jne	.L38
	.loc 1 155 32 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 155 31 discriminator 1
	cmpl	$8, %eax
	jne	.L39
	.loc 1 155 75 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 155 65 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 155 70 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 155 69 discriminator 2
	movl	%edx, 92(%rax)
	.loc 1 155 4 discriminator 2
	jmp	.L27
.L39:
	.loc 1 155 112 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L38:
	.loc 1 156 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	call	strcmp@PLT
	.loc 1 156 6
	testl	%eax, %eax
	jne	.L40
	.loc 1 156 40 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 156 39 discriminator 1
	cmpl	$8, %eax
	jne	.L41
	.loc 1 156 91 discriminator 2
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 156 73 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 156 86 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 156 85 discriminator 2
	movl	%edx, 100(%rax)
	.loc 1 156 4 discriminator 2
	jmp	.L27
.L41:
	.loc 1 156 128 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC8(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L40:
	.loc 1 157 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rdi
	call	strcmp@PLT
	.loc 1 157 6
	testl	%eax, %eax
	jne	.L42
	.loc 1 157 34 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 157 33 discriminator 1
	cmpl	$7, %eax
	jne	.L43
	.loc 1 157 63 discriminator 2
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	json_get_string@PLT
	movq	%rax, %rcx
	.loc 1 157 75 discriminator 2
	movq	-56(%rbp), %rax
	.loc 1 157 63 discriminator 2
	movq	64(%rax), %rax
	movl	$64, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 157 3 discriminator 2
	jmp	.L27
.L43:
	.loc 1 157 28 discriminator 3
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L42:
	.loc 1 159 7
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rdi
	call	strcmp@PLT
	.loc 1 159 6
	testl	%eax, %eax
	jne	.L24
	.loc 1 159 37 discriminator 1
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 159 36 discriminator 1
	cmpl	$5, %eax
	jne	.L56
	.loc 1 159 78
	jmp	.L45
.L54:
	.loc 1 159 92 discriminator 20
	movb	$0, -37(%rbp)
	cmpl	$11, -36(%rbp)
	ja	.L46
	movl	-36(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L48(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L48(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L48:
	.long	.L46-.L48
	.long	.L50-.L48
	.long	.L50-.L48
	.long	.L51-.L48
	.long	.L50-.L48
	.long	.L47-.L48
	.long	.L49-.L48
	.long	.L47-.L48
	.long	.L47-.L48
	.long	.L47-.L48
	.long	.L47-.L48
	.long	.L47-.L48
	.text
.L47:
	.loc 1 159 127 discriminator 6
	movl	-36(%rbp), %eax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	json_typename(%rip), %rax
	leaq	(%rdx,%rax), %r12
	.loc 1 159 121 discriminator 6
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	movq	%r12, %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 159 3 discriminator 6
	jmp	.L46
.L51:
	.loc 1 159 165 discriminator 5
	movb	$1, -37(%rbp)
	.loc 1 159 3 discriminator 5
	jmp	.L46
.L50:
	.loc 1 159 127 discriminator 4
	movl	-36(%rbp), %eax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	json_typename(%rip), %rax
	leaq	(%rdx,%rax), %r12
	.loc 1 159 67 discriminator 4
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	movq	%r12, %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4561(%rip), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 159 3 discriminator 4
	jmp	.L46
.L49:
	.loc 1 159 172 discriminator 7
	movb	$0, -38(%rbp)
	.loc 1 159 3 discriminator 7
	nop
.L46:
	.loc 1 159 15 discriminator 11
	cmpb	$0, -37(%rbp)
	je	.L52
	.loc 1 159 62 discriminator 12
	movq	-56(%rbp), %rax
	.loc 1 159 34 discriminator 12
	addq	$104, %rax
	movq	%rax, %rdi
	call	arr_append_obj_smodule@PLT
	movq	%rax, -24(%rbp)
	.loc 1 159 76 discriminator 12
	cmpq	$0, -24(%rbp)
	jne	.L53
	.loc 1 159 96 discriminator 14
	movl	$2, %eax
	jmp	.L23
.L53:
	.loc 1 159 101 discriminator 15
	movq	-64(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	smoduleParse@PLT
	.loc 1 159 134 discriminator 15
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_peek@PLT
	.loc 1 159 133 discriminator 15
	cmpl	$3, %eax
	jne	.L52
	.loc 1 159 3 discriminator 16
	jmp	.L45
.L52:
	.loc 1 159 178 discriminator 17
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -36(%rbp)
.L45:
	.loc 1 159 78 discriminator 19
	cmpb	$0, -38(%rbp)
	jne	.L54
.L24:
	.loc 1 162 8
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -36(%rbp)
	jmp	.L55
.L56:
	.loc 1 159 4
	nop
.L27:
	.loc 1 127 3
	jmp	.L55
.L23:
	.loc 1 166 2
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	shipParse, .-shipParse
	.section	.rodata
.LC19:
	.string	"\ndumping obj_ship %p\n"
.LC20:
	.string	"%s %d\n"
.LC21:
	.string	"%s %s\n"
.LC22:
	.string	"view"
.LC23:
	.string	"modules arr at %p:\n"
.LC24:
	.string	"\nEND of obj_ship %p\n"
	.text
	.globl	obj_ship_print
	.type	obj_ship_print, @function
obj_ship_print:
.LFB5:
	.loc 1 168 35
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 169 5
	movq	-24(%rbp), %rax
	.loc 1 169 4
	testq	%rax, %rax
	jne	.L58
	.loc 1 169 15 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4599(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 169 58 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L58:
	.loc 1 170 12
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 171 2
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 172 2
	movq	-8(%rbp), %rax
	movl	60(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC7(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 173 2
	movq	-8(%rbp), %rax
	movq	64(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	%rdx, %rcx
	leaq	.LC16(%rip), %rdx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 174 2
	movq	-8(%rbp), %rax
	movl	72(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC9(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 175 2
	movq	-8(%rbp), %rax
	movl	76(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC10(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 176 2
	movq	-8(%rbp), %rax
	movl	80(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC11(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 177 2
	movq	-8(%rbp), %rax
	movl	88(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC13(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 178 2
	movq	-8(%rbp), %rax
	movl	92(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC14(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 179 2
	movq	-8(%rbp), %rax
	movl	96(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC22(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 180 2
	movq	-8(%rbp), %rax
	movl	100(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC15(%rip), %rdx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 181 46
	movq	-8(%rbp), %rax
	leaq	104(%rax), %rdx
	.loc 1 181 2
	movq	stderr(%rip), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 182 2
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdi
	call	arr_dump_obj_smodule@PLT
	.loc 1 183 2
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 184 8
	movl	$0, %eax
	.loc 1 184 12
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	obj_ship_print, .-obj_ship_print
	.section	.rodata
	.align 16
	.type	__func__.4543, @object
	.size	__func__.4543, 18
__func__.4543:
	.string	"obj_ship_finalize"
	.align 8
	.type	__func__.4547, @object
	.size	__func__.4547, 14
__func__.4547:
	.string	"obj_ship_free"
	.align 8
	.type	__func__.4551, @object
	.size	__func__.4551, 15
__func__.4551:
	.string	"obj_ship_clean"
	.align 8
	.type	__func__.4555, @object
	.size	__func__.4555, 14
__func__.4555:
	.string	"obj_ship_copy"
	.align 8
	.type	__func__.4561, @object
	.size	__func__.4561, 10
__func__.4561:
	.string	"shipParse"
	.align 8
	.type	__func__.4599, @object
	.size	__func__.4599, 15
__func__.4599:
	.string	"obj_ship_print"
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
	.file 11 "submod/pdjson/pdjson.h"
	.file 12 "submod/libctfb/conf.h"
	.file 13 "submod/libctfb/draw.h"
	.file 14 "submod/libctfb/input.h"
	.file 15 "parse.h"
	.file 16 "smodule.h"
	.file 17 "submod/cstl/tmpl/obj.h"
	.file 18 "submod/cstl/tmpl/arr.h"
	.file 19 "ship.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xf02
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
	.uleb128 0x1f
	.long	.LASF165
	.byte	0x1
	.byte	0xa8
	.byte	0x7
	.long	0x6e
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xce9
	.uleb128 0x20
	.long	.LASF167
	.byte	0x1
	.byte	0xa8
	.byte	0x1c
	.long	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	.LASF168
	.long	0xcf9
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4599
	.uleb128 0x1c
	.long	.LASF164
	.byte	0x1
	.byte	0xaa
	.byte	0xc
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.long	0xd5
	.long	0xcf9
	.uleb128 0xe
	.long	0x39
	.byte	0xe
	.byte	0
	.uleb128 0x5
	.long	0xce9
	.uleb128 0x1f
	.long	.LASF166
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.long	0x52
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xd9e
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.byte	0x70
	.byte	0x15
	.long	0xc63
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x22
	.string	"js"
	.byte	0x1
	.byte	0x70
	.byte	0x28
	.long	0xd9e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x21
	.long	.LASF168
	.long	0xdb4
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4561
	.uleb128 0x1c
	.long	.LASF169
	.byte	0x1
	.byte	0x74
	.byte	0x11
	.long	0x375
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x23
	.string	"str"
	.byte	0x1
	.byte	0x75
	.byte	0xe
	.long	0x31a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.long	.LASF170
	.byte	0x1
	.byte	0x76
	.byte	0x6
	.long	0xdb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x1c
	.long	.LASF131
	.byte	0x1
	.byte	0x77
	.byte	0xf
	.long	0x9f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"var"
	.byte	0x1
	.byte	0x7d
	.byte	0x6
	.long	0xdb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x460
	.uleb128 0xd
	.long	0xd5
	.long	0xdb4
	.uleb128 0xe
	.long	0x39
	.byte	0x9
	.byte	0
	.uleb128 0x5
	.long	0xda4
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF171
	.uleb128 0x1f
	.long	.LASF172
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.long	0xc63
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0xe14
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.byte	0x29
	.byte	0x19
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	.LASF168
	.long	0xe24
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4555
	.uleb128 0x23
	.string	"ptr"
	.byte	0x1
	.byte	0x2b
	.byte	0xc
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.long	0xd5
	.long	0xe24
	.uleb128 0xe
	.long	0x39
	.byte	0xd
	.byte	0
	.uleb128 0x5
	.long	0xe14
	.uleb128 0x24
	.long	.LASF173
	.byte	0x1
	.byte	0x23
	.byte	0x1
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xe6a
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.byte	0x23
	.byte	0x1a
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.long	.LASF168
	.long	0xcf9
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4551
	.byte	0
	.uleb128 0x24
	.long	.LASF174
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xeab
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.byte	0x1c
	.byte	0x19
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.long	.LASF168
	.long	0xe24
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4547
	.byte	0
	.uleb128 0x1f
	.long	.LASF175
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0xc63
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0xef0
	.uleb128 0x20
	.long	.LASF164
	.byte	0x1
	.byte	0x4
	.byte	0x1d
	.long	0xc63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.long	.LASF168
	.long	0xf00
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4543
	.byte	0
	.uleb128 0xd
	.long	0xd5
	.long	0xf00
	.uleb128 0xe
	.long	0x39
	.byte	0x11
	.byte	0
	.uleb128 0x5
	.long	0xef0
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x27
	.uleb128 0x19
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
.LASF173:
	.string	"obj_ship_clean"
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
.LASF67:
	.string	"JSON_STRING"
.LASF166:
	.string	"shipParse"
.LASF57:
	.string	"__timezone"
.LASF136:
	.string	"copy"
.LASF69:
	.string	"JSON_TRUE"
.LASF175:
	.string	"obj_ship_finalize"
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
.LASF118:
	.string	"CTFB_NE"
.LASF174:
	.string	"obj_ship_free"
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
.LASF171:
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
.LASF172:
	.string	"obj_ship_copy"
.LASF15:
	.string	"char"
.LASF43:
	.string	"_mode"
.LASF56:
	.string	"__daylight"
.LASF165:
	.string	"obj_ship_print"
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
.LASF89:
	.string	"errmsg"
.LASF10:
	.string	"__int16_t"
.LASF130:
	.string	"json_typename"
.LASF170:
	.string	"arrloop"
.LASF41:
	.string	"_freeres_buf"
.LASF42:
	.string	"__pad5"
.LASF140:
	.string	"smodType"
.LASF167:
	.string	"ap_obj"
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
.LASF164:
	.string	"this"
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
.LASF169:
	.string	"type"
.LASF6:
	.string	"unsigned char"
.LASF55:
	.string	"__tzname"
.LASF21:
	.string	"_IO_write_ptr"
.LASF134:
	.string	"finalize"
.LASF65:
	.string	"JSON_ARRAY"
.LASF38:
	.string	"_codecvt"
.LASF154:
	.string	"obj_ship"
.LASF75:
	.string	"realloc"
.LASF159:
	.string	"power"
.LASF13:
	.string	"__off_t"
.LASF180:
	.string	"json_type"
.LASF8:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF161:
	.string	"view"
.LASF151:
	.string	"usedCapacity"
.LASF168:
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
.LASF177:
	.string	"ship.c"
.LASF90:
	.string	"stream"
	.ident	"GCC: (Gentoo Hardened 9.3.0 p2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
