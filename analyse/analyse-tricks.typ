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

= Tricks et méthodes d'Analyse II

== Tricks utiles des séries

=== Série 1

- ne pas oublier la constante d'intégration
- ex.2, q.3 $integral (\dy)/(sqrt(u)) =  "arcsinh"(u) $
- ex.2 q.4, attention à chaque fois qu'on divise, à vérifier si on ne perd pas de solution
- ex.3 q.2 intégrer $u'u$ et $sin^2(x) = 1/2(1-cos(2x))$

=== Série 2

- ex.1 q.2, attention à bien mettre le moins toujours du côté sans logarithme, c'est plus simple
- ex.1 q.3, attention à bien faire rentrer les coefficients devant les logarithmes dedans
- ex.2 q.3, bien savoir isoler y
- ex.3 q.3 double intégration par partie
- ex.3 q.4 méthode D.I.
- ex.4 mettre la constante d'intégration directement dans le logarithme + intervalle

=== Série 3

NA

=== Série 4

- ex.2 q.3 intégrale pénible de $(sin^2(x))/cos(x)$
- ex.3 changement de variable pénible

=== Série 5

- ex.5 vérifier les visualisations (parfois difficiles) avec Geogebra

=== Série 6

- ex.2 difficile pour savoir quelles suites utiliser
- ex.3 q.3 attention coordonnées sphériques
- ex.3 q.4 développement limité très très cool, à savoir refaire
- ex.5 penser à définir une fonction $f$ qui respecte les critères
- ex.6 q.1 attention, rappel d'analyse I
- ex.6 q 2

=== Série 7

- ex.1 q.1 se souvenir de la symmétrie des dérivées partielles
- ex.1 q.2 se souvenir que $2^(3^2) eq 2^9 eq.not 2^(3 dot 2) $
- ex.3 à refaire absolument, permet de comprendre pourquoi 

=== Série 8

- ex.1 se souvenir de quand on ne peut pas calculer les dérivées directionnelles avec le gradient + calcul de limites
- ex.1, 2, 3 pour choisir comment calculer les dérivées directionnelles
- ex.5 pour la formule de la dérivation de composition de fonctions

=== Série 9

- ex.1 très utile pour comprendre les changements de variable. Attention, se rappeler que :$ partial/(partial x)((partial f)/(partial u)) eq.not (partial^2f)/(partial x partial u)  " ! car f n'est pas exprimée en fonction de " x $
$ partial/(partial x)((partial f)/(partial u)) eq (partial^2 f)/(partial u^2) (partial u)/(partial x) + (partial^2 f)/(partial v^2) (partial v)/(partial x) $

=== Série 11

- ex.1 se souvenir que $(a+b)/2 >= sqrt(\ab)$
- ex.2 q.1 système très sympa à résoudre (voir précédente rédac.)

=== Série 13

- ex. 2 : attention à être très systématique quand on remplace les $x$ et les $y$, c'est facile de remplacer la mauvaise variable en examen
- ex. 2 : ce n'est pas parce qu'on évalue en 0 qu'on a aucun terme qui apparaît, exemple (x + 1). être très systématique là-dessus aussi
- ex. 3 : ne pas intégrer le domaine d'intégration mais la fonction. mdr INM 8h30 ça pique.
- ex. 4 : pour inverser les bornes le schéma est bien mais il faut savoir le faire sans pour les intégrales compliquées : poser les \inéquations et apppliquer les opérations pour isoler selon la bonne variable

#pagebreak()

== Anciens examens



#pagebreak()

== Méthode de changement de variable

On veut poser $x = e^t$

$x$ devient $x(t)$ et $y(x)$ devient $z(t) = y(x(t)) = y(e^t)$

On dérive $z$ une ou deux fois, puis on isole $y'$, $y''$. \
*Important :* on dérive par rapport à *t*! Donc si on dérive $e^t$, on obtiendra $e^t$, *et non* $\te^t$!

#pagebreak()

== Méthode de résolution des intégrales

- méthode D.I. ex $ F(x) = integral x^3e^x $

#table(
  columns: (auto, auto, auto),
  align: horizon,
  table.header(
    [*Signe*], [*D*], [*I*]
  ),
  "+", $x^3$, $e^x$,
  "-", $3x^2$, $e^x$,
  "+", $6x$, $e^x$,
  "-", $6$, $e^x$,
  "+", $0$, $e^x$,
)
Lire en diagonale de D vers I.

$ f(x) = x^3e^x - 3x^2e^x + 6x\e^x - 6$

#pagebreak()

== Méthodes de résolution des équations différentielles

=== EDVS

Séparation des variables puis intégration :

$ y' = lambda y \
arrow.l.r.double (\d\y)/(\d\x) = lambda y \
arrow.l.r.double integral (1/y) \dy = integral lambda\d\x \
arrow.l.r.double y = C\e^(lambda\x)
$

=== EDL1
$ y' + p(x)y = f(x) $

$ y(x) = y_hom (x) + y_"part" (x)  \
y_hom (x) equiv y_hom'(x) + p(x)y_hom = 0 \
y_"part" (x) "est une seule solution particulière" $

Il existe une formule pour calculer directement : $ y_hom (x) = \Ce^(-P(x)), " où " P(x) = integral p(x)\dx " sans constante d'intégration !" $
$ y_"part" = (integral f(x)e^(P(x))\dx) e^(-P(x)) "sans constante également " $

=== EDL2

==== Coefficients constants $y''(x) + \py'(x) + \qy(x) = 0, p, q, in RR$

Soient $a, b in CC$ les racines de l'équation $lambda^2 + p lambda + q = 0$. Alors la solution générale est :

$ y(x) = cases(
    C_1e^(\ax) + C_2e^(\bx) "si" a eq.not b\, a\,b in RR,
    C_1e^(\ax) + C_2\xe^(\ax) "si a = b",
    C_1e^(alpha x)cos(beta x) + C_2e^(alpha x)sin(beta x) "si" a = alpha + i beta = overline(b) in.not RR
) $

==== Méthode des coefficients indéterminés

$R_n(x), P_k(x), Q_m(x)$ sont des polynômes de degrés $n, m, k "et" c, a, b in RR$

$f(x)$ est-elle une combinaison linéaire de $e^(\cx)R_n (x) "et" e^(\ax)(cos(\bx)P_k (x) + sin(\bx)Q_m (x)) "?"$

Si non, la méthode ne marche pas. Utiliser la méthode de variation de constante.

===== Si f est une combinaison linéaire de $e^(\cx)R_n (x)$, le nombre $c in RR$ est-il une racine de l'équation caractéristique $lambda^2 + lambda \p + q = 0$ ? \
#sym.arrow si *oui*, $y_"part" = x^\re^(\cx)T_n (x)$ \
#sym.arrow si *non*, $y_"part" = e^(\cx)T_n (x)$

#text(style: "italic")[où $r$ est la multiplicité de la racine $lambda = c$ (1 ou 2), et $T_n(x)$ est un polynôme de degré n à coefficients indéterminés]


===== Si $f(x) = e^(\ax)(cos(\bx)P_k (x) + sin(\bx)Q_m (x))$, le nombre $a + \ib$ est-il une racine de  l'équation caractéristique $lambda^2 + p lambda + q = 0$ ?

#sym.arrow si *oui*, $y_"part" = \xe^(\ax)(T_N (x)cos(\bx) + S_N (s)sin(\bx))$ \
#sym.arrow si *non*, $y_"part" = e^(\ax)(T_N (x)cos(\bx) + S_N (s)sin(\bx))$

#text(style: "italic")[où $N = max(k, m)$, $T_N(x)$ et $S_N(x)$ sont des polynômes de degré N à coefficients indéterminés]

===== Deux cas

Si $f(x) = f_2(x) + f_3(x)$, alors il faut utiliser la méthode pour $f_2(x)$ et $f_3(x)$ séparément et appliquer le principe de superposition des solutions :$ y_"part"(x) = y_"part 2"(x) + y_"part 3"(x) $

===== Ensuite, remplacer $y_"part"$ dans l'équation

Pour trouver les coefficients des polynômes, remplacer $ y_"part", y'_"part", "etc."$ dans l'équation. 

==== Méthode de la variation de constante

Soit une EDL2. On a $y_1 "et" y_2$ deux solutions à l'équation homogène $C_1y_1 + C_2y_2 = 0$. On veut chercher la solution générale $C_1(x)y_2 + C_2(x)y_2 = f(x)$.

1. Calculer le Wronskien des deux solutions indépendantes trouvées :
$ W(\y_1​, \y_2​) (t) = \y_1​(t)\y_2 '(t) − \y_2​(t)\y_1 '(t) $

2. Trouver $C_n '(x)$

$ C_1 '(x) = (-y_1 (t)f(t))/(W(y_1, y_2)(t))$ \
$ C_2 '(t) = (-y_2 (t)f(t))/(W(y_1, y_2)(t))$

Ensuite on intègre pour trouver $ C_1,C_2$

#pagebreak()

== Ensemble dans $R^n$

Intuition pour savoir si un ensemble est fermé ou ouvert :

Est-ce que pour chaque point de l'ensemble, on peut aller encore un tout petit peu plus loin en appartenant toujours à l'ensemble ? Par exemple ce n'est pas le cas pour une droite, si on bouge un peu, on n'appartient plus à la droite.

L'objectif c'est de prendre un point arbitraire de l'ensemble, de calculer sa distance $d$ à la frontière de l'ensemble, et de prendre par exemple $d/2$.

=== Définitions utiles

- *Adhérance* de l'ensemble $E$, notée $overline(E)$ : l'intersection de tous les ensembles fermés contenant $E$ (on parle bien de l'intersection, donc intuitivement on retient que c'est le plus petit ensemble fermé qui contient E).

Si $E$ est fermé alors $E = overline(E)$.

- *Frontière* de l'ensemble $E$, notée $partial E$. Un point $overline(x)$ appartient à la frontière de $E$ si toute boule ouverte autour de $overline(x)$ contient au moins un point dans E et dans CE.

Par exemple pour un ensemble carré ouvert, si on choisit un point $overline(x)$ sur le bord du carré (qui n'appartient donc pas à l'ensemble), la boule autour de $overline(x)$ appartiendra forcément à l'intérieur du carré et à l'extérieur #sym.arrow $overline(x)$ est un point frontière.

- Ensemble *compact*, s'il est fermé et borné.

/*
#pagebreak()

== Méthode pour trouver min/max

- chercher les points stationnaires $nabla f(x,y) = (0,0)$ par exemple
- calculer la matrice $ "Hess"(f) = mat(
  s, r;
  r, t;
) $, calculer le déterminant et étudier le signe de $s$.

=== Sur un ensemble compact

1. trouver les points critiques/stationnaires
2. calculer le min et le max sur la frontière de E (fixer x à sa valeur à la frontière, trouver le y max, puis fixer y à sa valeur à la frontière, trouver le x max). comme pour les fonctions à une variable, on cherche les min/max à l'intérieur de l'ensemble de définition, mais il faut aussi vérifier les valeurs aux extrêmités !
*/

#pagebreak()

== Calcul de limites dans $RR^n$

Déjà, il faut avoir une intuition de si la limite existe déjà ou pas. Démontrer qu'une limite n'existe pas est souvent plus simple de démontrer qu'elle existe.

=== Si la limite n'existe pas

On prend des groupes de suites différents (par exemple quand $(x,y) arrow (0,0)$ on prend le groupe $(1/k, 1/k)$ et le groupe $(0, 1/k)$, avec $k arrow infinity$).

Dans $RR$ on ne peut arriver à un point que par deux moyens ($+$ et $-$). Dans $RR^n$ il y a une infinite de façons d'arriver à s'approcher d'un point; on cherche deux façons qui ont une limite différente.

A essayer :
#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  table.header([*Quand ?*], [*x*], [*y*]),
  "cas général", $1/n$, $1/n$,
  "utile quand il y a des produits", $1/n$, $0$,
  "utile quand il y a des soustractions", $1/n$, $2/n$,
  "utile quand il y a des produits à équilibrer", $1/n$, $1/(n^2)$
)

=== Si la limite existe

Souvent on peut démontrer l'existence de la limite avec les coordonnées polaires. On pose:
#grid(
  columns: (50%, auto),
  [
    $ x = r cos(phi) \
    y = r sin(phi) $
  ],
  [
    $ x = rho sin(theta)cos(phi) \
    y = rho sin(theta)sin(phi) \
    z = rho cos(theta) $
  ]
)

Généralement on fait tendre $r"/"rho arrow 0$ donc si l'expression contient du $r"/"rho$ c'est gagné on sait que la limite sera 0. Si elle ne contient que du $cos(phi), sin(phi)$, $cos(theta), sin(theta)$, c'est aussi gagné, on sait que la limite n'existe pas.

#pagebreak()

== Continuité et dérivabilité dans $RR^n$

=== Etude de la continuité 

Montrer qu'une fonction est continue.

- vérifier qu'elle admet une limite au point où elle est prolongée (souvent en 0), et que sa valeur correspond au prolongement.

=== Dérivées partielles

Pour calculer une dérivée partielle (par rapport à $x$ par exemple) en un point donné :

$ (partial f)/(d x)(overline(a)) =  lim_(t arrow infinity) (f(x_a + t, y_a) - f(x_a, y_a))/t $

Il faut utiliser cette formule si l'expression $(partial f)/(d x)$ n'est pas définie en $overline(a)$.

*Attention :* si les dérivées partielles existent en $overline(a)$ et sont égales, que la fonction est continue en $overline(a)$... ça ne signifie pas que $f$ est dérivable en $overline(a)$ ! (voir ex.3 série 7).

=== Vérifier qu'une fonction est dérivable

Pour vérifier qu'une fonction est dérivable/différentiable en $overline(a)$, on peut :

- utiliser le fait qu'elle doit s'écrire sous cette forme :
$ f(overline(x)) = f(overline(a)) + L(overline(x) - overline(a)) + epsilon(overline(x)) $
où $L = nabla f(overline(a))$

Et vérifier que $ lim_(overline(x) arrow overline(a)) epsilon(overline(x))/(|| overline(x) ||) = 0$.

- vérifier si toutes les dérivées partielles sont continues, une condition plus forte, qui implique que la fonction est dérivable *et* de classe $ C¹$.
- si toutes les secondes dérivées partielles sont continues (les 4!) alors la fonction est de classe $C^2$.

Si on veut prouver *qu'une fonction n'est pas dérivable*, on peut aussi utiliser le théorème de Schwarz. Si les secondes dérivées partielles croisées $partial y partial x$ et $partial x partial v$ ne sont pas égales 

=== Calculer une dérivée directionnelle

La dérivée directionnelle s'exprime en fonction des dérivées partielles (comme en algèbre, on exprime tout vecteur en fonction de ceux de la base).

Ainsi, *seulement si la fonction est dérivable :*
$ D_f (overline(a), overline(v)) = angle.l nabla f(overline(a)), overline(v) angle.r $

Si la fonction n'est pas dérivable :
$ D_f(overline(a), overline(v)) = lim_(t arrow 0) 1/t (f(overline(a) + t v) - f(overline(a))) $

=== Pente maximale / minimale

On veut calculer dans quelle direction la pente de la fonction est maximale, minimale.

On sait que $ D_f (overline(a), overline(v)) = angle.l nabla f(overline(a)), overline(v) angle.r $
Quand est-ce que cette expression est maximale ? Quand $overline(v)$ est ortogonal au gradient de $f$.
Comme $overline(v)$ est un vecteur unitaire, la norme de la pente est égale au gradient.

=== Dérivées de composition de fonctions

On définit la matrice jacobienne comme :

$ J_f = mat(
  (partial f_1)/(partial x_1), ..., (partial f_1)/(partial x_n);
  ..., ..., ...;
  (partial f_m)/(partial x_1), ..., (partial f_m)/(partial x_n);
  
) $

Ainsi:
- si $ f: RR -> RR$, la matrice jacobienne est juste la dérivée. \
- si $ f: RR^2 -> RR$, la matrice jacobienne est le gradient.

On définit $ f = (g " " circle.small " " h)(t)$, $ g : RR -> RR^2$, $h : RR^2 -> RR$. 

On veut calculer $f'(t) = J_f (t)$.

$ J_((g " " circle.small " " h)) (t) = J_g (h(t)) dot J_h (t) $

#pagebreak()

== Equation du plan tangent

L'équation du plan tangent au point $overline(a)$ :

$ z = f(x_0, y_0) + angle.l nabla f(x_0, y_0), (overline(x) - overline(a)) angle.r $

=== Fonctions implicites

$angle.l nabla f(x_0, y_0), (overline(x) - overline(a)) angle.r = 0$

#pagebreak() 
#pagebreak()


== Points stationnaires et min/max

=== Trouver les points stationnaires

Calculer $(partial f)/(partial x_1)$, $(partial f)/(partial x_2)$, etc. et trouver tous les $(x_1, x_2, x_3)$ t.q #underline[toutes les derivées partielles] donnent 0.

pour trouver les points stationnaires il faut souvent résoudre un système d'équations à deux variables.
- essayer de factoriser 
- essayer d'isoler une variable dans l'équation 2) et de la remplacer dans l'équation 1)

=== Calculer la hessienne et l'évaluer en tous les points stationnaires

On définit la hessienne de $f$ comme :

$ "Hess"_f = mat(
  (partial^2 f)/(partial x^2), (partial^2 f)/(partial x partial y);
  (partial^2 f)/(partial y partial x), (partial^2 f)/(partial y^2)
) $

==== Cas où le nombre de variables = 2 :

$ H = mat(r, s; s, t) "la position b, c  = " s " par le théorème de Schwartz" $

Le déterminant est le produit des valeurs propres (dans le cours on a vu les propriétés sur les valeurs propres) donc ça revient à vérifier si :

- $det(H) > 0, r > 0 arrow.double "minimum local"$ \
- $det(H) > 0, r < 0 arrow.double "maximum local"$ \
- $det(H) < 0 "(une valeur propre négative, une positive)" arrow.double "pas d'extremum local"$
- le reste, p. ex si $ det(H) = 0$, on ne sait pas.

Si on a une valeur propre négative, et une positive, ça veut dire que selon un axe on monte, selon un autre on descend.

==== Cas où le nombre de variables = 3 :

$ "Hess"_f = mat(
  (partial^2 f)/(partial x^2), (partial^2 f)/(partial x partial y), (partial^2 f)/(partial x partial z);
  (partial^2 f)/(partial y partial x), (partial^2 f)/(partial y^2), (partial^2 f)/(partial y partial z);
  (partial^2 f)/(partial z partial x), (partial^2 f)/(partial z partial y), (partial^2 f)/(partial z^2)
) $

- $Delta_1 > 0, Delta_2 > 0, Delta_3 > 0 equiv lambda_1 > 0, lambda_2 > 0, lambda_3 > 0 arrow.double "minimum local"$
- $Delta_1 < 0, Delta_2 > 0, Delta_3 < 0 equiv lambda_1 < 0, lambda_2 < 0, lambda_3 < 0 arrow.double "max local"$
- sinon, si $Delta_3 eq.not 0 arrow.double lambda_i < 0, lambda_j > 0 arrow.double "pas d'extremum local"$
- si $D_3 = 0$, on ne sait pas.

=== Quand on ne sait pas ?

Chercher une direction dans laquelle la fonction se comporte comme une fonction qui n'admet pas de min/max, par exemple si on prend la direction $x = x, y = -x$, on peut trouver $f(x, -x) = x^3$, pas de min/max.

=== Vérifier la bijectivité

Calculer la jacobienne de $f$ et vérifier qu'elle est différente de zéro.

== Intégration comme dans série 10

== Fonctions implicites

on a une fonction de la forme $F(x, y) = x^2 + y^2 = 1$ par exemple, on peut exprimer y en fonction de x, on retrouve une fonction $y = f(x)$ à une variable.

Parfois c'est compliqué de retrouver y en fonction de x, donc un théorème nous dit que si $F(a, b) = 0$ et $(partial f)/(partial y) eq.not 0$, alors $ f'(x) = -((partial F)/(partial x) (x, f(x)))/((partial F)/(partial y) (x, f(x))) $


== Extrema sous contraintes

Penser que $f(x,y)$ est la force associée à un potentiel (gravité par ex.). et que $g(x,y)$ est la surface. On cherche le point d'équilibre. On veut donc que $nabla f(x,y)$ soit colinéaire à $nabla g(x,y)$


== trouver le plan tangent

Le gradient est tjrs perpendiculaire à la surface
Imagine une bouteille. Sa surface est entièrement égale à 0°C. Donc dans tt la pièce il y a plein de températures différentes mais elles sont tt 0 sur le bord.

Le gradient sera perp au bord de la bouteille --> il indique l'endroit où il y a du changement, et dans tt les directions vers le bord de la bouteille (la surface), il n'y a pas de changement.

Le plan tangent c'est l'inverse, il doit être perpendiculaire au gradient, donc parallèle à la surface.

== extremas liés

on cherche le maximum de la température dans une certaine aire. 

=== Pourquoi le gradient de G est perpendiculaire à la surface contrainte ?

G représente la surface, c'est-à-dire la contrainte dans laquelle il faut rester. Si on se rapproche du bord de la surface (c'est-à-dire qu'on s'apprête à en sortir), c'est que le gradient de G est perpendiculaire à la surface G de contrainte.

=== Pourquoi le gradient de F doit être colinéaire au gradient de G ?

F représente la température. Quand on reste sur la surface G, quand on atteint un maximum sur cette fonction (sans tenir compte de la contrainte), le gradient de F est forcément perpendiculaire à la surface G (supposons que ce n'est pas le cas. genre le gradient de F est un peu penché, ça veut dire qu'on peut encore bouger en restant dans G pour se déplacer vers ce max. Imagine que tu es sous l'eau sous la glace et que tu veux rejoindre le soleil, tu seras le plus proche pile quand tu vois le soleil au-dessus de toi).

Donc le gradient de F est colinéaire au gradient de G.

Dans le cas où on atteint un maximum absolu de la fonction F, le gradient sera nul donc colinéaire au gradient de G.

=== extrémas liés plusieurs contraintes

là faut pas faire grad f = lambda grad g1 et grad f = lambda_2 grad g2 !
Imagine que tu es dans une pièce, et que la première contrainte t'oblige à rester sur le sol. Imagine qu'un plan coupe la pièce verticalement (deuxième contrainte).
Donc il reste une droite à la fin. 
Mais tu vas pas chercher les points parallèles à la fois au plan et au sol, c'est impossible de l'être à la fois !

#pagebreak()

== Intégration

=== Changement de variables (concept)

On pose $ G(u, v) = mat(u/2, v/2) $
$ H (x, y) = (2x, 2y) $ 
$ J_G (u, v) = mat(1/2, 0; 0, 1/2) $

Ce changement de variable double les x et les y. Donc quand on calcule l'aire par rapport à $u, v$ on doit diviser par 4, le déterminant de la jacobienne de G.
$ integral integral f(x, y)\dx\dy = integral integral f(G_1(u, v), G_2(u, v))|det(J_G (u, v))|\du\dv $

=== Dessiner

Ex. 
$ 0 <= x <= y <= 4x $
$ 1 <= \xy <= 2 $

On essaye de réécrire pour isoler $y$ en fonction de deux courbes qui dépendent de $x$.

=== Changement de variables (méthode)

là on essaye de réexprimer les relations entre $x$ et $y$ de telle sorte à ce qu'on ait des nombres (bornes) entre une expression en fonction de $x$ et $y$

$ 1 <= y/x <= 4 $
$ 1 <= \xy <= 2 $

et on pose le changement de variables $y/x$ et $\xy$

=== Inverser les bornes

Réecrire avec les inéquations : $ 0 <= x <= 4$ et $ 1/3x <= y <= 9$.

Puis on obtient $x <= 3y$ de la deuxième, $0 <= x <= 3y$ de la première et maintenant on doit encadrer $y$.

$(1) arrow.r.double 0 <= 3y <= 4 arrow.r.double 0 <= y <= 4/3 $

#pagebreak()

== Polynôme de Taylor

$ f(overline(x)) tilde.eq f(overline(a)) + gradient f(overline(a)) (overline(x) - overline(a)) + 1/2 (overline(x) - overline(a))^T dot H"ess"_f (overline(a)) dot (overline(x) - overline(a))  $

