; 1_comprehension_log.asm

global main

section .text
main:
    mov al, 10011101b                
    not al              ; al = ........, zf = ., sf = .

    mov al, 11100101b
    mov ah, 00101010b
    and al, ah          ; al = ........, zf = ., sf = .

    mov al, 11100101b
    mov ah, 00001010b
    and al, ah          ; al = ........, zf = ., sf = .

    mov al, 01100101b
    mov ah, 01010101b
    or  al, ah          ; al = ........, zf = ., sf = .

    mov al, 11100101b
    mov ah, 01010101b
    or  al, ah          ; al = ........, zf = ., sf = .

    mov dx, 1100010011100101b
    mov si, 0011000001100010b
    xor dx, si          ; dx = ................ 
                        ; zf = ., sf = .	

    mov al, 11100101b
    mov ah, 11100101b
    xor al, ah          ; al = ........, zf = ., sf = .

    ; fin
    mov rax, 60
    mov rdi, 0
    syscall

