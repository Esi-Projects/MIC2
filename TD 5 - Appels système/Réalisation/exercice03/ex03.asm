; Exercice 03
	
global _start
	
section .rodata
	endl DB `\n`
	
section .bss
	nbToAscii RESB 1
	
section .text
_start:
	
	nop
	
	mov rsi, 0

	mov sil, 7                   ; une valeur comprise entre 0 et 9
	;cmp rsi, 10
	;jns _end
	
	OR sil, 00110000b

	mov [nbToAscii], sil
	
	mov rax, 1                   
	mov rdi, 1
	mov rsi, nbToAscii
	mov rdx, 1			         ; length du string
	syscall                      ; Appel système write en stdout qui affiche le contenu de rsiToAscii

    mov rax, 1
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1                   ; length du string
	syscall                      ; Appel système write en stdout qui affiche le contenu de rsiToAscii
	
_end:
	mov rax, 60
	mov rdi, 0                   
	syscall
