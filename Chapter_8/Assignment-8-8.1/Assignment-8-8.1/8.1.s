//
//  8.1.s
//  Assignment-8-8.1
//
//  Created by Liam Cannon on 11/2/21.
//
.extern _getDouble
.extern _printString
.extern _printDouble

.data
radiusString: .asciz "Enter Radius:"
heightString: .asciz "Enter Height:"
// 10 is newline and 0 is the null terminate
//heightString: .byte "Enter Height", 10, 0

.bss
.lcomm val1, 64
.lcomm val2, 64

.text
.global _asmMain
_asmMain:

push %rbp
movl %rsp, %rbp

leaq radiusString(%rip), %rdi
callq _printString

callq _getDouble
movq %xmm0, val1(%rip)
fldl val1(%rip)
fmul %st, %st
fldpi
fmulp %st, %st(1)

leaq heightString(%rip), %rdi
callq _getDouble
movq %xmm0, val2(%rip)
fldl val2(%rip)
fmulp %st, %st(1)

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall

.end

