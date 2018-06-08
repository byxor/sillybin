%include "include/descriptors.asm"
%include "include/system_calls.asm"
        

SECTION .data
text:           db "Hello, World!", 10, 0
length:         equ $-text


SECTION .text
        global _start

_start:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, text
        mov rdx, length
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall
