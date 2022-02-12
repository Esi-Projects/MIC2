;Exercice 07

global _start

section .data

section .bss
    asciiNb RESB 1 ; variable représentant les nombres ds la table Ascii
    newLine RESB 1 ; variable représentant le passage à la ligne ds la table Ascii

section .text
_start:

    nop
    
    mov rdi, 1
    mov rdx, 1
    
    mov byte [asciiNb], 48; init la var asciiNb avec 48
    mov byte [newLine], `\n`; init la var newLine avec la valeur de passage à la ligne `\n`
    	
    mov r8, 0
    _for:
	cmp r8, 10
	jz _endFor

	; Affiche la variable ascciiNb représentant les nombres ds la table Ascii
	mov rax, 1
    	mov rsi, asciiNb    	
    	syscall
    	
    	; Affiche un passage à la ligne
    	mov rax, 1
    	mov rsi, newLine   	
    	syscall
	
	inc byte [asciiNb]; incrémente la variable asciiNb
	inc r8
	jmp _for
    _endFor:

    mov rax, 60
    mov rdi, 0
    syscall
