extern printf


section .rodata
outputFormat    db "%-5d factorial is %d", 10, 0


section .text
        global main


main:
        push rbp
        mov rbp, rsp
        sub rsp, 16
        mov qword [rbp - 8], 0          ; n
        mov qword [rbp - 16], 60        ; upperLimit

main_loop:
        mov rdi, qword [rbp - 8]
        call factorial

        mov rdx, rax
        mov rsi, qword [rbp - 8]
        mov rdi, outputFormat
        mov al, 0
        call printf

        inc qword [rbp - 8]

        mov rax, qword [rbp - 8]
        mov rbx, qword [rbp - 16]
        cmp rax, rbx
        jl main_loop

        mov rax, 0
        add rsp, 16
        pop rbp
        ret


;; rdi = n
factorial:
        push rbp
        mov rbp, rsp
        sub rsp, 8
        mov qword [rbp - 8], rdi

        cmp qword [rbp - 8], 1
        jle factorial_baseCase

        mov rdi, qword [rbp - 8]
        dec rdi
        call factorial

        mov rbx, qword [rbp - 8]
        imul rax, rbx

        jmp factorial_return

factorial_baseCase:
        mov rax, 1

factorial_return:
        add rsp, 8
        pop rbp
        ret
