section .text
global ft_read

extern __errno_location

ft_read:
    mov rax, 0
    syscall
    cmp		rax, 0
    jl .error
    ret

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