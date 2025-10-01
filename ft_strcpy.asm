
; Executable code
section .text

; Export the variable to use in another context
global ft_strcpy

; CONVENTION
;   rdi = pointeur vers dest (destination)
;   rsi = pointeur vers src  (source)

ft_strcpy:
    cld                 ; set the DF (direction flag) at 0 to increment the pointer during the copy
    push    rdi         ; put dest pointer on the stack to save it

.loop:
    mov     al, [rsi]   ; put SRC octet in al
    mov     [rdi], al   ; set al octet in DEST
    inc     rsi
    inc     rdi
    test    al, al      ; END byte is reach ? Fill the ZF FLAG with the true or false
    jnz     .loop       ; if no, continue

    pop     rax         ; Put rsp (the pointer of the stack) in rax for the return, it increment rsp also
    ret
