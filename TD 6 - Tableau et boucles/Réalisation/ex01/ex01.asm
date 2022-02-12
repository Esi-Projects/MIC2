;Exercice 01

global _start

section .data
    array times 10 DW 0	; déclare un tableau de 10 entiers de 2 bytes chacun initialisés à 0
    ;0x00 00 00 00 00 00 00 00 00 00

    sizeArray DB $ - array

section .text
_start:

    nop

    mov rax, 2
    mov word [array + rax * 2], 3; assigne la valeur 3 à son 3e élément
	
    mov rax, 7
    mov word [array + rax * 2], 8; assigne la valeur 8 à son 8e élément

    mov rax, 60
    mov rdi, 0
    syscall
