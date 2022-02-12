global _start

section .data
    var1   DB   1 ; 0x01
    var2   DB   2 ; 0x02
    var3   DW   0x0304 ; 0x03_04
    var4   DQ   0x000000008000FFFF ; 0x00_00_00_00_08_00_FF_FF
    ; la section des données occupe 12 bytes
    ; son contenu est 0x01_02_04_03_FF_FF_00_80_00_00_00_00
    
section .text
_start:
    mov rax, var1     ; rax contient l'adresse de va1
    mov al,  [var1]   ; al registre 1B contient 0x01 
    mov ax,  [var1]   ; ax registre 2B contient 0x02_01
    mov al,  [var3]   ; al registre 1B contient 0x04       
    mov ax,  [var3]   ; ax registre 2B contient 0x03_04      
    mov rax, -1       ; rax registre 8B contient 0xFF_FF_FF_FF_FF_FF_FF_FF 
    mov eax, [var4]   ; rax registre 4B contient 0x80_00_FF_FF_ 

    mov rax, 60
    mov rdi, 0    
    syscall

