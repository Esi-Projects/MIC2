;Exercice 04

global _start

section .data
    b0      DB      0
    b1      DB      0
    b2      DB      0
    b3      DB      0
    
section .rodata
    nb      DD      0x12345678
    ;en mémoire 0x78_56_34_12_..........
    
section .text
_start:

   nop

   mov al, [nb] 
   mov [b0], al
   
   mov al, [nb+1]
   mov [b1], al
   
   mov al, [nb+2]
   mov [b2], al

   mov al, [nb+3]
   mov [b3], al

   mov rax, 60
   mov rdi, 0
   syscall
