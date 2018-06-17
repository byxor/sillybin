extern printf

        
SECTION .data
format:         db "%d", 10, 0
maximum:        dw 0FFh


SECTION .text
        global main

main:
        push rbp

        mov rbx, 0

mainLoop:
        push rbx

        mov rax, 0
        mov rdi, format
        mov rsi, rbx
        call printf

        pop rbx
        inc rbx
        
        cmp rbx, [maximum]
        jl mainLoop
        
        pop rbp
        
        mov rax, 0
        ret
