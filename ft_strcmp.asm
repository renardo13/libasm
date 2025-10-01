
; Instruction	Signification  |	Flag
; ------------------------------------------------
; jne	Jump if Not Equal	   | ZF = 0 (Zero Flag)
; je	Jump if Equal	       | ZF = 1
; jnz	Jump if Not Zero	   | ZF = 0
; jz	Jump if Zero	       | ZF = 1


; Executable code
section .text

; Export the variable to use in another context
global ft_strcmp

; CONVENTION
;   rdi = pointeur vers dest (destination)
;   rsi = pointeur vers src  (source)

ft_strcmp:
    cld                 ; set the DF (direction flag) at 0 to increment the pointer during the copy

.loop:
    mov al, [rdi]
    mov dl, [rsi]
    cmp     al, dl
    jne .return_diff
    test    al, al
    je      .equal
    inc     rdi
    inc     rsi
    jmp     .loop
    
.return_diff:
    ; res = (unsigned char)s1 - (unsigned char)s2
    movzx   eax, al
    movzx   edx, dl
    sub     eax, edx
    ret

.equal:
    xor     eax, eax        ; eax = 0
    ret
