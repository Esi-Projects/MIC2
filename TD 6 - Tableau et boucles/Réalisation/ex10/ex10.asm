;Exercice 10

global _start

section .data
    char DB 0

section .rodata
    fileName DB `brol`, 0      

section .bss
    fd RESQ 1
    fileSize RESQ 1

section .text
_start:

    nop
    
    ;open file
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0q
    syscall                 ; Essaie d'ouvrir le fichier
    
    ;l_seek
    mov [fd], rax           ; Récuperation du file descriptor
	
    ;récupération de la taille du fichier
    mov rax, 8
    mov rdi, [fd]
    mov rsi, 0
    mov rdx, 2
    syscall
	
    mov [fileSize], rax 
    	
    ;Lecture/Ecriture du fichier dans la sortie standard
    mov r8, 0
    _for:
	cmp r8, [fileSize]; check si r8 est = à taille du fichier
	jz _endFor; si oui sort de la boucle sinon continue
	
	
	;l_seek met le cursor a la position d'indice r8 
    	mov rax, 8
    	mov rdi, [fd]
    	mov rsi, r8
    	mov rdx, 0
    	syscall
    	
	;Lecture du fichier
	mov rax, 0
	mov rdi, [fd]
	mov rsi, char
	mov rdx, 1
	syscall
    	
	;Affiche char
	mov rax, 1
	mov rdi, 1; stdout
    	mov rsi, char 
        mov rdx, 1; nombre de byte à ecrire  	
    	syscall
	
	inc r8; incrémente r8 à chaque iteration
	jmp _for
    _endFor:
    
    ;close
    mov rax, 3
    mov rdi, fileName
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
