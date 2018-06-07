SECTION .data
        
question:       db "What is your name? "
questionLength: equ $-question
        
greeting:       db "Hello, "
greetingLength: equ $-greeting

nameLength:     equ 16

;;; System Call IDs
sys_write:      equ 1
sys_read:       equ 0
sys_exit:       equ 60

;;; File Descriptors
stdin:          equ 0
stdout:         equ 1


SECTION .bss
        name resb nameLength


SECTION .text
        global _start

_start:
        call GetName
        call GreetName

        mov rax, sys_exit
        mov rdi, 0
        syscall

GetName:
        mov rax, sys_write
        mov rdi, stdout
        mov rsi, question
        mov rdx, questionLength
        syscall

        mov rax, sys_read
        mov rdi, stdin
        mov rsi, name
        mov rdx, nameLength
        syscall
        
        ret
       
GreetName:
        mov rax, sys_write
        mov rdi, stdout
        mov rsi, greeting
        mov rdx, greetingLength
        syscall

        mov rax, sys_write
        mov rdi, stdout
        mov rsi, name
        mov rdx, nameLength
        syscall
        
        ret
