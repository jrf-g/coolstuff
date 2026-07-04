bits 32
Extrn LoadLibraryA : PROC
Extrn MessageBoxA : PROC
.data
softdir db "\nmtrans.dll", 0 ; replace this with the path from antidbg-findsoftice.asm
softsym db "NmSymSoftICELoaded", 0
found db "found debugger"
unfound db "did not find debugger"
.text
global _start
_start:
call LoadLibraryA, offset softdir
test eax, eax
jz nofound
call GetProcAddress, eax, offset softsym
text eax, eax
jz nofound
call eax
nofound:
jnz found
call MessageBoxA, 0, offset unfound
dbgfound:
call MessageBoxA, 0, offset found
