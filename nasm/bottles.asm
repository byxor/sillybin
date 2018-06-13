extern printf
extern snprintf


BUFFER_SIZE     equ 64


section .text
        global main

        
main:
        push rbp
        mov rbp, rsp

        sub rsp, 8
        mov qword [rbp - 8], BUFFER_SIZE
        
        sub rsp, qword [rbp - 8]

        mov rdx, 10
        mov rsi, qword [rbp - 8]
        mov rdi, rbp
        sub rdi, qword [rbp - 8]
        call bottlesOnTheWall

        mov rsi, qword [rbp - 8]
        mov rdi, rbp
        sub rdi, qword [rbp - 8]
        mov al, 0
        call printf

        call newLine

        mov rdx, 10
        mov rsi, qword [rbp - 8]
        mov rdi, rbp
        sub rdi, qword [rbp - 8]
        call bottles

        mov rsi, qword [rbp - 8]
        mov rdi, rbp
        sub rdi, qword [rbp - 8]
        mov al, 0
        call printf

        add rsp, qword [rbp - 8]
        add rsp, 8

        mov rax, 0
        pop rbp
        ret

        
;; rdx: n
;; rsi: size_t
;; rdi: char *buffer
section .rodata
bottlesOnTheWall_format db "%s on the wall", 0
section .text
bottlesOnTheWall:
        push rbp
        mov rbp, rsp

        sub rsp, 24
        mov [rbp - 8], rdi
        mov [rbp - 16], rsi
        mov [rbp - 24], rdx

        sub rsp, 8
        mov qword [rbp - 24 - 8], BUFFER_SIZE

        sub rsp, qword [rbp - 24 - 8]
        
        mov rdx, [rbp - 24]
        mov rsi, [rbp - 16]
        mov rdi, rbp
        sub rdi, 24
        sub rdi, qword [rbp - 24 - 8]
        call bottles
        
        mov rcx, rbp
        sub rcx, 24
        sub rcx, qword [rbp - 24 - 8]
        mov rdx, bottlesOnTheWall_format
        mov rsi, [rbp - 16]
        mov rdi, [rbp - 8]
        mov al, 0
        call snprintf
        
        add rsp, qword [rbp - 24 - 8]
        add rsp, 8
        add rsp, 24
        pop rbp
        ret

;; rdx: n
;; rsi: size_t
;; rdi: char* buffer
section .rodata
bottles_pluralFormat    db "%u bottles of beer", 0
bottles_singularFormat  db "%u bottle of beer", 0
bottles_noneFormat      db "No more bottles of beer", 0
section .text
bottles:
        push rbp
        mov rbp, rsp

        sub rsp, 24
        mov [rbp - 8], rdi
        mov [rbp - 16], rsi
        mov [rbp - 24], rdx

        mov rax, [rbp - 24]
        cmp rax, 1
        je bottles_onlyOne
        jg bottles_moreThanOne
        jl bottles_none

bottles_onlyOne:
        mov rax, bottles_singularFormat
        jmp bottles_continue
bottles_moreThanOne:
        mov rax, bottles_pluralFormat
        jmp bottles_continue
bottles_none:
        mov rax, bottles_noneFormat
        jmp bottles_continue

bottles_continue:
        mov rcx, [rbp - 24]
        mov rdx, rax
        mov rsi, [rbp - 16]
        mov rdi, [rbp - 8]
        mov al, 0
        call snprintf

        add rsp, 24
        pop rbp
        ret


section .text
newLine_format  db 10, 0
newLine:
        push rbp
        mov rbp, rsp

        mov rdi, newLine_format
        mov al, 0
        call printf
        
        pop rbp
        ret
