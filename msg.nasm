msg db 'Gaultier begue', 0xa
len equ $-msg

sys_exit equ 1
sys_write equ 4

stdout equ 0
stdin equ 1

section .text
	global _say
	global _start


_say:
	mov edx, len
	mov ecx, msg
	mov ebx, stdout
	mov eax, sys_write
	int 0x80

	mov eax, sys_exit
	int 0x80

_start:
	call _say
