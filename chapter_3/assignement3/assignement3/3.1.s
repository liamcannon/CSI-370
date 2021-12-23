//
//  3.1.s
//  assignement3
//
//  Created by Liam Cannon on 9/20/21.
//
.data                               # Start of sections for declaring variables
sum: .long 0x10000                  # Variable that is 1 byte in size and holds 0x10000

message: .asciz "Welcome to Assembly programming.\n Your grade will be randomly assigned\n by the Intel 8086 processor!"          # creating a string that preserves line breaks and an introductory message

.bss                                # start of section for uninit

.lcomm input, 1                     # Allocates variable input to hold 1 byte

.text                               # start of code section
.global _main                       #declaring main as global so be accessed from outside program
_main:                              # label for entry point

movb $0b11001000, input(%rip)       # moving 200 as binary to input / setting input to 200

movq $0x2000001, %rax               # set system call for exit
xorq %rdi, %rdi                     # set the rturn value to 0
syscall                             # issue the kernel interrupt
.end                                # End assembling
