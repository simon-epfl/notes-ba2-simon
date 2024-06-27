start:
    # notre index de lignes
    add  t0, zero, zero

    add  t1, zero, zero
    add  t3, zero, zero
    add  t5, s0, zero
loop:
    # t2 = le unsigned number 1 de la matrice
    lbu  t2, 0(t5)
    # on ajoute au unsigned nb 1 de la matrice un nombre s3
    add  t2, t2, s3
    slt  t4, t2, t3
    # si t2 + s3 < t3, on skip
    bne  t4, zero, skip
    # s4, s5 stocke l'indice de la colonne et de la ligne de
    add  s4, t0, zero
    add  s5, t1, zero
    # t3 = t2 + s3
    add  t3, t2, zero

skip:
    # on sauvegarde notre modif
    sb   t2, 0(t5)
    # on passe au prochain nombre de la matrice
    addi t5, t5, 1
    # on augmente notre index de lignes
    addi t0, t0, 1
    # si on a pas atteint le nb de lignes, on continue
    bne  t0, s1, loop
    # si on a atteint, alors on reset le nb de lignes et on change de colonne
    add  t0, zero, zero
    addi t1, t1, 1
    # et si on a pas atteint le nb de colonne, on continue
    bne  t1, s2, loop
