%include "descriptors.asm"
        

SECTION .data
text:           db "Hello, World!", 10, 0
length:         equ $-text

;;; System Call IDs
sys_write:      equ 1
sys_exit:       equ 60


SECTION .text
        global _start

_start:
        mov rax, sys_write
        mov rdi, STDOUT
        mov rsi, text
        mov rdx, length
        syscall

        mov rax, sys_exit
        mov rdi, 0
        syscall
