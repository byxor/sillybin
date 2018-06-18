extern printf

%define struct(attribute, size, rbpOffset) [rbp - rbpOffset - size + attribute]


section .rodata

description     db "Point: ", 0
integerFormat   db "%d ", 0
newLine         db 10, 0

struc Point
  .x    resq 1
  .y    resq 1
endstruc
Point.SIZE equ 24


section .text
        global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, Point.SIZE

        mov qword [rbp - Point.SIZE + Point.x], 10
        mov qword [rbp - Point.SIZE + Point.y], 20

        mov rdi, description
        mov al, 0
        call printf

        mov rsi, qword [rbp - Point.SIZE + Point.x]
        mov rdi, integerFormat
        mov al, 0
        call printf

        mov rsi, qword [rbp - Point.SIZE + Point.y]
        mov rdi, integerFormat
        mov al, 0
        call printf

        mov rsi, Point.SIZE
        mov rdi, integerFormat
        mov al, 0
        call printf

        mov rdi, newLine
        mov al, 0
        call printf

        add rsp, Point.SIZE
        pop rbp
        ret
