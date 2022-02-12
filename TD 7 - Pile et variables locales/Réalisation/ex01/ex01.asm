;Exercice 01

global _start

section .text
_start:

    nop

    mov rax, 10
    mov rbx, 20

    push rax;Je push rax dans la pile
    push rbx;Je push rbx dans la pile

    pop rax;Je pop le contenu de rbx de la pile dans rax
    pop rbx;Je pop le contenu de rax de la pile dans rbx

    mov rax, 60
    mov rdi, 0
    syscall
