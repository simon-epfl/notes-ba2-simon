add t0, t1, t2 // la somme
slti t3, t2, 0 // booléen, si le 2ème est négatif
slt t4, t0, t1 // booléen, si la somme est plus petite que le premier
// si le 2ème est négatif et que la somme est pas plus petite que le premier --> OVERFLOW
// si le 2ème est positif et que la somme est plus petite que le premier --> OVERFLOW
// ==> les deux doivent être égaux
bne t3, t4, overflow
