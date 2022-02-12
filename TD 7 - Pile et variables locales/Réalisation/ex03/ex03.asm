;Exercice 03

global _start

section .text
_start:

    nop
    
    push rbp; Je sauve l'ancien contenu de rbp
    mov rbp, rsp; Je recupere le stack pointer et le mets dans rbp
 
    sub rsp, 2; Je crée un trou pour pouvoir stocké mes variables globales
    mov byte [rbp - 1], 9; créer une variable local comprise entre [0-9]
    add byte [rbp - 1], '0'; Je transforme le contenu de la variable local en ascii

    mov byte [rbp - 2], 10; Je mets \n dans ma deuxieme variable local

    mov rax, 1
    mov rdi, 1
    mov rsi, rbp
    sub rsi, 1
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, rbp
    sub rsi, 2
    mov rdx, 1
    syscall
    
    ;Je reinitialise rsp et rbp avec leur valeur initiales
    mov rsp, rbp 
    pop rbp

    mov rax, 60
    mov rdi, 0
    syscall