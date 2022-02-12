
;Exercice 05

global _start

section .data
   var1 DD 1
   var2 DD 2

section .text
_start:

   nop

   mov al, [var1]

   Xor al, [var2]
   Xor [var2], al
   Xor al, [var2]

   mov [var1], al

   mov rax, 60
   mov rdi, 0
   syscall
