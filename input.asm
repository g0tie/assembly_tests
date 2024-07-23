section .rodata
	question db 'Quel age as-tu', 0x0
	answer db 'You are,'

section .bss
	age resb 3

section .text
	global _start


_print:
	mov rax, 4 ;write syscall
	mov rdi, 1 ;fd stdout
	syscall
	ret


_read:
	mov rax, 0 ;read sycall
	mov rdi, 0 ;fd stdin
	syscall
	ret

_exit:
	mov rax,1
	syscall

_start:
	mov rsi, question
	mov rdx, 15
	call _print

	mov rsi, age
	mov rdx, 3
	call _read

	mov rsi, answer
	mov rdx,9
	call _print

	mov rsi, age
	mov rdx, 3
	call _print

	mov rdi,0
	call _exit

	
