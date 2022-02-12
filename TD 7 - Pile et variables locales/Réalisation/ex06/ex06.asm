;Exercice 6

global _start

section .data
    char DB 0

section .rodata
    fileName DB `loremipsum.txt`, 0      

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
    	
    ;Lecture/Ecriture du fichier dans la sortie standard
    mov r8, 0
    
    push rbp
    mov rbp, rsp

    sub rsp, 3 * 4; le nombre de compteur * la taille
    mov dword [rbp - 1 * 4], 0
    mov dword [rbp - 2 * 4], 0
    mov dword [rbp - 3 * 4], 0

    ;file descriptor en local
    push qword 0
    ;l_seek
    mov qword[rbp - 1 * 8 + 12], rax           ; Récuperation du file descriptor
	;mov [fd], rax

    ;récupération de la taille du fichier
    mov rax, 8
    mov rdi, [rbp - 1 * 8 + 12]; [fd]
    mov rsi, 0
    mov rdx, 2
    syscall
	
    mov [fileSize], rax 

    ;mov r8, 0
    ;mov r9, 0
    ;mov r10, 0
    ;mov r12, 0
    _for:
	    cmp r8, [fileSize]; check si r8 est = à taille du fichier
	    jz _endFor; si oui sort de la boucle sinon continue
	
	
	;l_seek met le cursor a la position d'indice r8 
    	mov rax, 8
    	mov rdi, [rbp - 1 * 8 + 12]; [fd]
    	mov rsi, r8
    	mov rdx, 0
    	syscall
    	
	;Lecture du fichier
	    mov rax, 0
	    mov rdi, [rbp - 1 * 8 + 12]; [fd]
	    mov rsi, char
	    mov rdx, 1
	    syscall
    	
	;Check si Majuscule, minuscule ou caractères spécial
        _if:
            cmp byte [char], 'A'; le char est plus petit que A
            js _notMinNotMaj

                _ifMaj:;le char est plus grand que Z
                    cmp byte [char], '[';'Z'
                    jns _endIfMaj

                    inc dword [rbp - 1 * 4];inc r9
                    jmp _endIf
                _endIfMaj:

                _ifMin:; le char est plus petit que a
                    cmp byte [char], 'a'
                    js _notMinNotMaj

                    _ifMin2:; le char est plus grand que z
                        cmp byte [char], '{';'z'
                        jns _notMinNotMaj

                        inc dword [rbp - 2 * 4];inc r10
                        jmp _endIf
                    _endIfMin2:

                _endIfMin:    
	    
            _notMinNotMaj:
                inc dword [rbp - 3 * 4];inc r12
        _endIf:
	
	    inc r8; incrémente r8 à chaque iteration
	    jmp _for
    _endFor:
    
    ;close
    mov rax, 3
    mov rdi, fileName
    syscall

    ;Je reinitialise rsp et rbp avec leur valeur initiales
    mov rsp, rbp
    pop rbp

    mov rax, 60
    mov rdi, 0
    syscall
