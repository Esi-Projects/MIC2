;Exercice 02

global _start

section .data
    var1 DQ 10
    var2 DQ 20

section .text
_start:

    nop

    push qword [var1];Je push var1 dans la pile
    push qword [var2];Je push var2 dans la pile

    pop qword [var1];Je pop le contenu de var2 de la pile dans var1
    pop qword [var2];Je pop le contenu de var1 de la pile dans var2

    mov rax, 60
    mov rdi, 0
    syscall
