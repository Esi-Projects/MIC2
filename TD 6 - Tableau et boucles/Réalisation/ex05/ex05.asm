;Exercice 05

global _start

section .data
    array DQ 0, 1, 2 , 3, 4, 5, 6, 7, 8, 9; déclare un tableau de 10 entiers de 8 bytes chacun
    sizeArray DQ $ - array
    nbElement DQ (sizeArray - array)/ 8

section .text
_start:

    nop

    mov r8, 0
    mov r15, 0
    _for:
	cmp r8, [nbElement]
	jz _endFor

	bt qword [array + r8 * 8], 0; check si elem du tab à l'indice r8 est pair
	
	jc _impair
	   inc r15; incremente r15 à chaque fois qu'un element du tableau est pair
	_impair:
	
	inc r8; incremente r8

	jmp _for
    _endFor:

    mov rax, 60
    mov rdi, 0
    syscall
