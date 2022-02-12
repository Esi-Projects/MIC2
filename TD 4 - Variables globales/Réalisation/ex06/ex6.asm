; Exercice 06

global _start
	
section .rodata
   var1 DD 5
   var2 DD 7

section .bss
   var3 RESD 1

section .text
_start:

   mov al, [var1]
   
   cmp al, [var2]
   jns _var1_GreaterThan_var2; si var1 est plus grand que var2, saute

_var1_LesserThan_var2:
   mov [var3], al
   jmp _end

_var1_GreaterThan_var2:
   mov ah, [var2] 
   mov [var3], ah
   jmp _end

_end:
   mov rax, 60
   mov rdi, 0
   syscall
