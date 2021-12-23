//
//  assignment4.4.s
//  assignment4
//
//  Created by Liam Cannon on 9/27/21.
//
.data

arrayW: .word 5, 10, 15, 20    # creating word array and assigning it to 5, 10, 15, 20
mulVal: .word 8                # creating the word multiplier value and assigning it to 8

.bss

.lcomm answer, 16 #Reserves 16 bytes for array

.text
.global _main
_main:

LEA arrayW(%rip), %rax          # Loading arrayW and putting it in rax
MOVW 0(%rax), %ax               # moving the first value of the array to ax
MULW mulVal(%rip)               # multipling first value by mulVal
LEA answer(%rip), %rbx          # loading the DWORD array
MOV %ax, 0(%rbx)                # moving mutliplied value into answer array

LEA arrayW(%rip), %rax          # Loading arrayW and putting it in rax
MOVW 2(%rax), %ax               # moving the second value of the array to ax
MULW mulVal(%rip)               # multipling first value by mulVal
LEA answer(%rip), %rbx          # loading the DWORD array
MOV %ax, 4(%rbx)                # move result into answer array

LEA arrayW(%rip), %rax          # Loading arrayW and putting it in rax
MOVW 4(%rax), %ax               # moving the third value of the array to ax
MULW mulVal(%rip)               # multipling first value by mulVal
LEA answer(%rip), %rbx          # loading the DWORD array
MOV %ax, 8(%rbx)                # move result into answer array

LEA arrayW(%rip), %rax          # Loading arrayW and putting it in rax
MOVW 6(%rax), %ax               # moving value of the array to ax
MULW mulVal(%rip)               # multipling value by mulVal
LEA answer(%rip), %rbx          # loading the DWORD array
MOV %ax, 12(%rbx)               # move result into 4th spot of answer array
        
//myLoop:
//    LEA arrayW(%rip), %rax
//    MOVW 0(%rax), %ax
//    MULW mulVal(%rip)
//    LEA answer(%rip), %rbx
//    MOV %ax, 0(%rbx)

//    loop myLoop
# I started to make an attempt at looping this but couldn't figure it out in time


mov $0x2000001, %rax            # set system call for exit
xor %rdi, %rdi                  # set the return value to 0
syscall                         # issue the kernel interput
.end                            # End assembling

