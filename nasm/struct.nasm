extern printf

struc Point
  .x   resq 1
  .y   resq 1
endstruc
        
section .rodata
description     db "Point:", 10, 0
integerFormat   db "%d", 10, 0
        

section .data

        

section .text
        global main

main:
        push rbp
        mov rbp, rsp

point istruc Point
        at Point.x, dq 10
        at Point.y, dq 20
iend

        mov rdi, description
        mov al, 0
        call printf

        mov rsi, qword [point + Point.x]
        mov rdi, integerFormat
        mov al, 0
        call printf

        mov rsi, qword [point + Point.y]
        mov rdi, integerFormat
        mov al, 0
        call printf
        
        pop rbp
        ret
