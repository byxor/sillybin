%include "include/descriptors.nasm"
%include "include/system_calls.nasm"
        

SECTION .data
text:           db "Hello, World!", 10, 0
length:         equ $-text


SECTION .text
        global main

main:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, text
        mov rdx, length
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall
