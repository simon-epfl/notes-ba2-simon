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

== FSM en Verilog

- next-state logic (en always \@\*).
- next-state update (en always \@\(posedge clock\) avec gestion du reset).
- output update (en always \@\*).

== Trouver la fréquence maximale

- calculer tous les temps $t_"setup" + t_"comb"_"max" + t_"cQ"_"max"$ pour chaque chemin entre deux flip-flops.
- prendre le plus grand temps.
- calculer la fréquence maximale : $f_"max" = 1 / t_"max"$.

== Vérifier les hold violations

- calculer tous les temps $t_"comb"_"min" + t_"cQ"_"min"$ pour chaque chemin entre deux flip-flops
- comparer avec $t_"hold"$

#pagebreak()

== Cours

- set-reset latch: type de circuit de mémoire basique utilisé en électronique. deux entrées : S et R. Elles sont asynchrones (pas besoin que la clock passe en front montant ou en front descendant pour qu'elles marchent) ! Elles ne dépendent que des inputs.
- D latch : comme un set-reset latch, mais plus contrôlable (input R devient input C qui nous permet de contrôler quand on veut que l'output du latch se verrouille ou suive la valeur de S).
- D flip-flops : comme un D latch, mais l'output ne prend la valeur de S que quand l'input C change de valeur (devient vrai). Quand il est vrai, même si S change, l'output reste fixe (à la valeur qu'il avait quand C était en front montant).

#sym.arrow on utilise l'horloge pour décider quand notre state change, pour des soucis de synchronisation ! En effet si les composants commencent à maj leur valeur n'importe quand, et d'autres à un moment précis, on a des pb de stabilité (pendant un court moment, un output peut être invalide).

- FSM (finite state machine) --> if Moore then no input (it only takes the previous state), if Mealy it takes both the previous input *and* other inputs

- clock duty ratio : $ "time of high sign"/"duration of low sign"$

#pagebreak()

== Setup and Hold times

*Contamination Clock To Q*: quand la clock se déclenche, le temps minimum que peut mettre Q à changer.

*Propagation Delay Clock to Q*: quand la clock se déclenche, le temps maximum que met Q à se stabiliser.

#image("q1d2.png")

Pour que D2 prenne correctement la valeur (pas de métastabilité), il faut que Q soit stable, au moins
- $t_"setup"$ : avant que la clock ne se déclenche
- $t_"hold"$ : après que la clock se soit déclenchée

Donc on veut check :
- $t_"cQ"_"max" + t_"comb"_"max" + t_"setup" <= t_"clock"$ (que le temps avant que les calculs commencent + les calculs + le temps de setup soient inférieurs au temps de la clock)
- $t_"cQ"_"min" + t_"comb"_"min" >= t_"hold"$ (que le temps avant que les calculs commencent + les calculs soient supérieurs au temps de hold sinon la valeur n'est pas tenue)

Valerio se tourne, va chercher un stylo chez Habib, et se retourne vers moi. Je prends le stylo toutes les 5 secondes #sym.arrow *clock !* et :
- j'ai besoin de voir le stylo 2s avant de commencer à le prendre (le moment où je vais arriver à 0 mod 5s) #sym.arrow *t_setup !* Cette condition est violée si je vais trop vite (la clock est trop rapide), que Valerio a pas le temps de me montrer le stylo. Soit Valerio doit aller plus vite (on diminue le *t_comb*), soit on doit me ralentir (on diminue le *clock*).
- je mets 1s à prendre le stylo *t_hold !* Cette condition est violée si Valerio va chercher un autre stylo chez Habib trop vite.

$ "on veut que la valeur soit bonne avant le " t_"setup" \ arrow.l.r.double t_c Q + t_"comb" <= t_"clock" - t_"setup" $

Maintenant on rajoute un $ t_"skew"$, qui décale un peu le $t_"clock"$ (c'est du temps bonus qu'on ajoute) : 
$ arrow.l.r.double t_c Q + t_"comb" <= t_"clock" - t_"setup" + t_"skew" $

Calculer le temps entre FF A vers FF B pour calculer $f_max$

$t_c Q_max + t_"comb" + t_"setup" + t_"skew_du_FF_A" - t_"skew_du_FF_B" = "delay" $

Vérifier le hold:

$t_c Q_min + t_"comb" + t_"skew_du_FF_A" - t_"skew_du_FF_B" = "delay" $

#image("metastability.png")

solution : mettre deux flip flop en série. si le premier est métastable, le signal va se stabiliser entre les deux et le deuxième flip flop va prendre un signal non métastable.

https://www.youtube.com/watch?v=xCA54Qu4WtQ

#image("setup.png")

== Clock Skew

différence de temps entre le moment où la clock se déclenche pour le flip flop 1 et le flip flop 2. si le skew est positif, c'est cool ! on a plus de temps pour faire les calculs. si le skew est négatif, c'est moins cool, on a moins de temps pour faire les calculs.

== Memory

Il y a deux MUX : un pour activer l'écriture au bon endroit (qui ne s'active que quand `WE` est vrai), un pour choisir ce qui sort.

#image("dffp.png")

=== Memory dans Verilog

`reg [nombre-de-bits-par-word-1:0] nom-de-la-variable [nombre-de-words-1:0];`

#image("verilog-db.png", width: 50%)
#image("verilog-db-schema.png", width: 40%)

#pagebreak()

== RISC-V

- `li [reg] [value]`: load an immediate into a register
- `and [reg1] [reg2] [reg3]`: bitwise and, stores the result in reg1
- `add [reg1] [reg2] [reg3]`: add, stores the result in reg1
- `srai [reg1] [reg2] [value]`: shift right arithmetic immediate, stores the result in reg1
- `bne [reg1] [reg2] [label]`: branch not equal, jumps to label if reg1 and reg2 are not equal
