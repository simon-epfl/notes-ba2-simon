mysteriouscode:
    # Charge 0 dans le registre t0
    li   t0, 0
    # Charge s0 dans le registre t1
    add  t1, zero, s0
    # Charge l'élément stocké à l'adresse s0 dans t2
    lw   t2, 0(s0)
    # Charge l'élément stocké à l'adresse s0 dans t3
    lw   t3, 0(s0)

label0:
    # Charge l'élément stocké à l'adresse t1 dans le registre t5
    # (t1 était égal à l'adresse s0)
    lw   t5, 0(t1)
    # Compare t2 (qui était s0) avec t5 (qui était aussi s0)
    # t2 < t5
    slt  t4, t2, t5
    # Si les deux sont différents, alors branche sur label1
    bne  t4, zero, label1
    # si t5 < t2, alors t2 = t5
    add  t2, zero, t5
label1:
    # Comparer t5 et t3 (t5 < t3)
    slt  t4, t5, t3
    bne  t4, zero, label2
    // si t5 > t3 alors t3 = t5
    add  t3, zero, t5
label2:
    # On augmente t0 de 1, et t1 de 4
    addi t0, t0, 1
    addi t1, t1, 4 # comme ça dans le label0 on passe au prochain élément
    # ici s1 semble stocker la quantité d'éléments dans le tableau
    bne  s1, t0, label0
    # t4 semble stocker la somme du min et du max
    add  t4, t2, t3
    # et ensuite on divise par deux, on calcule une moyenne !
    srai s2, t4, 1
