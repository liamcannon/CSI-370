extrn ExitProcess : proc

.data
sum QWORD 0
val QWORD 25

.code
_main PROC

mov rax, 0 
inc rax
add rax, 200 
sub rax, val 
mov sum, rax 
dec sum
neg sum

xor rcx, rcx
call ExitProcess
_main ENDP 
END