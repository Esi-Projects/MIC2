;Exercice 02

global main

section .text
main:

   nop

   mov rax, 11

   bt rax, 0
   jc _impair
	mov r8, 0
	jmp _fin_si 

_impair:
   mov r8, 1

_fin_si:
   mov rax, 60
   mov rdi, 0
   syscall
