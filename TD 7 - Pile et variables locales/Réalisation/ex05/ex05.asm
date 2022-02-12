;Exercice 05
;PROBLEME COMMENT MODIFIER LES BITS ET PAS LES BYTE
global _start
    count DB 2

section .text
_start:

    nop

    mov rdi, 49
    
    push rbp; Je sauve l'ancien contenu de rbp
    mov rbp, rsp; Je recupere le stack pointer et le mets dans rbp
 
    ;sub rsp, 8; Je crée un trou pour pouvoir stocké mes variables globales

    push qword 0

    _if:
        bt rdi, 0
        jc _odd
        _even:
            OR byte [rbp - 1], 0000_0001b
            jmp _endIf

        _odd:
            OR byte [rbp - 1], 0000_0000b
    _endIf:

    mov r8, 0
    mov r9, 0
    _for:
        cmp r8, 64
        jz _endFor

        _if2:
            bt rdi, r8
            jc _bitOdd
        _bitEven:           
            jmp _endIf2
        _bitOdd:
            inc r9
        _endIf2:

        inc r8
        jmp _for
    _endFor:

    _if3:
        bt r9, 0
        jc _odd3
        _even3:
            OR byte [rbp - 8], 1000_0000b
            jmp _endIf3

        _odd3:
            OR byte [rbp - 8], 0000_0000b
    _endIf3:


    ;_for2:
    ;    cmp byte [count], 62
    ;    jz _endFor2

    ;    mov byte [rbp - [count] * 1], 0


    ;    inc byte [count]
    ;    jmp _for2
    ;_endFor2:


    
    
    ;Je reinitialise rsp et rbp avec leur valeur initiales
    mov rsp, rbp 
    pop rbp

    mov rax, 60
    mov rdi, 0
    syscall