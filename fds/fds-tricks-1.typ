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

= Tricks de FDS (part I)

== Calculer l'exposant IEEE-754 plus rapidement

Dans tous les cas, peu importe le nombre de bits : 
- `0111111111` représente un exposant de 0.
- `1000000000` réprésente un exposant de 1.

Si on veut un exposant de -3, on part de `0111111111` et on enlève 3 #sym.arrow `0111111100`.
Si on veut un exposant de 3, on part de `1000000000` (1) et on ajoute *2* #sym.arrow `1000000010`.

== Calculer les nombres binaires plus rapidement

On s'approche très près de n'importe quel nombre avec la table de 16. On écrit ensuite le nombre en hexadécimal, puis on convertit en binaire.

*Table de 16*

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Multiple*], [*16 \* Multiple *],
  ),
  "1", "16",
  "2", "32",
  "3", "48",
  "4", "64",
  "5", "80",
  "6", "96",
  "7", "112",
  "8", "128",
  "9", "144",
  "10", "160",
)

== Convertir de Gray Code #sym.arrow.r.l.double Binary

Binary vers Gray Code : \
#sym.arrow on copie le MSB, puis on XOR chaque couple de bits qui suit.
Gray Code vers Binary : \
#sym.arrow on copie le MSB, puis à chaque 1 dans le gray code (ce qui signifie qu'il y avait un changement dans la chaîne originale) on switch entre 0 et 1.

== Comprendre la multiplication en 2's Complement

#image("mult.png")

Pourquoi est-ce qu'on doit negate le dernier multiplicant ? On veut par exemple calculer -17x14.

- Si on fait -17x14 = 101111 x 001110, on fait 2x-17 + 4x-17, etc. jusqu'à avoir 14x-17. Pas besoin de negate !
- Par contre 14x-17 = 001110 x 101111, on fait 14x2 + 14x4 + 14x8 *- 14x32* (c'est pour ça qu'on doit negate le multiplicant).

== Pourquoi on invert, +1 pour changer de signe en 2's complement

Imaginons qu'on ait 17. On cherche donc -17. Inverser les bits de 17 revient à trouver les bits qui, sommés à ceux de 17, donne uniquement des 1. Or, uniquement des 1, en 2's complement, donne -1.

Donc en inversant 17, on a trouvé C tel que 17 + C = -1. Mais nous, on cherche N tel que N = -17 soit 17 + N = 0. Donc on ajoute +1 au complémentaire de C !

== Comment savoir combien de bits de fractions nécessaires après une opération ?

Pour une addition, ce sera toujours le max(f_x1, f_x2). Parce qu'il ne peut pas y avoir de débordement à droite, toujours à gauche.

Oour une multiplication, ce sera toujours f_x1 + f_x2. Pourquoi ? P. ex. en décimal quand on fait ax10^-3 x bx10^-5 ça donne toujours un résultat le plus faible en 10^-8.

dynamic range -> te dit si le système de nombre peut gérer des très grands nombres et de très petits nombres à la fois.

== Propriétés en floating point

#image("accuracy_floating_point.png")
#image("resolution_floating_point.png")

== Pourquoi est-ce qu'on fait un tie to even ?

Si on veut faire une division après l'arrondi (un shift), on perd le risque de faire une nouvelle erreur. Par exemple 3.5 #sym.arrow on peut soit faire 3 soit faire 4. Si on fait 3/2 = 1 et 4/2 = 2. 3.5/2 = 1.75, 2 est plus proche.

== Map de Karnaugh

pour faire une karnaugh map #sym.arrow mettre bien les nombres qui ont une unique différence entre eux à côté 10 11 01 00 (10 et 01 sont à côté parce qu'on considère un tableau comme une boule 3D).

#image("karnaugh.png")

== Pourquoi on écrit la P.O.S en prenant les lignes à zéro et en complémentant ?

En fait on "fuit les zéros", c-a-d qu'on prend toutes les lignes qui donnent zéro, et pour chaque ligne, pour éviter de tomber dedans, on sait qu'il suffit qu'au moins une variable ait une valeur différente. Et on combine le tout avec un "et" pour contrôler qu'on a une variable différente nous permettant de nous "échapper" de tous les zéros.

== Comment faire une soustraction SIMPLE en binaire ?

- on choisit toujours le nombre le plus grand au-dessus (especially en IEEE-754), et si au lieu de faire a-b on fait b-a, on ajoute automatiquement un signe - au résultat.
- sinon, en 2's complement il vaut mieux obtenir la représentation négative de notre nombre et *sommer* les deux.
- sinon, si on obtient une retenue infinie, on ne tient compte *que du premier 1*.

== Comment passer d'une S.O.P à une P.O.S ?

pour passer d'une SOP à une POS, double négation, puis développement, puis application de la négation

#image("pos.png")

== Comment comparer rapidement deux expressions

- si on a les minterms (les S.O.P), on peut les numéroter en fonction des termes positifs (par ex. ab(!c) représente 110, 6).
- si on a les maxterms (les P.O.S), on peut aussi les numéroter en fonction des termes négatifs (par ex. ab(!c) représente 001, 1).
Pour passer de maxterms M1, M4 à la liste des minterms, on prend les complément (m0, m2, m3, m5, etc.).

== Comprendre les delays et les fan-in/fan-out

#image("fanout.png")

Pourquoi est-ce que l'inverter p2 prend 20ns à charger le gate AND à p7 et pas juste 10ns ? (comme il est branché à un seul input ?)

En fait c'est parce que les gate AND à 2 inputs ne sont pas construits de la même façon que les gates à 3 ou 4 inputs, et on affirme dans ce cours que le temps pour charger un input d'un gate est proportionnel au nombre d'inputs que ce gate doit gérer.

Ainsi charger un unique input (donc fan-out de 1) d'un gate à 3 inputs prend 3 fois plus de temps que charger un unique input d'un gate à 1 input.

== Trick cool pour obtenir une full P.O.S

Quand on part d'une P.O.S pas complète, on ajoute juste les termes manquants en (a)(!a) par exemple, puis on factorise, et on utilise que a + (x)(y) = (a+x)(a+y)
$ (a+b)(b+c)(overline(a) + overline(c)) \
  equiv (a+b+overline(c)c)(overline(a)a + b + c)(overline(a) + overline(b)b + overline(c)) \
  equiv (a+(b+overline(c))(b + c))((overline(a) + b)(a + b) + c)((overline(a) + overline(b))(overline(a) + b) + overline(c)) \
  equiv (a+b+overline(c))(a + b + c)(overline(a) + b + c)(a + b + c)(overline(a) + overline(b) + overline(c))(overline(a) + b + overline(c)) \
  equiv (a+b+overline(c))(overline(a) + b + c)(a + b + c)(overline(a) + overline(b) + overline(c))(overline(a) + b + overline(c))
$

*ça donne une technique très simple pour obtenir une full P.O.S.* : quand on a $ (a + b) equiv (a + b + overline(c))(a + b + c) $

== Arrondir rapidement en floating point

On écrit la mantisse avec un bit de plus. On ajoute +1. On prend le résultat tronqué.

== Addition/Soustraction en floating point

On aligne les exposants. On additionne les mantisses *en n'oubliant surtout pas de faire toujours apparaître le hidden bit!* On normalise.

== Convertir un circuit en NAND et NOR

pour les NAND : écrire la Sum of Products (elle n'a pas besoin d'être une full SOP!), puis appliquer 2 fois la De Morgan.

pour les NOR : écrire la Product of Sums (elle n'a pas besoin d'être une full POS!), puis appliquer 2 fois la De Morgan.

ne pas oublier qu'on peut créer un inverter en mettant en chaîne deux NAND ou deux NOR, donc on peut toujours obtenir un OR ou un AND avec des NAND ou des NOR.

#pagebreak()

== Un peu de cours

- in 2's complement : complement and +1 to negate
- detect overflow : wrong sign (summing 2 nb of different signs never produces an overflow)
- PMOS : s'allume quand l'input est 0
- NMOS : s'allume quand l'input est 1
- (f est la fréquence, C la capacitance du condensateur, et V_DD la tension du circuit) $ P_D = f*C*V_D^2 $
- weighted number systems: $ x = sum W_i*X_i $
- radix number systems: $ W_i = W_(i-1) * R_i $
- canonical number system D means that each digit can take all the values between 0 and R (actually I don't know any other representation)
- precision (fixed-point) : the maximum number of non-zero bits (m + f)
- resolution : the smallest non-zero magnitude representable
- range : the difference between the most positive and the most negative number representable
- accuracy : the magnitude of the maximum difference between a real value and its representation
- dynamic range : ratio of the max absolute value representable an the minimum non-zero positive value representable
- quand on additionne deux nombres en floating point, on garde l'exposant le plus grand (et on modifie la mantisse du plus petit pour qu'il ait le même exposant), pour minimiser l'erreur *note: c'est le même fonctionnement pour le block floating point!*.
