mon_mesureur_de_chaines:
    # my pointer to the current address to read
    lw t1, 0(s0)
    # my counter
    add s1, zero, zero

load_next_char:
    lb t3, 0(t1)
    beq t3, zero, finish
    add s1, 1, 1
    addi t1, t1, 1
    j load_next_char

finish:
    nop
