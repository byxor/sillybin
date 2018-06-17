%include "include/descriptors.asm"
%include "include/system_calls.asm"


SECTION .data

text0:          db "Hello", 0
text1:          db "world!", 0
text2:          db "Ultra Long String... Wow it's still going. Computers have too much memory nowadays.", 0

newline:        db 10


SECTION .text
        global main

main:
        mov rax, text0
        call Print

        mov rax, text1
        call Print

        mov rax, text2
        call Print

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall

;;; Input: pointer to string, in rax
Print:
        ;; rax = char *
        ;; rbx = length(string)
        ;; cl = char
        push rax
        mov rbx, 0
_SearchForEndOfString:
        inc rax
        inc rbx
        mov cl, [rax]
        cmp cl, 0
        jne _SearchForEndOfString

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        pop rsi
        mov rdx, rbx
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, newline
        mov rdx, 1
        syscall

        ret
