li t0, 0        # Initialise le compteur de boucle à 0
add t1, zero, s0 # Copie l'adresse de base de l'array dans t1
lw t2, 0(s0)    # Charge le premier élément de l'array dans t2
lw t3, 0(s0)    # Charge le premier élément de l'array dans t3

label0:
    lw t5, 0(t1)  # Charge l'élément courant de l'array dans t5
    slt t4, t2, t5 # Vérifie si t2 (max) < t5 (élément courant)
    bne t4, zero, label1 # Si oui, va à label1
    add t2, zero, t5 # Met à jour le max avec l'élément courant
label1:
    slt t4, t5, t3 # Vérifie si t5 (élément courant) < t3 (min)
    bne t4, zero, label2 # Si oui, va à label2
    add t3, zero, t5 # Met à jour le min avec l'élément courant
label2:
    addi t0, t0, 1 # Incrémente le compteur de boucle
    addi t1, t1, 4 # Avance au prochain élément de l'array
    bne s1, t0, label0 # Répète la boucle si pas encore à la fin
    add t4, t2, t3 # Somme max et min
    srai s2, t4, 1 # Divise par 2 pour obtenir la moyenne

// 4 bytes
