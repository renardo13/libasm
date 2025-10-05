
; Executable code
section .text

;Export the variable to use in another context
global ft_strlen

ft_strlen:
    xor rax, rax 

.loop_start:
    cmp byte[rdi + rax], 0

    ; To make a jump to continue to loop like a while
    je .loop_end
    inc rax
    jmp .loop_start

.loop_end:
    ret