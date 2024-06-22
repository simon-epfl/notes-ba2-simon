// un word/mot = 32 bits = 4 bytes
// donc un entier = un mot

// donc on commence avec l'addresse du premier byte
// et on doit itérer sur les 3 suivants pour obtenir notre premier entier

// puis répéter pour chaque mot (chaque paire de 4 adresses)

/*

ADR01 -------- (s0)
ADR02 --------
ADR03 --------
ADR04 --------

ADR11 --------
ADR12 --------
ADR13 --------
ADR14 --------

ADR81 -------- (s1)
ADR82 --------
ADR83 --------
ADR84 --------

ADR91 --------
ADR92 --------
ADR93 --------
ADR94 --------

*/

// quand on fait lw reg, addr, les 4 adresses suivantes sont lues (jusqu'à arriver à 4 bytes)

# initialisation
counter_sign:
    # ce sera notre indice (pour vérifier quand on arrive à s2)
    li      t0, 0
    # le nb de différences
    li      t4, 0
    # ce sera les adresses en cours
    add     t1, zero, s0
    add     t2, zero, s1

process_next_i:
    # avant de charger les mots, on regarde si on est pas arrivés à la fin
    lw      t5, 0(t1)
    lw      t6, 0(t2)
    # 1 si actuel négatif
    slt     t7, t5, zero
    # 1 si actuel négatif
    slt     t8, t6, zero
    # todo change that
    bne     t7, t8, save_diff
    # choisir que faire
    j       increase_idx

mark_diff:
    addi    t4, 1
    # choisir que faire
    j       increase_idx
    
increase_idx:
    # gère la fin
    addi    t0, 1
    bne     t0, s2, process_next_i 
    j       end

end:
    # ne rien faire
