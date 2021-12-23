//
//  pin2.s
//  assignement5-ap2
//
//  Created by Liam Cannon on 10/4/21.
//
.data

arrayPin: .byte 2, 3, 0, 9          # practice arrays
//arrayPin: .byte 4, 5, 8, 9
//arrayPin: .byte 4, 3, 0, 9
//arrayPin: .byte 4, 3, 9, 4


.bss

.lcomm isValid, 4           #creating the pin true/false variable

.text
.global _main
_main:

LEA arrayPin(%rip), %rcx    # loading array into rcx

movb 0(%rcx), %ah           # moving the first spot in the array to ah
cmpb $3, %ah                # comparing 3 to val in ah
jl fail                     # if the value is lower than 3 jump to fail
cmpb $6, %ah                # comparing 6 to ah val
ja fail                     # if above jump to fail

movb 1(%rcx), %ah           # moves the 2nd array val to ah
cmpb $1, %ah                # compares 1 to ah
jl fail                     # if lower jump to fail
cmpb $4, %ah                # compare 4 to ah
ja fail                     # if above jump to fail

movb 2(%rcx), %ah           # moves 3rd val to ah
cmpb $7, %ah                # compare 7 - ah
jl fail                     # if lower jump fail
cmpb $9, %ah                # compare 9 - ah
ja fail                     # if above jump to fail

movb 3(%rcx), %ah           # moves 4th val to ah
cmpb $2, %ah                # compares 2 to ah
jl fail                     # if lower jump to fail
cmpb $5, %ah                # compares 5 to ah
ja fail                     # if above jump to fail

jmp pass                   # if everything passes jump to pass

fail:                       # fail jump
movb $0, isValid(%rip)      # setting the isValid var to 0

pass:
movb $1, isValid(%rip)      # setting isValid var to 1

mov $0x2000001, %rax            # set system call for exit
xor %rdi, %rdi                  # set the return value to 0
syscall                         # issue the kernel interput
.end
