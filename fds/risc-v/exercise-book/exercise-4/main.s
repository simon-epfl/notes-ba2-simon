# compute
add t2, t0, t1

# compute sign
slt t3, t0, zero
slt t4, t2, t0

bne t3, t4, overflow

overflow:
    li t6, 1
