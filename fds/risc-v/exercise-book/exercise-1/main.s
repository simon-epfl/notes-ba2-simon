    li   x1, 0x00123456
    li   x2, 0
    li   x3, 1
    li   x4, 0

loop:
    and  x4, x1, x3
    add  x2, x2, x4
    srai x1, x1, 1
    bne  x1, x0, loop

