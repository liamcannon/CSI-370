//
//  assembly.s
//  Assignment-11
//
//  Created by Liam Cannon on 11/29/21.
//
// The write works
// I can't figure out why the read does not work I've started at this for the last hour and a half

.data

file_read_name: .asciz "output.txt\0"
file_write_name: .asciz "test.txt\0"


file_handle: .long 0
data_read: .quad 0


.bss
.lcomm data, 4096

.text
.global _main
_main:
 # 23 - 37 reading initial file
movq $0x2000005, %rax        # system open (5)
leaq file_read_name(%rip), %rdi   # path
movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
movq $0444, %rdx             # mode (permissions)
syscall
movq %rax, file_handle(%rip)

movq $0x2000003, %rax        # system read (0)
#movq file_handle(%rip), %rdi
leaq data(%rip), %rsi        # address
movq $4096, %rdx              # size of buffer (data)
syscall
movq data_read(%rip), %rax

movq $0x2000004, %rax        # system write (4)
movq $1, %rdi                # file handle STDOUT (1)
leaq data(%rip), %rsi      # address
movq $4096, %rdx         # length
syscall

movq $0x2000006, %rax        # system close (6)
movq file_handle(%rip), %rdi # file handle
syscall

# here on for writing to new file

movq $0x2000005, %rax        # system open (5)
leaq file_write_name(%rip), %rdi   # path
movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
movq $0666, %rdx             # mode (permissions)
syscall
movq %rax, file_handle(%rip)

movq $0x2000004, %rax        # system write (4)
movq file_handle(%rip), %rdi # file handle
leaq data(%rip), %rsi        # address
movq data_read(%rip), %rdx   # length
syscall

movq $0x2000006, %rax        # system close (6)
movq file_handle(%rip), %rdi # file handle
syscall

movq $0x2000001, %rax        # system exit (1)
movq $0, %rdi                # return value
syscall

.end
