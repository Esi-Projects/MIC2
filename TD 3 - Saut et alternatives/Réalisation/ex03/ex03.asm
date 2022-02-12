;Ex03

global main

section .text
main:

   nop

   mov r14, 5
   mov r15, 10
 
   cmp r14,r15
   jz _egaux
	Xor r14, r15;Technique
	Xor r15, r14;de
	Xor r14, r15;permutation
	jmp _fin_si

_egaux:
   mov r14, 0
   mov r15, 0

_fin_si:

   mov rax, 60
   mov rdi, 0
   syscall
