	.file	"smodule.c"
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
	.globl	obj_smodule_finalize
	.type	obj_smodule_finalize, @function
obj_smodule_finalize:
.LFB0:
	.file 1 "smodule.c"
	.loc 1 4 40
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 5 16
	movq	-8(%rbp), %rax
	leaq	obj_smodule_finalize(%rip), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 6 12
	movq	-8(%rbp), %rax
	leaq	obj_smodule_free(%rip), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 7 13
	movq	-8(%rbp), %rax
	leaq	obj_smodule_clean(%rip), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 8 12
	movq	-8(%rbp), %rax
	leaq	obj_smodule_copy(%rip), %rdx
	movq	%rdx, 32(%rax)
	.loc 1 9 15
	movq	-8(%rbp), %rax
	movq	$96, 48(%rax)
	.loc 1 11 16
	movq	-8(%rbp), %rax
	movl	$0, 60(%rax)
	.loc 1 12 8
	movq	-8(%rbp), %rax
	.loc 1 12 2
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	obj_smodule_finalize, .-obj_smodule_finalize
	.section	.rodata
.LC0:
	.string	"nullpointer error at %s %p"
	.text
	.globl	obj_smodule_free
	.type	obj_smodule_free, @function
obj_smodule_free:
.LFB1:
	.loc 1 15 36
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 16 5
	movq	-8(%rbp), %rax
	.loc 1 16 4
	testq	%rax, %rax
	jne	.L4
	.loc 1 16 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4447(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 16 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L4:
	.loc 1 17 2
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 18 2
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	obj_smodule_free, .-obj_smodule_free
	.section	.rodata
	.align 8
.LC1:
	.string	"placeholder dummy function \"clean\" p=%p\n"
	.text
	.globl	obj_smodule_clean
	.type	obj_smodule_clean, @function
obj_smodule_clean:
.LFB2:
	.loc 1 21 37
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 24 2
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 25 2
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	obj_smodule_clean, .-obj_smodule_clean
	.globl	obj_smodule_copy
	.type	obj_smodule_copy, @function
obj_smodule_copy:
.LFB3:
	.loc 1 30 36
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 30 36
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 31 5
	movq	-24(%rbp), %rax
	.loc 1 31 4
	testq	%rax, %rax
	jne	.L9
	.loc 1 31 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4454(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 31 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L9:
	.loc 1 32 19
	movl	$96, %esi
	movl	$1, %edi
	call	calloc@PLT
	.loc 1 32 15
	movq	%rax, -16(%rbp)
	.loc 1 33 5
	movq	-16(%rbp), %rax
	.loc 1 33 4
	testq	%rax, %rax
	jne	.L10
	.loc 1 33 12 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4454(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 33 55 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L10:
	.loc 1 34 8
	movq	-16(%rbp), %rax
	.loc 1 34 2
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	obj_smodule_copy, .-obj_smodule_copy
	.section	.rodata
.LC2:
	.string	"dumping smodule.h"
.LC3:
	.string	"smodType"
.LC4:
	.string	"%s %d\n"
.LC5:
	.string	"name"
.LC6:
	.string	"%s %s\n"
.LC7:
	.string	"hp"
.LC8:
	.string	"powergen"
.LC9:
	.string	"hitChance"
.LC10:
	.string	"ap"
	.text
	.globl	obj_smodule_print
	.type	obj_smodule_print, @function
obj_smodule_print:
.LFB4:
	.loc 1 39 37
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 40 5
	movq	-8(%rbp), %rax
	.loc 1 40 4
	testq	%rax, %rax
	jne	.L14
	.loc 1 40 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4459(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 40 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L14:
	.loc 1 41 2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
	.loc 1 42 27
	movq	-8(%rbp), %rax
	.loc 1 42 2
	movl	60(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC3(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 43 23
	movq	-8(%rbp), %rax
	.loc 1 43 2
	movq	64(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	%rdx, %rcx
	leaq	.LC5(%rip), %rdx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 44 21
	movq	-8(%rbp), %rax
	.loc 1 44 2
	movl	72(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC7(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 45 27
	movq	-8(%rbp), %rax
	.loc 1 45 2
	movl	76(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC8(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 46 28
	movq	-8(%rbp), %rax
	.loc 1 46 2
	movl	80(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC9(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 47 21
	movq	-8(%rbp), %rax
	.loc 1 47 2
	movl	84(%rax), %edx
	movq	stderr(%rip), %rax
	movl	%edx, %ecx
	leaq	.LC10(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 48 8
	movl	$0, %eax
	.loc 1 48 12
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	obj_smodule_print, .-obj_smodule_print
	.section	.rodata
.LC11:
	.string	"FIRST STRING %s\n"
.LC12:
	.string	"\t yARRLOOP BB %s\n"
.LC13:
	.string	"unexpected JSON ERROR"
	.align 8
.LC14:
	.string	"json parse error in func %s pos %ld %ld unexpected %s\n"
.LC15:
	.string	"unexprcted array end"
.LC16:
	.string	"value is not a number\n"
.LC17:
	.string	"apGen"
.LC18:
	.string	"value is not a string\n"
	.text
	.globl	smoduleParse
	.type	smoduleParse, @function
smoduleParse:
.LFB5:
	.loc 1 53 49
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 54 5
	movq	-40(%rbp), %rax
	.loc 1 54 4
	testq	%rax, %rax
	jne	.L17
	.loc 1 54 13 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-40(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 54 56 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L17:
	.loc 1 55 5
	movq	-48(%rbp), %rax
	.loc 1 55 4
	testq	%rax, %rax
	jne	.L18
	.loc 1 55 11 discriminator 1
	movq	stderr(%rip), %rax
	leaq	-48(%rbp), %rdx
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 55 54 discriminator 1
	movl	$1, %edi
	call	exit@PLT
.L18:
	.loc 1 56 22
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_peek@PLT
	movl	%eax, -28(%rbp)
	.loc 1 57 18
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	json_get_string@PLT
	movq	%rax, -24(%rbp)
	.loc 1 58 6
	movb	$0, -29(%rbp)
	.loc 1 59 2
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L42:
	cmpl	$11, -28(%rbp)
	ja	.L19
	movl	-28(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L21(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L21(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L19-.L21
	.long	.L24-.L21
	.long	.L24-.L21
	.long	.L24-.L21
	.long	.L25-.L21
	.long	.L24-.L21
	.long	.L23-.L21
	.long	.L22-.L21
	.long	.L20-.L21
	.long	.L20-.L21
	.long	.L20-.L21
	.long	.L20-.L21
	.text
.L20:
	.loc 1 66 47
	movl	-28(%rbp), %eax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	json_typename(%rip), %rax
	addq	%rdx, %rax
	.loc 1 66 5
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 67 8
	jmp	.L19
.L22:
	.loc 1 69 8
	movb	$1, -29(%rbp)
	.loc 1 70 8
	jmp	.L19
.L24:
	.loc 1 75 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 76 8
	jmp	.L19
.L23:
	.loc 1 78 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 79 11
	movl	$1, %eax
	jmp	.L26
.L25:
	.loc 1 81 11
	movl	$0, %eax
	jmp	.L26
.L19:
	.loc 1 82 5
	cmpb	$0, -29(%rbp)
	je	.L27
	.loc 1 83 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	call	strcmp@PLT
	.loc 1 83 6
	testl	%eax, %eax
	jne	.L28
	.loc 1 83 38 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 83 37 discriminator 1
	cmpl	$8, %eax
	jne	.L29
	.loc 1 83 87 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 83 71 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 83 82 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 83 81 discriminator 2
	movl	%edx, 60(%rax)
	.loc 1 83 4 discriminator 2
	jmp	.L30
.L29:
	.loc 1 83 124 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L28:
	.loc 1 84 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	call	strcmp@PLT
	.loc 1 84 6
	testl	%eax, %eax
	jne	.L31
	.loc 1 84 32 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 84 31 discriminator 1
	cmpl	$8, %eax
	jne	.L32
	.loc 1 84 75 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 84 65 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 84 70 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 84 69 discriminator 2
	movl	%edx, 72(%rax)
	.loc 1 84 4 discriminator 2
	jmp	.L30
.L32:
	.loc 1 84 112 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L31:
	.loc 1 85 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rdi
	call	strcmp@PLT
	.loc 1 85 6
	testl	%eax, %eax
	jne	.L33
	.loc 1 85 38 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 85 37 discriminator 1
	cmpl	$8, %eax
	jne	.L34
	.loc 1 85 87 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 85 71 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 85 82 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 85 81 discriminator 2
	movl	%edx, 76(%rax)
	.loc 1 85 4 discriminator 2
	jmp	.L30
.L34:
	.loc 1 85 124 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L33:
	.loc 1 86 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	call	strcmp@PLT
	.loc 1 86 6
	testl	%eax, %eax
	jne	.L35
	.loc 1 86 39 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 86 38 discriminator 1
	cmpl	$8, %eax
	jne	.L36
	.loc 1 86 89 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 86 72 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 86 84 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 86 83 discriminator 2
	movl	%edx, 80(%rax)
	.loc 1 86 4 discriminator 2
	jmp	.L30
.L36:
	.loc 1 86 126 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L35:
	.loc 1 87 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	call	strcmp@PLT
	.loc 1 87 6
	testl	%eax, %eax
	jne	.L37
	.loc 1 87 32 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 87 31 discriminator 1
	cmpl	$8, %eax
	jne	.L38
	.loc 1 87 75 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 87 65 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 87 70 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 87 69 discriminator 2
	movl	%edx, 84(%rax)
	.loc 1 87 4 discriminator 2
	jmp	.L30
.L38:
	.loc 1 87 112 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L37:
	.loc 1 88 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	call	strcmp@PLT
	.loc 1 88 6
	testl	%eax, %eax
	jne	.L39
	.loc 1 88 35 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 88 34 discriminator 1
	cmpl	$8, %eax
	jne	.L40
	.loc 1 88 81 discriminator 2
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_number@PLT
	.loc 1 88 68 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 88 76 discriminator 2
	cvttsd2sil	%xmm0, %edx
	.loc 1 88 75 discriminator 2
	movl	%edx, 88(%rax)
	.loc 1 88 4 discriminator 2
	jmp	.L30
.L40:
	.loc 1 88 118 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC16(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L39:
	.loc 1 89 7
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	call	strcmp@PLT
	.loc 1 89 6
	testl	%eax, %eax
	jne	.L27
	.loc 1 89 34 discriminator 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	.loc 1 89 33 discriminator 1
	cmpl	$7, %eax
	jne	.L41
	.loc 1 89 63 discriminator 2
	movq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	json_get_string@PLT
	movq	%rax, %rcx
	.loc 1 89 75 discriminator 2
	movq	-40(%rbp), %rax
	.loc 1 89 63 discriminator 2
	movq	64(%rax), %rax
	movl	$64, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	.loc 1 89 3 discriminator 2
	jmp	.L30
.L41:
	.loc 1 89 28 discriminator 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_position@PLT
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_get_lineno@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC18(%rip), %r9
	movq	%rbx, %r8
	movq	%rdx, %rcx
	leaq	__func__.4464(%rip), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L27:
	.loc 1 92 8
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	json_next@PLT
	movl	%eax, -28(%rbp)
.L30:
	.loc 1 61 3
	jmp	.L42
.L26:
	.loc 1 96 2
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	smoduleParse, .-smoduleParse
	.section	.rodata
	.align 16
	.type	__func__.4447, @object
	.size	__func__.4447, 17
__func__.4447:
	.string	"obj_smodule_free"
	.align 16
	.type	__func__.4454, @object
	.size	__func__.4454, 17
__func__.4454:
	.string	"obj_smodule_copy"
	.align 16
	.type	__func__.4459, @object
	.size	__func__.4459, 18
__func__.4459:
	.string	"obj_smodule_print"
	.align 8
	.type	__func__.4464, @object
	.size	__func__.4464, 13
__func__.4464:
	.string	"smoduleParse"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/types/struct_FILE.h"
	.file 5 "/usr/include/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/bits/stdint-uintn.h"
	.file 8 "/usr/include/time.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "submod/pdjson/pdjson.h"
	.file 11 "submod/libctfb/conf.h"
	.file 12 "submod/libctfb/draw.h"
	.file 13 "submod/libctfb/input.h"
	.file 14 "parse.h"
	.file 15 "smodule.h"
	.file 16 "submod/cstl/tmpl/obj.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc10
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF153
	.byte	0xc
	.long	.LASF154
	.long	.LASF155
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
	.long	.LASF70
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
	.long	.LASF156
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
	.uleb128 0x8
	.byte	0x8
	.long	0xc9
	.uleb128 0xd
	.long	0xbc
	.long	0x318
	.uleb128 0xe
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF53
	.byte	0x8
	.byte	0x9f
	.byte	0xe
	.long	0x308
	.uleb128 0xf
	.long	.LASF54
	.byte	0x8
	.byte	0xa0
	.byte	0xc
	.long	0x52
	.uleb128 0xf
	.long	.LASF55
	.byte	0x8
	.byte	0xa1
	.byte	0x11
	.long	0x59
	.uleb128 0x10
	.long	.LASF56
	.byte	0x9
	.value	0x21f
	.byte	0xf
	.long	0x349
	.uleb128 0x8
	.byte	0x8
	.long	0xbc
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF57
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF58
	.uleb128 0x11
	.long	.LASF157
	.byte	0x7
	.byte	0x4
	.long	0x67
	.byte	0xa
	.byte	0x18
	.byte	0x6
	.long	0x3b2
	.uleb128 0x12
	.long	.LASF59
	.byte	0x1
	.uleb128 0x12
	.long	.LASF60
	.byte	0x2
	.uleb128 0x12
	.long	.LASF61
	.byte	0x3
	.uleb128 0x12
	.long	.LASF62
	.byte	0x4
	.uleb128 0x12
	.long	.LASF63
	.byte	0x5
	.uleb128 0x12
	.long	.LASF64
	.byte	0x6
	.uleb128 0x12
	.long	.LASF65
	.byte	0x7
	.uleb128 0x12
	.long	.LASF66
	.byte	0x8
	.uleb128 0x12
	.long	.LASF67
	.byte	0x9
	.uleb128 0x12
	.long	.LASF68
	.byte	0xa
	.uleb128 0x12
	.long	.LASF69
	.byte	0xb
	.byte	0
	.uleb128 0x9
	.long	.LASF71
	.byte	0x18
	.byte	0xa
	.byte	0x1e
	.byte	0x8
	.long	0x3e7
	.uleb128 0xa
	.long	.LASF72
	.byte	0xa
	.byte	0x1f
	.byte	0xd
	.long	0x3f6
	.byte	0
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.byte	0x20
	.byte	0xd
	.long	0x410
	.byte	0x8
	.uleb128 0xa
	.long	.LASF74
	.byte	0xa
	.byte	0x21
	.byte	0xc
	.long	0x421
	.byte	0x10
	.byte	0
	.uleb128 0x13
	.long	0x6e
	.long	0x3f6
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3e7
	.uleb128 0x13
	.long	0x6e
	.long	0x410
	.uleb128 0x14
	.long	0x6e
	.uleb128 0x14
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3fc
	.uleb128 0x15
	.long	0x421
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x416
	.uleb128 0x2
	.long	.LASF75
	.byte	0xa
	.byte	0x24
	.byte	0xf
	.long	0x433
	.uleb128 0x8
	.byte	0x8
	.long	0x439
	.uleb128 0x13
	.long	0x52
	.long	0x448
	.uleb128 0x14
	.long	0x6e
	.byte	0
	.uleb128 0x2
	.long	.LASF76
	.byte	0xa
	.byte	0x26
	.byte	0x1c
	.long	0x454
	.uleb128 0x16
	.long	.LASF76
	.value	0x110
	.byte	0xa
	.byte	0x5b
	.byte	0x8
	.long	0x4f2
	.uleb128 0xa
	.long	.LASF77
	.byte	0xa
	.byte	0x5c
	.byte	0xc
	.long	0x2d
	.byte	0
	.uleb128 0xa
	.long	.LASF78
	.byte	0xa
	.byte	0x5e
	.byte	0x18
	.long	0x61f
	.byte	0x8
	.uleb128 0xa
	.long	.LASF79
	.byte	0xa
	.byte	0x5f
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF80
	.byte	0xa
	.byte	0x60
	.byte	0xc
	.long	0x2d
	.byte	0x18
	.uleb128 0xa
	.long	.LASF81
	.byte	0xa
	.byte	0x61
	.byte	0x14
	.long	0x35d
	.byte	0x20
	.uleb128 0xa
	.long	.LASF82
	.byte	0xa
	.byte	0x62
	.byte	0xe
	.long	0x67
	.byte	0x24
	.uleb128 0xa
	.long	.LASF83
	.byte	0xa
	.byte	0x68
	.byte	0x7
	.long	0x5e9
	.byte	0x28
	.uleb128 0xa
	.long	.LASF84
	.byte	0xa
	.byte	0x6a
	.byte	0xc
	.long	0x2d
	.byte	0x40
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x6c
	.byte	0x18
	.long	0x58c
	.byte	0x48
	.uleb128 0xa
	.long	.LASF86
	.byte	0xa
	.byte	0x6d
	.byte	0x1b
	.long	0x3b2
	.byte	0x78
	.uleb128 0xa
	.long	.LASF87
	.byte	0xa
	.byte	0x6e
	.byte	0xa
	.long	0x625
	.byte	0x90
	.byte	0
	.uleb128 0x17
	.byte	0x8
	.byte	0xa
	.byte	0x4c
	.byte	0x9
	.long	0x509
	.uleb128 0xa
	.long	.LASF88
	.byte	0xa
	.byte	0x4d
	.byte	0x13
	.long	0x2c2
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x10
	.byte	0xa
	.byte	0x4f
	.byte	0x9
	.long	0x52d
	.uleb128 0xa
	.long	.LASF89
	.byte	0xa
	.byte	0x50
	.byte	0x19
	.long	0x302
	.byte	0
	.uleb128 0xa
	.long	.LASF90
	.byte	0xa
	.byte	0x51
	.byte	0x14
	.long	0x2d
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.byte	0x18
	.byte	0xa
	.byte	0x53
	.byte	0x9
	.long	0x55e
	.uleb128 0x18
	.string	"ptr"
	.byte	0xa
	.byte	0x54
	.byte	0x13
	.long	0x6e
	.byte	0
	.uleb128 0x18
	.string	"get"
	.byte	0xa
	.byte	0x55
	.byte	0x1a
	.long	0x427
	.byte	0x8
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x56
	.byte	0x1a
	.long	0x427
	.byte	0x10
	.byte	0
	.uleb128 0x19
	.byte	0x18
	.byte	0xa
	.byte	0x4b
	.byte	0x5
	.long	0x58c
	.uleb128 0x1a
	.long	.LASF88
	.byte	0xa
	.byte	0x4e
	.byte	0xb
	.long	0x4f2
	.uleb128 0x1a
	.long	.LASF89
	.byte	0xa
	.byte	0x52
	.byte	0xb
	.long	0x509
	.uleb128 0x1a
	.long	.LASF92
	.byte	0xa
	.byte	0x57
	.byte	0xb
	.long	0x52d
	.byte	0
	.uleb128 0x9
	.long	.LASF93
	.byte	0x30
	.byte	0xa
	.byte	0x47
	.byte	0x8
	.long	0x5ce
	.uleb128 0x18
	.string	"get"
	.byte	0xa
	.byte	0x48
	.byte	0xb
	.long	0x5e3
	.byte	0
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.byte	0x49
	.byte	0xb
	.long	0x5e3
	.byte	0x8
	.uleb128 0xa
	.long	.LASF94
	.byte	0xa
	.byte	0x4a
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.uleb128 0xa
	.long	.LASF85
	.byte	0xa
	.byte	0x58
	.byte	0x7
	.long	0x55e
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.long	0x52
	.long	0x5dd
	.uleb128 0x14
	.long	0x5dd
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x58c
	.uleb128 0x8
	.byte	0x8
	.long	0x5ce
	.uleb128 0x17
	.byte	0x18
	.byte	0xa
	.byte	0x64
	.byte	0x5
	.long	0x61a
	.uleb128 0xa
	.long	.LASF95
	.byte	0xa
	.byte	0x65
	.byte	0xf
	.long	0xbc
	.byte	0
	.uleb128 0xa
	.long	.LASF96
	.byte	0xa
	.byte	0x66
	.byte	0x10
	.long	0x2d
	.byte	0x8
	.uleb128 0xa
	.long	.LASF97
	.byte	0xa
	.byte	0x67
	.byte	0x10
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.long	.LASF98
	.uleb128 0x8
	.byte	0x8
	.long	0x61a
	.uleb128 0xd
	.long	0xc2
	.long	0x635
	.uleb128 0xe
	.long	0x39
	.byte	0x7f
	.byte	0
	.uleb128 0x1b
	.long	.LASF99
	.byte	0xb
	.byte	0x13
	.byte	0x10
	.long	0x2fd
	.uleb128 0x9
	.byte	0x3
	.quad	__VERS
	.uleb128 0xd
	.long	0x4d
	.long	0x65b
	.uleb128 0xe
	.long	0x39
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	0x64b
	.uleb128 0x1b
	.long	.LASF100
	.byte	0xc
	.byte	0x6
	.byte	0xf
	.long	0x65b
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARS
	.uleb128 0x1b
	.long	.LASF101
	.byte	0xc
	.byte	0x7
	.byte	0xf
	.long	0x65b
	.uleb128 0x9
	.byte	0x3
	.quad	FRAMECHARSD
	.uleb128 0x1c
	.long	.LASF102
	.byte	0xd
	.byte	0x5
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ESC
	.uleb128 0x1c
	.long	.LASF103
	.byte	0xd
	.byte	0x7
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RET
	.uleb128 0x1c
	.long	.LASF104
	.byte	0xd
	.byte	0xa
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII4_CTRL_D
	.uleb128 0x1c
	.long	.LASF105
	.byte	0xd
	.byte	0xb
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII8_DEL
	.uleb128 0x1c
	.long	.LASF106
	.byte	0xd
	.byte	0xc
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_ASCII21_CTRL_U
	.uleb128 0x1c
	.long	.LASF107
	.byte	0xd
	.byte	0xd
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_BACKSPACE
	.uleb128 0x1c
	.long	.LASF108
	.byte	0xd
	.byte	0x10
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP
	.uleb128 0x1c
	.long	.LASF109
	.byte	0xd
	.byte	0x11
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT
	.uleb128 0x1c
	.long	.LASF110
	.byte	0xd
	.byte	0x12
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT
	.uleb128 0x1c
	.long	.LASF111
	.byte	0xd
	.byte	0x13
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN
	.uleb128 0x1c
	.long	.LASF112
	.byte	0xd
	.byte	0x15
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_UP_SHIFT
	.uleb128 0x1c
	.long	.LASF113
	.byte	0xd
	.byte	0x16
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_LEFT_SHIFT
	.uleb128 0x1c
	.long	.LASF114
	.byte	0xd
	.byte	0x17
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_RIGHT_SHIFT
	.uleb128 0x1c
	.long	.LASF115
	.byte	0xd
	.byte	0x18
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_DOWN_SHIFT
	.uleb128 0x1c
	.long	.LASF116
	.byte	0xd
	.byte	0x1a
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE
	.uleb128 0x1c
	.long	.LASF117
	.byte	0xd
	.byte	0x1b
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE
	.uleb128 0x1c
	.long	.LASF118
	.byte	0xd
	.byte	0x1c
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW
	.uleb128 0x1c
	.long	.LASF119
	.byte	0xd
	.byte	0x1d
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW
	.uleb128 0x1c
	.long	.LASF120
	.byte	0xd
	.byte	0x1f
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NE_SHIFT
	.uleb128 0x1c
	.long	.LASF121
	.byte	0xd
	.byte	0x20
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SE_SHIFT
	.uleb128 0x1c
	.long	.LASF122
	.byte	0xd
	.byte	0x21
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_NW_SHIFT
	.uleb128 0x1c
	.long	.LASF123
	.byte	0xd
	.byte	0x22
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_SW_SHIFT
	.uleb128 0x1c
	.long	.LASF124
	.byte	0xd
	.byte	0x24
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F1
	.uleb128 0x1c
	.long	.LASF125
	.byte	0xd
	.byte	0x25
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F2
	.uleb128 0x1c
	.long	.LASF126
	.byte	0xd
	.byte	0x26
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F3
	.uleb128 0x1c
	.long	.LASF127
	.byte	0xd
	.byte	0x27
	.byte	0x16
	.long	0x2ec
	.uleb128 0x9
	.byte	0x3
	.quad	CTFB_F4
	.uleb128 0xd
	.long	0xc9
	.long	0x8de
	.uleb128 0xe
	.long	0x39
	.byte	0xb
	.uleb128 0xe
	.long	0x39
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	0x8c8
	.uleb128 0x1b
	.long	.LASF128
	.byte	0xe
	.byte	0x6
	.byte	0xc
	.long	0x8de
	.uleb128 0x9
	.byte	0x3
	.quad	json_typename
	.uleb128 0x2
	.long	.LASF129
	.byte	0xf
	.byte	0x7
	.byte	0x18
	.long	0x905
	.uleb128 0x9
	.long	.LASF130
	.byte	0x60
	.byte	0xf
	.byte	0x8
	.byte	0x8
	.long	0x9d4
	.uleb128 0xa
	.long	.LASF131
	.byte	0x10
	.byte	0x2
	.byte	0x11
	.long	0x9e5
	.byte	0
	.uleb128 0xa
	.long	.LASF132
	.byte	0x10
	.byte	0x3
	.byte	0x11
	.long	0x9e5
	.byte	0x8
	.uleb128 0xa
	.long	.LASF74
	.byte	0x10
	.byte	0x4
	.byte	0x9
	.long	0x9f6
	.byte	0x10
	.uleb128 0xa
	.long	.LASF133
	.byte	0x10
	.byte	0x5
	.byte	0x9
	.long	0x9f6
	.byte	0x18
	.uleb128 0xa
	.long	.LASF134
	.byte	0x10
	.byte	0x6
	.byte	0x11
	.long	0xa0b
	.byte	0x20
	.uleb128 0xa
	.long	.LASF135
	.byte	0x10
	.byte	0x7
	.byte	0x11
	.long	0xa0b
	.byte	0x28
	.uleb128 0xa
	.long	.LASF136
	.byte	0x10
	.byte	0x8
	.byte	0x9
	.long	0x2d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF137
	.byte	0x10
	.byte	0x9
	.byte	0xb
	.long	0x2f1
	.byte	0x38
	.uleb128 0xa
	.long	.LASF138
	.byte	0xf
	.byte	0x10
	.byte	0x6
	.long	0x52
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF139
	.byte	0xf
	.byte	0x11
	.byte	0x8
	.long	0xbc
	.byte	0x40
	.uleb128 0x18
	.string	"hp"
	.byte	0xf
	.byte	0x12
	.byte	0x6
	.long	0x52
	.byte	0x48
	.uleb128 0xa
	.long	.LASF140
	.byte	0xf
	.byte	0x13
	.byte	0x6
	.long	0x52
	.byte	0x4c
	.uleb128 0xa
	.long	.LASF141
	.byte	0xf
	.byte	0x14
	.byte	0x6
	.long	0x52
	.byte	0x50
	.uleb128 0x18
	.string	"ap"
	.byte	0xf
	.byte	0x15
	.byte	0x6
	.long	0x52
	.byte	0x54
	.uleb128 0xa
	.long	.LASF142
	.byte	0xf
	.byte	0x16
	.byte	0x6
	.long	0x52
	.byte	0x58
	.byte	0
	.uleb128 0x1d
	.long	0x9df
	.long	0x9df
	.uleb128 0x1e
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x8f9
	.uleb128 0x8
	.byte	0x8
	.long	0x9d4
	.uleb128 0x15
	.long	0x9f6
	.uleb128 0x14
	.long	0x9df
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x9eb
	.uleb128 0x13
	.long	0x9df
	.long	0xa0b
	.uleb128 0x14
	.long	0x9df
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x9fc
	.uleb128 0x1f
	.long	.LASF146
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	0x52
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xa91
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0x35
	.byte	0x1b
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x21
	.string	"js"
	.byte	0x1
	.byte	0x35
	.byte	0x2e
	.long	0xa91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF148
	.long	0xaa7
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4464
	.uleb128 0x1c
	.long	.LASF144
	.byte	0x1
	.byte	0x38
	.byte	0x11
	.long	0x35d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x23
	.string	"str"
	.byte	0x1
	.byte	0x39
	.byte	0xe
	.long	0x302
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"var"
	.byte	0x1
	.byte	0x3a
	.byte	0x6
	.long	0xaac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x448
	.uleb128 0xd
	.long	0xc9
	.long	0xaa7
	.uleb128 0xe
	.long	0x39
	.byte	0xc
	.byte	0
	.uleb128 0x5
	.long	0xa97
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF145
	.uleb128 0x1f
	.long	.LASF147
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0x9df
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xaf8
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0x27
	.byte	0x20
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF148
	.long	0xb08
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4459
	.byte	0
	.uleb128 0xd
	.long	0xc9
	.long	0xb08
	.uleb128 0xe
	.long	0x39
	.byte	0x11
	.byte	0
	.uleb128 0x5
	.long	0xaf8
	.uleb128 0x1f
	.long	.LASF149
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.long	0x9df
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0xb61
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0x1e
	.byte	0x1f
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF148
	.long	0xb71
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4454
	.uleb128 0x23
	.string	"ptr"
	.byte	0x1
	.byte	0x20
	.byte	0xf
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xd
	.long	0xc9
	.long	0xb71
	.uleb128 0xe
	.long	0x39
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.long	0xb61
	.uleb128 0x24
	.long	.LASF150
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xba4
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0x15
	.byte	0x20
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	.LASF151
	.byte	0x1
	.byte	0xf
	.byte	0x1
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe5
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0xf
	.byte	0x1f
	.long	0x9df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF148
	.long	0xb71
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4447
	.byte	0
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x9df
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.long	.LASF143
	.byte	0x1
	.byte	0x4
	.byte	0x23
	.long	0x9df
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
	.uleb128 0x25
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
	.uleb128 0x2117
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
.LASF135:
	.string	"copyDeep"
.LASF76:
	.string	"json_stream"
.LASF34:
	.string	"_shortbuf"
.LASF156:
	.string	"_IO_lock_t"
.LASF71:
	.string	"json_allocator"
.LASF50:
	.string	"stderr"
.LASF23:
	.string	"_IO_buf_end"
.LASF82:
	.string	"flags"
.LASF112:
	.string	"CTFB_UP_SHIFT"
.LASF89:
	.string	"buffer"
.LASF61:
	.string	"JSON_OBJECT"
.LASF21:
	.string	"_IO_write_end"
.LASF5:
	.string	"unsigned int"
.LASF81:
	.string	"next"
.LASF39:
	.string	"_freeres_list"
.LASF110:
	.string	"CTFB_RIGHT"
.LASF15:
	.string	"_flags"
.LASF107:
	.string	"CTFB_BACKSPACE"
.LASF1:
	.string	"wchar_t"
.LASF68:
	.string	"JSON_FALSE"
.LASF27:
	.string	"_markers"
.LASF77:
	.string	"lineno"
.LASF122:
	.string	"CTFB_NW_SHIFT"
.LASF105:
	.string	"CTFB_ASCII8_DEL"
.LASF79:
	.string	"stack_top"
.LASF65:
	.string	"JSON_STRING"
.LASF55:
	.string	"__timezone"
.LASF134:
	.string	"copy"
.LASF67:
	.string	"JSON_TRUE"
.LASF49:
	.string	"stdout"
.LASF121:
	.string	"CTFB_SE_SHIFT"
.LASF26:
	.string	"_IO_save_end"
.LASF100:
	.string	"FRAMECHARS"
.LASF141:
	.string	"hitChance"
.LASF57:
	.string	"float"
.LASF46:
	.string	"_IO_codecvt"
.LASF72:
	.string	"malloc"
.LASF140:
	.string	"powergen"
.LASF130:
	.string	"smodule"
.LASF123:
	.string	"CTFB_SW_SHIFT"
.LASF84:
	.string	"ntokens"
.LASF11:
	.string	"__uint16_t"
.LASF153:
	.string	"GNU C99 9.3.0 -mtune=generic -march=x86-64 -g -std=c99 -fpie"
.LASF25:
	.string	"_IO_backup_base"
.LASF36:
	.string	"_offset"
.LASF133:
	.string	"clean"
.LASF29:
	.string	"_fileno"
.LASF116:
	.string	"CTFB_NE"
.LASF60:
	.string	"JSON_DONE"
.LASF92:
	.string	"user"
.LASF0:
	.string	"size_t"
.LASF118:
	.string	"CTFB_NW"
.LASF99:
	.string	"__VERS"
.LASF101:
	.string	"FRAMECHARSD"
.LASF69:
	.string	"JSON_NULL"
.LASF18:
	.string	"_IO_read_base"
.LASF145:
	.string	"_Bool"
.LASF48:
	.string	"stdin"
.LASF74:
	.string	"free"
.LASF136:
	.string	"objSize"
.LASF95:
	.string	"string"
.LASF59:
	.string	"JSON_ERROR"
.LASF150:
	.string	"obj_smodule_clean"
.LASF14:
	.string	"char"
.LASF42:
	.string	"_mode"
.LASF54:
	.string	"__daylight"
.LASF45:
	.string	"_IO_marker"
.LASF16:
	.string	"_IO_read_ptr"
.LASF120:
	.string	"CTFB_NE_SHIFT"
.LASF83:
	.string	"data"
.LASF98:
	.string	"json_stack"
.LASF129:
	.string	"obj_smodule"
.LASF137:
	.string	"objName"
.LASF115:
	.string	"CTFB_DOWN_SHIFT"
.LASF51:
	.string	"uint8_t"
.LASF66:
	.string	"JSON_NUMBER"
.LASF146:
	.string	"smoduleParse"
.LASF103:
	.string	"CTFB_RET"
.LASF19:
	.string	"_IO_write_base"
.LASF4:
	.string	"long long int"
.LASF109:
	.string	"CTFB_LEFT"
.LASF24:
	.string	"_IO_save_base"
.LASF104:
	.string	"CTFB_ASCII4_CTRL_D"
.LASF87:
	.string	"errmsg"
.LASF128:
	.string	"json_typename"
.LASF40:
	.string	"_freeres_buf"
.LASF41:
	.string	"__pad5"
.LASF138:
	.string	"smodType"
.LASF33:
	.string	"_vtable_offset"
.LASF64:
	.string	"JSON_ARRAY_END"
.LASF155:
	.string	"/home/adip/git/bshc"
.LASF113:
	.string	"CTFB_LEFT_SHIFT"
.LASF96:
	.string	"string_fill"
.LASF52:
	.string	"uint16_t"
.LASF117:
	.string	"CTFB_SE"
.LASF143:
	.string	"this"
.LASF149:
	.string	"obj_smodule_copy"
.LASF119:
	.string	"CTFB_SW"
.LASF142:
	.string	"apGen"
.LASF17:
	.string	"_IO_read_end"
.LASF86:
	.string	"alloc"
.LASF10:
	.string	"short int"
.LASF3:
	.string	"long int"
.LASF90:
	.string	"length"
.LASF47:
	.string	"_IO_wide_data"
.LASF154:
	.string	"smodule.c"
.LASF56:
	.string	"__environ"
.LASF62:
	.string	"JSON_OBJECT_END"
.LASF9:
	.string	"__uint8_t"
.LASF85:
	.string	"source"
.LASF139:
	.string	"name"
.LASF93:
	.string	"json_source"
.LASF124:
	.string	"CTFB_F1"
.LASF125:
	.string	"CTFB_F2"
.LASF78:
	.string	"stack"
.LASF127:
	.string	"CTFB_F4"
.LASF114:
	.string	"CTFB_RIGHT_SHIFT"
.LASF38:
	.string	"_wide_data"
.LASF108:
	.string	"CTFB_UP"
.LASF147:
	.string	"obj_smodule_print"
.LASF131:
	.string	"init"
.LASF35:
	.string	"_lock"
.LASF152:
	.string	"obj_smodule_finalize"
.LASF2:
	.string	"long unsigned int"
.LASF102:
	.string	"CTFB_ESC"
.LASF106:
	.string	"CTFB_ASCII21_CTRL_U"
.LASF31:
	.string	"_old_offset"
.LASF70:
	.string	"_IO_FILE"
.LASF151:
	.string	"obj_smodule_free"
.LASF144:
	.string	"type"
.LASF6:
	.string	"unsigned char"
.LASF53:
	.string	"__tzname"
.LASF20:
	.string	"_IO_write_ptr"
.LASF132:
	.string	"finalize"
.LASF63:
	.string	"JSON_ARRAY"
.LASF37:
	.string	"_codecvt"
.LASF73:
	.string	"realloc"
.LASF12:
	.string	"__off_t"
.LASF157:
	.string	"json_type"
.LASF8:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF148:
	.string	"__func__"
.LASF126:
	.string	"CTFB_F3"
.LASF58:
	.string	"double"
.LASF80:
	.string	"stack_size"
.LASF28:
	.string	"_chain"
.LASF111:
	.string	"CTFB_DOWN"
.LASF44:
	.string	"FILE"
.LASF30:
	.string	"_flags2"
.LASF97:
	.string	"string_size"
.LASF75:
	.string	"json_user_io"
.LASF91:
	.string	"peek"
.LASF32:
	.string	"_cur_column"
.LASF94:
	.string	"position"
.LASF13:
	.string	"__off64_t"
.LASF43:
	.string	"_unused2"
.LASF22:
	.string	"_IO_buf_base"
.LASF88:
	.string	"stream"
	.ident	"GCC: (Gentoo Hardened 9.3.0 p2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
