	; Exercice 05
	
global _start
	
section .rodata
	evenFile DB `pair`, 0
	evenMsg DB `pair\n`
	lengthMsg1 DQ lengthMsg1 - evenMsg
	
	oddFile DB `impair`, 0
	oddMsg DB `impair\n`
	lengthMsg2 DQ lengthMsg2 - oddMsg
	
section .bss
	fd RESQ 1
	
section .text
_start:
	
	nop
	
	mov rax, 11
	
	bt rax, 0
	jc _odd
_even:
	mov rax, 2
	mov rdi, evenFile
	mov rsi, 1q
	syscall                      ; Ouverture du fichier "Pair" en écriture
	
	mov [fd], rax
	
	mov rax, 1
	mov rdi, [fd]                ; Donner le descripteur de fichier dans rdi
	mov rsi, evenMsg
	mov rdx, [lengthMsg1]        ; Donner la taille du message dans rdx
	syscall                      ; Ecrire le msg donné dans rsi dans le fichier donné par le descripteur de fichier se trouvant dans rdi
	
	jmp _end
	
_odd:
	mov rax, 2
	mov rdi, oddFile
	mov rsi, 1q
	syscall                      ; Ouverture du fichier "Impair" en écriture
	
	mov [fd], rax
	
	mov rax, 1
	mov rdi, [fd]                ; Donner le descripteur de fichier dans rdi
	mov rsi, oddMsg
	mov rdx, [lengthMsg2]        ; Donner la taille du message dans rdx
	syscall                      ; Ecrire le msg donné dans rsi dans le fichier donné par le descripteur de fichier se trouvant dans rdi
	
	jmp _end
	
_end:
	mov rax, 3
	mov rdi, [fd]                ; donner par la commande mov, rdi xxxFile avant chaque jump end
	syscall                      ; Fermeture du fichier
	
	mov rax, 60
	mov rdi, 0
	syscall
