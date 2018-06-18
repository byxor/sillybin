extern printf


struc Point
  .x   resq 1
  .y   resq 1
endstruc


section .rodata
description     db "Point: ", 0
integerFormat   db "%d ", 0
newLine         db 10, 0


section .text
        global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        mov rdi, description
        mov al, 0
        call printf

        mov [ebp - 16], 10

        ;; mov rsi, qword [ebp - 16 + Point.x]
        mov rsi, qword [ebp - 16]
        mov rdi, integerFormat
        mov al, 0
        call printf

        ;; mov rsi, qword [ebp - 16 + Point.y]
        ;; mov rdi, integerFormat
        ;; mov al, 0
        ;; call printf

        mov rdi, newLine
        mov al, 0
        call printf

        add rsp, 16
        pop rbp
        ret
