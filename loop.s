.text
global _start
_start:
  movq %rcx $0
  jmp loopa
loopa:
  jmp loopb
loopb:
  add %rcx $1
  cmp %rcx $50
  jnz loopa
