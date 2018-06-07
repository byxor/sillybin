SECTION .data

text0:          db "Hello", 0
text1:          db "world!", 0
text2:          db "Ultra Long String... Wow it's still going. Computers have too much memory nowadays.", 0

newline:        db 10

;;; System Call IDs
sys_write:      equ 1
sys_read:       equ 0
sys_exit:       equ 60

;;; File Descriptors
stdin:          equ 0
stdout:         equ 1
        
SECTION .text
        global _start

_start:
        mov rax, text0
        call Print

        mov rax, text1
        call Print

        mov rax, text2
        call Print

        mov rax, sys_exit
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

        mov rax, sys_write
        mov rdi, stdout
        pop rsi
        mov rdx, rbx
        syscall

        mov rax, sys_write
        mov rdi, stdout
        mov rsi, newline
        mov rdx, 1
        syscall

        ret
