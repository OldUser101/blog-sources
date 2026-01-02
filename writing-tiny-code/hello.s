.section .data
msg:
    .string "hello world\n"
msglen = . - msg

.section .text
.global _start

_start:
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $msglen, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
