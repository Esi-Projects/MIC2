;Exercice 11

global _start

section .data
    char DB 0

section .rodata
    fileName DB `brol`, 0 
    fileName2 DB `brol2`, 0        

section .bss
    fd RESQ 1
    fd2 RESQ 1
    fileSize RESQ 1

section .text
_start:

    nop
    
    ; open file
    mov rax, 2
    mov rdi, fileName
    mov rsi, 1q | 2000q 
    syscall                 ; Essaie d'ouvrir le fichier 1
    
    mov [fd], rax           ; Récuperation du file descriptor du fichier 1

    ; open file2
    mov rax, 2
    mov rdi, fileName2
    mov rsi, 0q
    syscall         ; Essaie d'ouvrir le fichier 2

    mov [fd2], rax ; Récuperation du file descriptor du fichier 2

    ; l_seek récupération de la taille du fichier 2
    mov rax, 8
    mov rdi, [fd2]
    mov rsi, 0
    mov rdx, 2
    syscall
	
    mov [fileSize], rax 
    	
    ; Lecture/Ecriture du fichier 2 dans le fichier 1
    mov r8, 0
    _for:
	cmp r8, [fileSize]; check si r8 est = à taille du fichier 2
	jz _endFor; si oui sort de la boucle sinon continue
	
	
	; l_seek met le cursor a la position d'indice r8  dans le fichier 2
    	mov rax, 8
    	mov rdi, [fd2]
    	mov rsi, r8
    	mov rdx, 0
    	syscall
    	
	; Lecture du fichier 2 stockage du res dans char
	mov rax, 0
	mov rdi, [fd2]
	mov rsi, char
	mov rdx, 1
	syscall
    	
	; ecrit char dans fichier 1 
	mov rax, 1
	mov rdi, [fd]; file descriptor du fichier 1
    	mov rsi, char 
        mov rdx, 1; nombre de byte à ecrire  	
    	syscall
	
	inc r8; incrémente r8 à chaque iteration
	jmp _for
    _endFor:
    
    ;close file 1
    mov rax, 3
    mov rdi, fileName
    syscall
    
    ;close file 2
    mov rax, 3
    mov rdi, fileName2
    syscall

    ;exit 
    mov rax, 60
    mov rdi, 0
    syscall
