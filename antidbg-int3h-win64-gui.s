.data
msga db "debugger detected", 0x0A, 0
msgb db "no debugger", 0x0A, 0
bara db "debugger detection - detected", 0
barb db "debugger detection - not detected", 0
.text
global _start
_start:
  mov eax, 4
  mov ebp, "BCHK"
  int 3h
  cmp eax, 4
  sub rsp, 32
  jnz debugger
  jz nodebugger
debugger:
  xor rcx, rcx                ; hWnd = NULL
  mov rdx, msga               ; lpText set to MsgA
  mov r8, bara                ; lpCaption set to BarA
  mov r9, 0                   ; MB_OK
  call MessageBoxA
  jmp exit
  mov rcx, 2                  ; exit code = 2
  call ExitProcess
nodebugger:
  xor rcx, rcx                ; hWnd = NULL
  mov rdx, msgb               ; lpText set to MsgB
  mov r8, barb                ; lpCaption set to BarB
  mov r9, 0                   ; MB_OK
  call MessageBoxA
  mov rcx, 1                  ; exit code = 1
  call ExitProcess
