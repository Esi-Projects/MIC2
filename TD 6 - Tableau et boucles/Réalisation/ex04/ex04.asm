;Exercice 04

global _start

section .data
    array times 100 DQ 0; déclare un tableau de 100 entiers de 8 bytes chacun initialisés à 0
    sizeArray DQ $ - array
    nbElement DQ (sizeArray - array)/ 8

section .text
_start:

    nop

    mov r8, 0
    lea r9, [r8 * 2]
    _for:
	cmp r8, [nbElement]
	jz _endFor

	mov [array + r8 * 8], r9; met 2*i dans array[i]
	
	inc r8; incremente r8
	lea r9, [r8 * 2]; met le res de la mult de r8 avec 2 dans r9
	jmp _for
    _endFor:

    mov rax, 60
    mov rdi, 0
    syscall
