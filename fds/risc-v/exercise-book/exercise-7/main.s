main:
    # this will be my pointer for both arrays
    lw t1, 0(s0)
    # this will be my index for both arrays
    add s4, zero, zero
    # this will be my counter of diff. signs
    add t2, zero, zero
    # this will be the thing i'll compare after each comp. to see if I went to the end
    lw t3, 0(s2)
    beq t3, zero, finish

compare_next_idx:
    # load the next element from array1
    lw t5, 0(t1)
    # load the next element from array2
    lw t6, 0(t2)
    # compare the signs
    slt t4, t5, zero
    slt t5, t6, zero
    # if they are different 
    bne t5, t4, increase_count_then_increase_idx
    j increase_idx

increase_idx:
    addi t1, t1, 4
    addi t2, t2, 4
    addi s4, s4, 1
    bne s4, t3, compare_next_idx
    j finish

increase_count_then_increase_idx:
    addi t2, t2, 1
    j increase_idx

finish:
    nop
