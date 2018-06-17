%include "include/descriptors.nasm"
%include "include/system_calls.nasm"        


SECTION .data
        
question:       db "What is your name? "
questionLength: equ $-question
        
greeting:       db "Hello, "
greetingLength: equ $-greeting

nameLength:     equ 16


SECTION .bss
        name resb nameLength


SECTION .text
        global main

main:
        call GetName
        call GreetName

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall

GetName:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, question
        mov rdx, questionLength
        syscall

        mov rax, SYS_READ
        mov rdi, STDIN
        mov rsi, name
        mov rdx, nameLength
        syscall
        
        ret
       
GreetName:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, greeting
        mov rdx, greetingLength
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, name
        mov rdx, nameLength
        syscall
        
        ret
