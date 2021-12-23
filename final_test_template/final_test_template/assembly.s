//
//  assembly.s
//  final_test_template
//
//  Created by Liam Cannon on 12/14/21.
//
.data
num: .quad 80
num2: .quad 2
num3: .quad 3

.bss
.lcomm sum, 8

.text
.global _main

_main:
    movq num(%rip), %rax
    addq $20, %rax
    movq %rax, sum(%rip)

    movq num2(%rip), %rax
    imul num3(%rip), %rax
    
    movq $0x2000001, %rax
    xorq %rdi, %rdi
    syscall
.end
