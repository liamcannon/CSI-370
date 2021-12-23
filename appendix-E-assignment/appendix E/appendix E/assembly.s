//
//  assembly.s
//  appendix E
//
//  Created by Liam Cannon on 10/13/21.
//
.data

.bss

.text
.global _main
_main:

call GetParam
movq %rax, %rbx

call GetParam
addq %rbx, %rax

movq %rax, %rdi

call PrintOutput

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
