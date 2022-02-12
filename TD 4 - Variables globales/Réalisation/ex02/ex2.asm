;Exercice 02

global _start

section .data
   nb DD 0x000000FF ; Ox00_00_00_FF
   ; en mémoire 0xFF_00_00_00........
section .text
_start:
   mov rax, nb
   mov rbx, [nb]; étant donné que la variable est nb est de taille 4B,
	        ; les bits de poids forts de rbx vont etre remplis par 
		;les résidus se trouvant en mémoire --> 0x.._.._.._.._00_00_00_FF 

   mov rax, 60
   mov rdi, 0
   syscall
