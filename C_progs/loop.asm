section .data
    msg db 'Gaultier', 0  ; Null-terminated string
    newline db 0xa        ; Newline character

section .bss
	counter resb 1

section .text
    global _start

_start:
	mov rsi, msg
	mov byte [counter], 0

	call _loop
	call _exit	


_loop:
	cmp byte [counter], 8
	jge _exit
	
	call _print
	mov rsi, newline
	call _print

	mov rsi, msg
	
	
	inc byte [counter]
	movzx rax, byte [counter]

	add rsi, rax
	jmp _loop

_exit:
	mov rax, 60 ;exit
	xor rdi, rdi
	syscall


_print:
	mov rax, 1 ; syscall write
	mov rdx, 1 ;length
	mov rdi, 1 ;stdout
	syscall
	ret
