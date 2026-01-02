.section .text
.global _start

.equ BASE, 0x400000

ehdr:
    .byte 0x7f, 'E', 'L', 'F'
    .byte 2
    .byte 1
    .byte 1
    .byte 0
    .zero 8
    .word 2
    .word 0x3e
    .long 1
    .quad BASE + (_start - ehdr)
    .quad phdr - ehdr
    .quad 0
    .long 0
    .word ehdrsize
    .word phdrsize
    .word 1
    .word 0
    .word 0
    .word 0

.equ ehdrsize, . - ehdr

phdr:
    .long 1
    .long 5
    .quad 0
    .quad BASE
    .quad BASE
    .quad filesize
    .quad filesize
    .quad 0x1000

.equ phdrsize, . - phdr

_start:
    mov $1, %rax
    mov $1, %rdi
    lea msg(%rip), %rsi
    mov $msglen, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall

msg:
    .ascii "hello world\n"
msglen = . - msg

.equ filesize, . - ehdr

