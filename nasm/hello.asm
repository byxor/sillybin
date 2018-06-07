SECTION .data
text:           db "Hello, World!", 10, 0
length:         equ $-text

sys_write:      equ 1
sys_exit:       equ 60

stdout:         equ 1

SECTION .text
        global _start

_start:
        mov rax, sys_write
        mov rdi, stdout
        mov rsi, text
        mov rdx, length
        syscall

        mov rax, sys_exit
        mov rdi, 0
        syscall
