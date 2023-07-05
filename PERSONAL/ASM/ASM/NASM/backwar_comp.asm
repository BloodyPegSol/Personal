
	global _start

	section .text
_start: mov ax,2
	mov bx,3
	mov cx,4

	dump_regs 1

