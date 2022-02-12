;Ex05

global main

section .text
main:

   nop

   mov rdi, 6

   bt rdi, 0
   jc _impair
	bt rdi, 1
    	jc _MOD2eq0_notMOD4eq0
		bt rdi, 2
		jc _MOD4eq0_notMOD8eq0
			bt rdi, 3
			jc _MOD8eq0_notMOD16eq0
				mov rsi, 3
				jmp _fin_si

_impair:
   mov rsi, 0
   jmp _fin_si

_MOD2eq0_notMOD4eq0:
   mov rsi, 1
   jmp _fin_si

_MOD4eq0_notMOD8eq0:
   mov rsi, 2
   jmp _fin_si

_MOD8eq0_notMOD16eq0:
   mov rsi, 3
   jmp _fin_si

_fin_si:
   mov rax, 60
   mov rdi, 0
   syscall
