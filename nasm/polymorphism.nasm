extern printf


section .text
        global main


main:
        push rbp
        mov rbp, rsp

        mov rdi, callback0
        call invokePolymorphically

        mov rdi, callback1
        call invokePolymorphically

        mov rdi, callback2
        call invokePolymorphically

        mov rax, 0
        pop rbp
        ret


;; rdi = callback
section .rodata
        invokePolymorphically_startMessage    db "Invoking callback...", 10, 0
        invokePolymorphically_endMessage      db "Done!", 10, 10, 0
section .text
invokePolymorphically:
        push rbp
        mov rbp, rsp

        sub rsp, 8
        mov [rbp - 8], rdi

        mov rdi, invokePolymorphically_startMessage
        mov al, 0
        call printf

        call [rbp - 8]

        mov rdi, invokePolymorphically_endMessage
        mov al, 0
        call printf

        add rsp, 8
        pop rbp
        ret


section .rodata
        callback0_message       db "Executing Callback 0", 10, 0
section .text
callback0:
        push rbp
        mov rbp, rsp

        mov rdi, callback0_message
        mov al, 0
        call printf

        pop rbp
        ret


section .rodata
        callback1_message       db "Now that's what I call Callback 1", 10, 0
section .text
callback1:
        push rbp
        mov rbp, rsp

        mov rdi, callback1_message
        mov al, 0
        call printf

        pop rbp
        ret


section .rodata
        callback2_message       db "Deleting C:\WINDOWS\System32... done!", 10, 0
section .text
callback2:
        push rbp
        mov rbp, rsp

        mov rdi, callback2_message
        mov al, 0
        call printf

        pop rbp
        ret
