extern printf

%define struct(attribute, size, rbpOffset) [rbp - rbpOffset - size + attribute]


section .rodata

struc Point
  .x    resq 1
  .y    resq 1
endstruc
Point.SIZE      equ 24
Point.FORMAT    db "<Point: x=%ld y=%ld>", 10, 0


section .text
        global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, Point.SIZE

        mov qword [rbp - Point.SIZE + Point.x], 10
        mov qword [rbp - Point.SIZE + Point.y], 20

        mov rdx, qword [rbp - Point.SIZE + Point.y]
        mov rsi, qword [rbp - Point.SIZE + Point.x]
        mov rdi, Point.FORMAT
        mov al, 0
        call printf

        add rsp, Point.SIZE
        pop rbp
        ret
