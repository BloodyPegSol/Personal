%include "./linux-ex/asm_io.inc"

	
section .text
	global _start
_start:	mov	rax, 1
	mov	rdi, 1
	mov	rsi, message
	mov	rdx, 13
	syscall
	mov	rax, 60
	xor 	rdi, rdi
	dump_regs 1
	syscall

section	.data
message:db	"Hello, World", 10
