	; Exercice 04
	
global _start
	
section .rodata
    evenMsg DB `pair\n`
    lengthMsg1 DQ lengthMsg1 - evenMsg	

    oddMsg DB `impair\n`
    lengthMsg2 DQ lengthMsg2 - oddMsg	
	
section .text
_start:
	
	nop
	
	mov rax, 11
	
	bt rax, 0
	jc _odd  
_even:
	    mov rax, 1
	    mov rdi, 1
	    mov rsi, evenMsg
	    mov rdx, [lengthMsg1]
	    syscall
	
	    jmp _end
	
_odd:
	mov rax, 1
	mov rdi, 1
	mov rsi, oddMsg
	mov rdx, [lengthMsg2]
	syscall
	
_end:
	mov rax, 60
	mov rdi, 0
	syscall
