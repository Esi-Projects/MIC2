;Exercice 03

global _start

section .bss
   var RESQ 8

section .text  
_start:

   nop

   mov QWORD [var], 42

   mov rax, 60
   mov rdi, 0
   syscall
