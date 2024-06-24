#set text(font: "DejaVu Sans")
#show heading.where(level: 1): contents => text(size: 20pt, contents)
#show heading: contents => pad(bottom: 10pt, contents)
#set quote(block: true)
#set heading(numbering: (ignore_first, ..n) => {
  if (n.pos().len() != 0) {
    numbering("1.1.", ..n)
  }
})
#let stick-together(a, threshold: 3em) = {
  block(a + v(threshold), breakable: false)
  v(-1 * threshold)
}

= Tricks de FDS (part II)

#pagebreak()

== Cours

- set-reset latch: type de circuit de mémoire basique utilisé en électronique. deux entrées : S et R. Elles sont asynchrones (pas besoin que la clock passe en front montant ou en front descendant pour qu'elles marchent) ! Elles ne dépendent que des inputs.
- D latch : comme un set-reset latch, mais plus contrôlable (input R devient input C qui nous permet de contrôler quand on veut que l'output du latch se verrouille ou suive la valeur de S).
- D flip-flips : comme un D latch, mais l'output ne prend la valeur de S que quand l'input C change de valeur (devient vrai). Quand il est vrai, même si S change, l'output reste fixe (à la valeur qu'il avait quand C était en front montant).

#sym.arrow on utilise l'horloge pour décider quand notre state change, pour des soucis de synchronisation ! En effet si les composants commencent à maj leur valeur n'importe quand, et d'autres à un moment précis, on a des pb de stabilité (pendant un court moment, un output peut être invalide).

- FSM (finite state machine) --> if Moore then no input (it only takes the previous state), if Mealy it takes both the previous input *and* other inputs


#pagebreak()

== Setup and Hold times

Valerio se tourne, va chercher un stylo chez Habib, et se retourne vers moi. Je prends le stylo toutes les 5 secondes #sym.arrow *clock !* et :
- j'ai besoin de voir le stylo 2s avant de commencer à le prendre (le moment où je vais arriver à 0 mod 5s) #sym.arrow *t_setup !* Cette condition est violée si je vais trop vite (la clock est trop rapide), que Valerio a pas le temps de me montrer le stylo. Soit Valerio doit aller plus vite (on diminue le *t_comb*), soit on doit me ralentir (on dominue le *clock*).
- je mets 1s à prendre le stylo *t_hold !* Cette condition est violée si Valerio va chercher un autre stylo chez Habib trop vite.

$ "on veut que la valeur soit bonne avant le " t_"setup" \ arrow.l.r.double t_c Q + t_"comb" <= t_"clock" - t_"setup" $

Maintenant on rajoute un $ t_"skew"$, qui décale un peu le $t_"clock"$ (c'est du temps bonus qu'on ajoute) : 
$ arrow.l.r.double t_c Q + t_"comb" <= t_"clock" - t_"setup" + t_"skew" $

Calculer le temps entre FF A vers FF B pour calculer $f_max$

$t_c Q_max + t_"comb" + t_"setup" + t_"skew_du_FF_A" - t_"skew_du_FF_B" = "delay" $

Vérifier le hold:

$t_c Q_min + t_"comb" + t_"skew_du_FF_A" - t_"skew_du_FF_B" = "delay" $

#image("metastability.png")

https://www.youtube.com/watch?v=xCA54Qu4WtQ

#image("setup.png")
