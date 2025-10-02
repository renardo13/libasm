section .text

global ft_write
extern __errno_location

ft_write:

    mov rax, 1                     ; Set the syscall call number for write (1)
    syscall
    cmp		rax, 0                 ; If 0 syscall was successfull
    jl .error
    ret                            ; If rax is less than zero return error else return rax

.error:
    
    neg rax                        ; convert -1, -2, etc. to positive number
    mov rdi, rax
    mov rax, [__errno_location]
    mov [rax], rdi                 ; Update of the value of the thread locally
    mov rax, -1
    ret