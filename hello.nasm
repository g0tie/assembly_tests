msg db 'Hello Here !', 0x0
len equ $-msg


section .text
	global _start


_start:
	mov edx, len
	mov ecx, msg
	mov ebx, 0 ;stdout
	mov eax, 4 ;write syscall
	int 0x80

	mov eax, 1 ;exit syscall
	int 0x80


