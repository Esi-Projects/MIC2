;Ex01.asm

global main

section .text
main:

   nop

   mov rax, 1
	
   cmp rax, 0
   jz _fin_si
	mov rbx, 1

_fin_si:
	mov rax, 60
	mov rdi, 0
	syscall
