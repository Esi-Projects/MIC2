;Exercice 04

global _start

section .text
_start:

    nop
    
    push rbp; Je sauve l'ancien contenu de rbp
    mov rbp, rsp; Je recupere le stack pointer et le mets dans rbp


    sub rsp, 12; Je crée un trou pour pouvoir stocké mes variables globales


    mov byte [rbp - 1], '0'
    mov byte [rbp - 2], '1'
    mov byte [rbp - 3], '2'
    mov byte [rbp - 4], '3'
    mov byte [rbp - 5], '4'
    mov byte [rbp - 6], '5'
    mov byte [rbp - 7], '6'
    mov byte [rbp - 8], '7'
    mov byte [rbp - 9], '8'
    mov byte [rbp - 10], '9'
    mov byte [rbp - 11], 10

    mov byte [rbp - 12], ' '

    mov r9, 11
    mov r8, 1
    for2:
        cmp r8, r9
        jz _endFor2

        ;print variable locale une a une
        mov rax, 1
        mov rdi, 1
        mov rsi, rbp
        sub rsi, r8
        mov rdx, 1
        syscall

        ;print Espace (' ')
        mov rax, 1
        mov rdi, 1
        mov rsi, rbp
        sub rsi, 12
        mov rdx, 1
        syscall
        
        inc r8
        jmp for2

    _endFor2:


    ;Je reinitialise rsp et rbp avec leur valeur initiales
    mov rsp, rbp 
    pop rbp

    mov rax, 60
    mov rdi, 0
    syscall