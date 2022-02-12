;Exercice 08

global _start

section .rodata
  digits DB `0123456789\n`

section .text
_start:

    nop
    
    mov rdi, 1; stdout
    mov rdx, 1; nombre de byte à ecrire
    	
    mov r8, 0
    _for:
	cmp r8, 10; check si r8 est = à 10 
	jz _endFor; si oui sort de la boucle sinon continue
	
	;Affiche l'element à la position r8 du tableau de byte digits.
	mov rax, 1
    	mov rsi, digits
    	add rsi, r8    	
    	syscall
    	
    	;Affiche l'element à la position 10 du tableau de byte digits.
    	mov rax, 1
    	mov rsi, digits
    	add rsi, 10  	
    	syscall
	
	inc r8; incrémente r8 à chaque iteration
	jmp _for
    _endFor:

    mov rax, 60
    mov rdi, 0
    syscall
