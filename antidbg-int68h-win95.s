.data
msga db "debugger detected", 0x0A, 0
msgb db "no debugger", 0x0A, 0
.text
global _start
_start:
  mov ah, 43h
  int 68h
  cmp ax, 0f386h
  jz debugger
  jnz nodebugger

debugger:
  mov ah, 09h
  mov dx, offset msga
  int 21h
  jmp exit
nodebugger:
  mov ah, 09h
  mov dx, offset msgb
  int 21h
  jmp exit
exit:
  mov ax, 4C00h
  int 21h
