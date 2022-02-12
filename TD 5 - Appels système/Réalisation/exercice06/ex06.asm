;Exercice 06

global _start

section .rodata
	fileName DB `brol`, 0      

section .bss
    fd RESQ 1
    fileSize RESQ 1

section .text
_start:

	nop

;open
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0q
    syscall                 ; Essaie d'ouvrir le fichier

;l_seek
    mov [fd], rax           ; Récuperation du file descriptor
	
    mov rax, 8
    mov rdi, [fd]
    mov rsi, 0
    mov rdx, 2
    syscall
	
    mov [fileSize], rax

;close
    mov rax, 3
    mov rdi, nomFichier
    syscall

;exit
	mov rax, 60
	mov rdi, 0
	syscall
