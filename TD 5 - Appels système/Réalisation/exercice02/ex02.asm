; Exercice 02

global _start

section .rodata
    nomFichier DB `brol`, 0      ; ne pas oublier le 0
    
    ErrMsg DB `Echec lors de l’ouverture du fichier\n`
    lgrErrMsg DQ lgrErrMsg - ErrMsg

    SuccessMsg DB `fichier ouvert avec succès\n`
    lgrSuccMsg DQ lgrSuccMsg - ErrMsg

section .bss 
    fd RESQ 1
	
section .text
_start:

    nop

    mov rax, 2
    mov rdi, nomFichier
    mov rsi, 0q
    syscall; 1. tente d’ouvrir le fichier en lecture seule.

    cmp rax, 0 
    js _ErrOpen

_SuccessOpen:; 3. si l’ouverture réussit :

    mov rax, 1
    mov rdi, 1
    mov rsi, SuccessMsg
    mov rdx, [lgrSuccMsg]
    syscall; a) affiche à l’écran le message :fichier ouvert avec succès.

    mov [fd], rax
    
    mov rax, 3
    mov rdi, [fd]
    syscall; c) ferme le fichier. 

    mov rdi, 0; d) retourne la valeur 0 pour indiquer un dénouement correct.
    jp _end; 

_ErrOpen:; 2. si l’ouverture échoue :

    mov rax, 1
    mov rdi, 1
    mov rsi, ErrMsg
    mov rdx, [lgrErrMsg]
    syscall; a) affiche à l’écran le message d'erreur :échec lors de l’ouverture du fichier.
    
    mov rdi, -1; c) retourne le code d’erreur 1.
    jp _end

_end:
    mov rax, 60
    ;mov rdi, 0; mis en commentaire prcq la valeur d' rdi est déjà mise avant le jump _end
    syscall
