addi x2 0(x0)
addi x1 4(x0)
addi x3 1(x0)
sw x2 -2(x1)
sw x3 -1(x1)
add x4 x2 x3
sw x4 0 (x1)
addi x1 1 (x1) 
addi x2 0 (x3)
addi x3 0 (x4)
add x4 x2 x3
sw x4 0 (x1)
addi x1 1 (x1) 
addi x2 0 (x3)
addi x3 0 (x4)
add x4 x2 (x3)
sw x4 0(x1)
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
                     
                     
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
add x4 x2 x3
sw x4 0 x1
addi x1 1 x1 
addi x2 0 x3
addi x3 0 x4
addi x1 0 x1
                     
lw x7 2( x0)
lw x7 3( x0)
lw x7 -16( x1)
lw x7 -15( x1)
lw x7 -14( x1)
lw x7 -13( x1)
lw x7 -12( x1)
lw x7 -11( x1)
lw x7 -10( x1)
lw x7 -9( x1)
lw x7 -8( x1)
lw x7 -7( x1)
lw x7 -6( x1)
lw x7 -5( x1)
lw x7 -4( x1)
lw x7 -3( x1)
lw x7 -2( x1)
lw x7 -1( x1)
beq x3 x4 memory[87]

