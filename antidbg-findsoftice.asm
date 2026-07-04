.data
retval dd 0
szver dd 5
szdir dd 0x80
ver db "Current Version", 0
locdir db "InstallDir"
hkeydbg db "Software/NuMega/SoftICE", 0
dtbufn db 200 dup (0)
valbuf db 20 dup (0)
dtbufdir db 200 dup (0)
.text
global _start
_start:
push offset retval
push 0x20016
push 0
push offset hkeydbg
push 0x80000002
call RegOpenKeyExA
test eax, eax
jnz err
push offset szver
push offset dtbufn
push offset valbuf
push 0
push offset ver
push result
call RegQueryValueExA
test eax, eax
jnz err
push offset szdir
push offset dtbufn
push offset valbuf
push 0
push offset locdir
push retval
call RegQueryValueExA
test eax, eax
jnz err
inc al
jmp short ok
err:
mov eax, 1
jmp short exit
ok:
mov eax, 2
jmp short exit
exit:
leave
push eax
call ExitProcess
