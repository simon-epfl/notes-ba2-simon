li t0, 0xFF
li t1, 0xFF
add t2, t0, t1
bltu t2, t1, overflow // 3 + 1 = 0

// on ne doit vérifier que la somme est supérieure à t0 (et pas à t1)
// genre quand on fait sur 2 bits 3 + 2 = 1 (à cause de l'overflow)
// vérifier que 1 > 2 est suffisant
// si il y a un overflow on ne dépassera jamais un des deux membres de la somme
// parce qu'on va utiliser le premier + une partie du suivant pour arriver à 0

overflow:
    // sltu t6, t2, t1, apparently this is not needed
    li t6, 1
