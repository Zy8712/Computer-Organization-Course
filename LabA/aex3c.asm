addi x6,x0,0x0000000000000123
andi x7,x6,0x000000000000000f
slli x8,x7,60
andi x9,x6,0x0000000000000ff0
srai x10,x9,4
add x5,x8,x10