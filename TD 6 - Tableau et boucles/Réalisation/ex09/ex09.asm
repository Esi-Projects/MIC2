; Exercice 09

global _start

section .bss
   buff RESB 1
   
;section .rodata
;   buff DB 1
   
section .text
_start:

   nop
   
   mov rsi, buff
   mov rdx, 1
   
   _for:
   	;Read
   	mov rax, 0
   	mov rdi, 0
   	syscall
   	
   	cmp rax, 1
   	jnz _endFor
   	
   	;Write
   	mov rax, 1
   	mov rdi, 1
   	syscall
   	
   	jmp _for
   	
   _endFor:
   
   mov rax, 60
   mov rdi, 0
   syscall
