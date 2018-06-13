extern printf
extern snprintf


ARBITRARY_BUFFER_SIZE   equ 64
STARTING_VALUE          equ 99
        

section .text
        global main

        
main:
        push rbp
        mov rbp, rsp

        sub rsp, 8
        mov qword [rbp - 8], STARTING_VALUE
        
main_loop:
        mov rdi, qword [rbp - 8]
        call printBottleParagraph

        dec qword [rbp - 8]

        cmp qword [rbp - 8], -1
        jne main_loop

        add rsp, 8
        mov rax, 0
        pop rbp
        ret


;; rdi: n
printBottleParagraph:
        push rbp
        mov rbp, rsp

        sub rsp, 16
        mov qword [rbp - 8], rdi
        mov qword [rbp - 16], ARBITRARY_BUFFER_SIZE
        sub rsp, qword [rbp - 16]

%macro  printBuffer 0
        mov rsi, qword [rbp - 16]
        mov rdi, rbp
        sub rdi, qword [rbp - 16]
        mov al, 0
        call printf
%endmacro
        
        mov rdx, qword [rbp - 8]
        mov rsi, qword [rbp - 16]
        mov rdi, rbp
        sub rdi, qword [rbp - 16]
        call bottlesOnTheWall
        printBuffer
        call newLine

        mov rdx, qword [rbp - 8]
        mov rsi, qword [rbp - 16]
        mov rdi, rbp
        sub rdi, qword [rbp - 16]
        call bottles
        printBuffer
        call newLine

        mov rdx, qword [rbp - 8]
        mov rsi, qword [rbp - 16]
        mov rdi, rbp
        sub rdi, qword [rbp - 16]
        call instruction
        printBuffer
        call newLine

        cmp qword [rbp - 8], 0
        je printBottleParagraph_noneLeft
        jmp printBottleParagraph_moreThanOne

printBottleParagraph_noneLeft:
        mov rdx, STARTING_VALUE
        jmp printBottleParagraph_continue
printBottleParagraph_moreThanOne:
        mov rdx, qword [rbp - 8]
        dec rdx
        jmp printBottleParagraph_continue
        
printBottleParagraph_continue:  
        mov rsi, qword [rbp - 16]
        mov rdi, rbp
        sub rdi, qword [rbp - 16]
        call bottlesOnTheWall
        printBuffer
        call newLine

        cmp qword [rbp - 8], 0
        je printBottleParagraph_done

        call newLine

printBottleParagraph_done:
        add rsp, qword [rbp - 16]
        add rsp, 16

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
        mov qword [rbp - 24 - 8], ARBITRARY_BUFFER_SIZE

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


;; rdx: n
;; rsi: size_t
;; rdi: char* buffer
section .rodata
instruction_takeDown    db "Take one down and pass it around", 0
instruction_buyMore     db "Go to the store and buy some more", 0
section .text
instruction:
        push rbp
        mov rbp, rsp

        sub rsp, 24
        mov [rbp - 8], rdi
        mov [rbp - 16], rsi
        mov [rbp - 24], rdx

        cmp qword [rbp - 24], 0
        je instruction_noneLeft
        jmp instruction_oneOrMore
        
instruction_oneOrMore:
        mov rdx, instruction_takeDown
        jmp instruction_continue
instruction_noneLeft:
        mov rdx, instruction_buyMore
        jmp instruction_continue
        
instruction_continue:
        mov rsi, [rbp - 16]
        mov rdi, [rbp - 8]
        mov al, 0
        call snprintf
        
        add rsp, 24
        pop rbp
        ret
        

section .rodata
newLine_format  db 10, 0
section .text
newLine:
        push rbp
        mov rbp, rsp

        mov rdi, newLine_format
        mov al, 0
        call printf
        
        pop rbp
        ret
