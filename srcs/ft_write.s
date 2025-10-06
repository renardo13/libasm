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
    call		__errno_location   ; __errno_location function return a POINTER to errno -> we did that only to
                                   ; have the right adress to go toin the programming which is calling ft_write.
                                   ; Because the value pointed is not the right one ->
                                   ; This is a global function not inside our local thread.

	mov		[rax], rdi		       ; Take this adresse and set the right code inside
	mov		rax, -1		
    ret