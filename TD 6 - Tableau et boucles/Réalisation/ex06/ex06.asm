;Exercice 06

global _start

section .data
    array DQ 6, 2, 3 , 1, 9, 5, 7, 4, 0, 8; déclare un tableau de 10 entiers de 8 bytes chacun
    sizeArray DQ $ - array
    nbElement DQ (sizeArray - array)/ 8

section .text
_start:

    nop

    mov rax, 0
    mov r8, [array]
    mov r15, [array]
    _for:
	cmp rax, [nbElement]
	jz _endFor

	cmp r8,  [array + rax * 8]
	js  _notSmaller
	   mov r8, [array + rax * 8]
	_notSmaller:
	
	cmp r15,  [array + rax * 8]
	jns _notGreater
	   mov r15, [array + rax * 8]
	
	_notGreater:
	
	inc rax; incremente r8

	jmp _for
    _endFor:

    mov rax, 60
    mov rdi, 0
    syscall
