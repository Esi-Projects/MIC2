;Hello world.asm

global _start

section .rodata
   msg DB 'Hello, World B113!\n'
   lgrMsg DQ lgrMsg - msg

section .text
_start:

   nop

; affichage
   mov rax, 1
   mov rdi, 1
   mov rsi, msg
   mov rdx, [lgrMsg]
   syscall

; fin
   mov rax, 60
   mov rdi, 0
   syscall
