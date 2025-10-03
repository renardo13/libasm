
; Instruction	Signification  |	Flag
; ------------------------------------------------
; jne	Jump if Not Equal	   | ZF = 0 (Zero Flag)
; je	Jump if Equal	       | ZF = 1
; jnz	Jump if Not Zero	   | ZF = 0
; jz	Jump if Zero	       | ZF = 1

; Register    Size     | Notes
; --------------------------------------------
; al          8 bits   | Lowest byte of rax
; ah          8 bits   | Second byte of rax (high byte of the 16-bit word)
; ax          16 bits  | Lowest 16 bits of rax (al + ah)
; eax         32 bits  | Lowest 32 bits of rax
; rax         64 bits  | Full 64-bit register



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
    mov al, [rdi]         ; load the character of s1
    mov dl, [rsi]         ; load the character of s2
    cmp     al, dl        ; compare both
    jne .return_diff      ; if different return diff
    cmp    al, 0          ; is the end of s1 ? 
    je      .return_diff  ; if yes, go out still both strings are equals
    inc     rdi           ; increment
    inc     rsi           ; increment
    jmp     .loop         ; loop
    
.return_diff:
    ; res = (unsigned char)s1 - (unsigned char)s2
    movzx   eax, al       ; This is like a cast in unsigned int
    movzx   edx, dl       ; This is like a cast in unsigned int
    sub     eax, edx      ; substraction
    ret