; 2_ascii_minVersMaj_partiel.asm

global main

section .text
main:
    nop         

    mov al, 'd'  

    mov ah, al 
    and ah, 11011111b ; xor ah, 00100000b                 

    ; fin
    mov rax, 60
    mov rdi, 0
    syscall
                   
