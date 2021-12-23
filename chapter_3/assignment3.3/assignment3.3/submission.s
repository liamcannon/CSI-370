//
//  File.s
//  assignment3.3
//
//  Created by Liam Cannon on 9/17/21.
//
SECTION .data

SECTION .bss
TEMP: letter 1
TEMP: r 4
TEMP: s 4
TEMP: t 4
TEMP: x 2
TEMP: y 2
TEMP: z 2

SECTION .text
global _main
_main:

mov [rel letter], 0x77
mov [rel r], 0x5
mov [rel s], 0x2
mov [rel x], 0xa
mov [rel y], 0x4

mov ax, [rel x]
add ax, [rel y]
mov [rel z], ax

mov ax, [rel x]
sub ax, [rel y]
mov ax, [rel z]

mov DWORD [edx], 0
mov DWORD [eax], [rel r]
mov DWORD [ecx], [rel s]
div ecx
mov DWORD [eax], [rel t]

mov DWORD [edx], 0
mov DWORD [eax], [rel r]
mov DWORD [ecx], [rel s]
div ecx
mov DWORD [edx], [rel t]

mov QWORD [rax], 2000001h
xor rdi, rdi
syscall


