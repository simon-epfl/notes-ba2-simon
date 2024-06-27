add t0, t2, t4
sltu t2, t0, t2 #  check whether |t2 + t4| < |t2|
# si t2 est 1, on a un problème (une carry!)
add t5, t3, t5 # on ajoute t3 à t5
add t1, t2, t5 # t1 = [carry] + t5
