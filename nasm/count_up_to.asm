extern printf
extern scanf


SECTION .rodata
inputMessage    db "Enter a number: ", 0
inputFormat     db "%u", 0
outputFormat    db "%u", 10, 0


SECTION .text
        global main

main:
        push rbp
        mov ebp, esp

        call getNumber

        mov rdi, rax
        call countUpTo

        pop rbp

        mov rax, 0
        ret


getNumber:
        push rbp
        mov rbp, rsp
        
        sub rsp, 8
        
        mov rdi, inputMessage
        mov al, 0
        call printf

        mov rsi, rsp
        mov rdi, inputFormat
        mov al, 0
        call scanf

        mov rax, [rsp]
        
        add rsp, 8
        
        pop rbp
        ret


countUpTo:
        push rbp
        mov rbp, rsp
        
        mov rbx, rdi
        mov rax, 0
countUpToLoop:
        push rax
        
        mov rsi, rax
        mov rdi, outputFormat
        mov al, 0
        call printf

        pop rax
        
        inc rax

        cmp rax, rbx
        jle countUpToLoop
        
        pop rbp
        ret
