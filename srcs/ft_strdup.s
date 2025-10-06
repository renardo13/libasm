section .text
global ft_strdup
extern __errno_location
extern ft_strlen
extern ft_strcpy

extern malloc

ft_strdup:

    call ft_strlen      ; -> size in RAX
    inc rax             ; -> +1 for the "/0"

    push rdi            ; PUSH is a copy of the value that is put on the head of the stack to save it

    mov rdi, rax        ; -> put the size in RDI, reister use for the len in malloc
    call malloc
    test    rax, rax    ; check if malloc returned NULL
    je      .error

    pop rdi             ; get the value on the head of the stack and put it in RDI. (previous value of RDI here)
    mov rsi, rdi        ; save RDI content because strdup as the SOURCE in RDI
    mov rdi, rax        ; prepare RDI with RAX because RDI is used by strcpy to copy RSI
    call ft_strcpy      ; return the string copied in RAX
    ret

.error:
    xor     rax, rax    ; return NULL
    
    ret