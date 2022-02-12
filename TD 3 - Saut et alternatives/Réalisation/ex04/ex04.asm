;Ex04

global main

section .text 
main:

   nop

   mov rax, 2
   mov rbx, 6

   cmp rax, rbx
   js _rbxMax_raxMin
	mov r8, rax
	mov r9, rbx
	jmp _fin_si

_rbxMax_raxMin:
   mov r8, rbx
   mov r9, rax

_fin_si:
   mov rax, 60
   mov rdi, 0
   syscall
