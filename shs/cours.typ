#set text(font: "DejaVu Sans")
#show heading.where(level: 1): contents => text(size: 20pt, contents)
#show heading: contents => pad(bottom: 10pt, contents)
#set quote(block: true)
#set heading(numbering: (ignore_first, ..n) => {
  if (n.pos().len() != 0) {
    numbering("1.1.", ..n)
  }
})

#outline(indent: true, title: "SHS - Communcation B (Spring 2024)")

#pagebreak()

== La loi de Moore

=== Les promesses technoscientifiques

- du 16e siècle au 18e siècle #sym.arrow fonction de sensibilisation
- 19e siècle #sym.arrow fonction idéologique

==== Ces promesses sont toujours...

- non dystopiques
- imposent des solutions technologiques
- performatives#footnote[\#olympedegouge], le fait de formuler la promesse contribue à la faire réaliser (orientent les moyens alloués à la recherche & innovation)

==== ...et ont pour contraintes...

- la nécessité de nouveauté radicale (la promesse est la solution unique à un problème urgent)
- crédibilité (soutient des spécialistes, quitte à inventer ces soutiens)

==== Loi de Moore en microélectronique

est un modèle pour la fabrication de promesses technoscientifiques \
#sym.arrow.r.curve définit ce qui est pensable pour l'évolution des micro-processeurs

#box(
  stroke: 1pt + rgb(34, 102, 153), 
  width: 100%, 
  fill: rgb(34, 102, 153, 30), 
  inset: 7pt,
  text(fill : black, [
    #text(fill : rgb(34, 102, 153), 
      [*📖 Contexte* : apparitions des premiers circuits intégrés]
    )
    #pad(top: 1pt)[- Fin 1950 $arrow$ Fairchild Seminconductor fabrique des transistors ($"#"$FDS)
    - Pour inciter d'autres acteurs à faire le pari de l'ouverture de la société civile, Gordon Moore, directeur R&D chez Fairchild, publie un manifeste économique
    - promesse en faveur de l'intégration  :
    #quote(attribution: [Moore, 1965])[
      The future of integrated electronics is the future of electronics itself...
    ]] 
]))

Seconde formulation de la loi :
#quote(attribution: [Moore, 1975], text([#strike(text("The density has increased at a rate of roughly a factor of two per year")), #text("\nThe density has increased at a rate of roughly a factor of two per two years")]))

Pour les CPU, en 2024, il est probable qu'on se détache de cette loi :
- l'énergie est chère
- coûts des lieux de fabrication
- la consommation change (+ d'économie d'énergie over + de performance)

== La course aux GPU

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*CPU*], [*GPU*],
  ),
  "Quelques coeurs: entre 2 et 64", "Plusieurs coeurs: entre 2’000 et 50’000",
  "Faible latence", "Haut débit de données",
  "Bon pour le traitement en série", "Bon pour le traitement en parallèle",
  "Peut effectuer une poignée d’opérations à la fois", "Peut effectuer des milliers d’opérations à la fois"
)

Les G.P.U. (graphical processing units) sont très efficaces pour la multiplication de matrices (donc très utiles pour l'I.A.).

=== Loi de Huang

#quote(attribution: [Jensen Huang (CEO Nvidia, leader des cartes GPU)], "Les performances des GPUs seront plus que doublées chaque 2 ans", )

=== Optimisation

*Représentation des nombres :* réduction de la précision pour accélerer les calculs. (2019, Google, grâce au brain floating point).

*Nouvelles cartes :* 
- le T.P.U. (Tensor Processing Unit) par Google (2015), conçu pour les réseaux de neurones (fonctionne avec Tensorflow)
- le L.P.U. (Language Processing Unit) par Groq
- Apple Série M (système sur une unique puce SoC : CPU, GPU, mémoire unifié)

et beaucoup d'autres entreprises (AWS...)

=== Etat du marché

Nvidia domine, tensions géopolitiques liées aux semi-conducteurs.

== Les modèles de langue

LLM : Large Language Model

=== Recette d'un bon LLM

- bcp de paramètres (x10 chaque année, nouvelle loi de Moore ?)
- de la puissance de calcul
- bcp (bcp) de données (seront épuisées en 2026 !)

== Des booms et des hivers de l'IA

Historiquement, les technologies IA ont traversé des phases de booms et de crises.

=== Genèse et 1er boom de l'IA (1940–1965)

Seconde Guerre mondiale #sym.arrow augmentation de la demande en calcul \
- Angleterre #sym.arrow décryptage ("Bomb", "Coloss") \
- U.S.A. #sym.arrow calcul balistique (ENIAC)

1942 : Moore School of Electrical Engineering, pour accélérer la production de tables de tir.

1943 : \$400k alloués à la constructeur de l'ENIAC (le dispositif prend le nom de "computer") \
#sym.arrow.r.curve très innovant mais problème d'architecture

1944 : nouveau projet dérivé de l'ENIAC, le *EDVAC* (notament grâce à John von Neumann).

Formalisation de l'*architecture Von-Neumann* (encore très utilisée aujourd'hui) :

#image("neumann.png")

Juin 1945 : Neumann publie un rapport sur EDVAC (utilise des analogies avec le cerveau pour la première fois)

1949 : 1er ordinateur BINAC (référence à UNIVAC, 1951), les ordinateurs/calculateurs sortent progressivement de la recherche militaire #sym.arrow *industrie et administration*.


1956 : 1ère appartition du terme I.A. (John McCarthy)

1960 : premier boom de l'IA dite "symbolique" \
#sym.arrow.r.curve recherche logicielle visant à décrire les règles de pensée et les exprimer sous forme de code informatique (par ex. chatbot ELIZA).

Un groupe fermé de chercheurs s'arroge le monopole de la définition des enjeux de l'IA. \
#sym.arrow.r.curve capture l'essentiel des financements (75% de US Air France) \
#sym.arrow.r.curve conserve l'accès aux grands systèmes informatiques

... cela conduit au premier hiver.

=== Premier hiver de l'IA (1965-1975)

#sym.arrow promesses des promoteurs de l'IA symbolique n'ont pas été tenues \
#sym.arrow à partir de 1970, baisse des financements (notamment militaires) \
#sym.arrow accusés de se concentrer sur des "mondes jouets"

=== Systèmes experts experts et 2ème boom (1975-1985)

Renouveau de l'IA symbolique (ordi + puissant et décomposition des processus de raisonnement en briques élémentairs)

*Système expert :*

#image("expert.png")

1970 : système MYCIN \
#sym.arrow série de questions au médecin \
#sym.arrow env. 600 règles \
#sym.arrow produit une liste de bactéries candidates

1980 : XCON pour aider à configurer les ordinateurs

1984 : DELTA pour identifier les pannes sur les locomotives

*Limites des systèmes expert :*

#quote(attribution: [Edward Feigenbaum, 1983])[
  Dans les décennies à venir, nous devrons disposer de moyens plus automatiques pour remplacer ce qui est actuellement une procédure très fastidieuse, longue et coûteuse.
]

=== Deuxième hiver et travail de l'ombre

Des promesses non tenues (encore...) \
#sym.arrow problème de hardware \
#sym.arrow problème de maintenance des logiciels \
#sym.arrow la plupart des startups ont fait faillite

1990 : IA symbolique est si affaiblie que le terme disparaît quasiment du vocabulaire de recherche.

==== Parallel Distributed Processing

1986 : à l'écart de l'IA symbolique, un groupe de chercheurs travaille sur les *réseaux de neurones* (notamment reconnaissance des codes postaux)

notion de rétropropagation du gradient (ajuster les paramètres du modèle en fonction des erreurs qu'il commet)

LeNet-1, reconnaissance de chiffres \
LeNet-2, reconnaissance de caractères (reconnaissances de ZIP codes par ex.)

=== Réseau de neurones profonds et 3ème boom (2005-2024)

==== Avènement du Deep Learning :
- puissance de calcul augmente (performances des cpu #sym.arrow.tr + GPU)
- réseaux de neurones + profonds

==== Numérisation et essort d'Internet

- quantité de données #sym.arrow.tr
- mise en place de plateformes de crowdsourcing (pour labelliser des données)

Exemple : ImageNet (1k catégories d'objets, 1.2M d'images)

2012 : reconnaissance d'objets, meilleurs performances sur ImageNet (25% #sym.arrow 16%) grâce aux *filtres de convolution*.

2015 : ResNet

#sym.arrow application d’une même transformation linéaire sur différentes zones de l’image \
#sym.arrow on part de petites matrices (3x3) en demandant au modèle de générer de grandes matrices (5x5) *, chaque groupe est une couche de convolution*.

Il y a plusieurs *cartes d'activation* (filtre = feature, appris à l'entraînement) à la sortie de chaque couche.

Chaque convolution est suivie d'une *fonction d'activation* non linéaire.

Réduction des cartes d’activation par *opération de pooling*.

La dernière couche est la couche *de classification*, qui détermine la sortie avec poids (appris pendant l'entraînement).

== Des booms et des hivers de l'IA (II)

=== Genèse: memorandum de Weaver et démos. publiques (1950-1965)

1949 : Weaver suggère une meilleure approche (statistique et probabiliste) que celle de la traduction linéaire

1954 : première démonstration publique à New York, traduction de russe à anglais en public.

=== Crise: le rapport ALPAC et ses conséquences (1965-1990)

1966 : le rapport ALPAC (Automatic Language Processing Advisory Committee)

#quote(attribution: [National Research Council, 1966])[Il n’y a aucune urgence dans le domaine de la traduction. Le
problème n’est pas de satisfaire un besoin inexistant à travers des
systèmes de traduction automatiques inexistants]

peu de bénéfices à court-terme #sym.arrow *chute drastique des financements.*

=== Renouveau et tradition statistique (1990-2015)

1990 : apparition de corpus parallèles (utiles pour la traduction)

1992 : rapport JTEC (Japan Technology Evaluation Center) et incitations politiques (convaincre les gouvernements d'utiliser les nouvelles technologies)

mais aussi puissance de calcul et stockage #sym.arrow.tr \
et nouvelle culture statistique, probabiliste

==== Focus sur modèles de traduction basés sur les groupes de mots

1993 : IBM introduit plusieurs modèles statistiques pour la traduction (corpus parallèles issus du parlement canadien)

2006 : Google Translate, basée sur cette méthode

===== Comment ça marche ?

- segmentation des phrases en groupe de mots (tokens)
- recherche de correspondances les + probables
- assemblage des correspondances

===== Limitations de l’approche statistique

- traduction fausse si syntaxe non courante
- utilisation de l'anglais comme "langue pivot" (FR #sym.arrow EN #sym.arrow IT)

=== Traduction automatique par réseau de neurones (2014-2024)

==== Boom des ConvNets

Entre 2012 et 2015 : boom des ConvNets pour traitement des images

===== Comment ça marche ?

Comment apprendre le langage naturel avec des réseaux de neurones?

- les machines comprennent le langage binaire
- les réseaux de neurones doivent recevoir en entrée des données continues
- le texte est représenté par des symboles discrets (lettres, chiffres, caractères spéciaux, etc.)

*Problème :* avec ASCII, l'encodage binaire, un mot n'est pas défini par ses lettres, impossibilité d'apprendre le sens d'un mot avec binaire. (ex chouette #sym.eq.not brouette).

*Solution :* encodage one-hot : grâce au word embeddings un graph basé sur le sens tous les mots va se former.

Pour cela : on prend la probabilité de coocurrence P(c/w), puis on réduit les dimensions trouvées pour être + ou - précis dans la compréhension (grâce à la SVD).

#sym.arrow une méthode efficace mais peu efficiente (ça a pris 4 mois pour s'entraîner sur Wikipedia).

===== word2vec (2013)

- modèle linéaire
- tricks pour améliorer l'apprentissage des mots rares
- code open source en C
- apprentissages de word embeddings en quelques minutes

Exemple : déterminer si un avis est positif ou négatif.

==== Réseaux récurrents

- adapté au langage, qui est séquentiel

2014 : premiers réseaux de neurones récurrents pour la traduction
automatique

==== Long-Short Term Memory (LSTM) Network (traduction)

Problème de l'époque : apprentissage des réseaux récurrents difficile pour les longues
séquences.

Une idée des années 90 refait surface: LSTM networks.

2016: Google Translate opte pour un modèle de traduction neuronal basé sur les LSTM

===== Limites des LSTM-RNN

- problème d'optimisation
- modèles séquentiels difficilement parallélisables
- architecture peu efficace sur GPU
- temps d'apprentissage + long

==== Transformer: Attention Is All You Need

- 2017: nouvelle architecture basée uniquement sur le mécanisme d’attention
- efficace sur GPU (entraînement + rapide)
- les RRN n'ont pas dit leur dernier mot (transformer + rapide en entraînement mais gourmands en mémoire)
- Mars 2024: Google DeepMind présente deux nouveaux modèles de langue basés sur des RNNs

*Mécanisme d'attention :* fait attention au contexte des mots en l'entourant.

== Supervision et apprentissage automatique

=== Apprentissage supervisé

Une fois qu'un jeu de données est disponible, les chercheurs la divise en 2 sous-ensembles :
- jeu d'entraînement
- jeu d'évaluation

==== Des avancées et des limites

- biais de sélection des données
- biais des annotations des données
- coût de l'annotation des données (contraîntes de temps : ex. annotation de contrats juridiques 1/4 de temps juste pour les annoter).

=== Apprentissage auto-supervisé

Yann Le Cun “Cake Analogy” : la grosse partie du gâteau est faite avec un apprentissage non supervisé, et le glaçage, la cerise, est faite avec un peu d'apprentissage supervisé.

==== Apprentissage des données d'entrée

- apprendre à prédire le mot d’après, ou les mots cachés
- GPT (Generative Pre-Trained Transformer) #sym.arrow prédire le mot suivant
- apprendre des images avec des tâches "prétextes" prédéfinies (rotation, mettre en couleur)

*Apprentissage discriminatif auto-supervisé:* utilise un signal discriminant entre les images.

==== Apprentissage contrastif

Apprendre à déterminer quelles images sont similaires avec qui. \
(on donne des paires d'images positives, c'est-à-dire d'un même set, et des paires d'images négatives)

Exemple : *modèle CLIP*, auto-supervision avec 400M de paires (image, description) collectées sur le web. Performances équivalentes à ImageNet. Meilleures généralisation des données inconnues.

=== Apprentissage par instruction (objectif: alignement)

Les modèles basés sur l'apprentissage auto sont limités, ils ne savent que prédire le mot suivant.

*Solution : s'aligner sur les attentes des utilisateurs* :

#box(
  stroke: 1pt + rgb(34, 102, 153), 
  width: 100%, 
  fill: rgb(34, 102, 153, 30), 
  inset: 7pt,
  text(fill : black, [
    #pad(top: 1pt)[
    Instruction: Traduit la phrase suivante en Français. \
Observation: The cat sat on the mat. \
Label: [...prédit par le modèle...]] 
]))

Cependant, les données annotées restent coûteuses et limitées. Ainsi, on peut utiliser d'autres modèles pré-entraînés pour générer des instructions.

Exemple : *Alpaca dataset,* 52 instructions générées avec GPT-3.5 à partir de 175 instructions.

*Solution améliorée : s'aligner sur les domaines spécialisés *

Exemple : Google Med-PaLM (modèle sous license propriétaire) adapté depuis PaLM.

*A intégrer à la solution : s'aligner sur les valeurs humaines*

- le web contient des données toxiques ou mensongères
- human in the loop : humains qui vérifient les données

==== Les limites de l'alignement

- Gemini image était woke
- il est actuellement dans les faits impossible de sortir de la supervision
- les modèles d'IA qu'on utilise ont été supervisés avec des biais arbitraires
- la seule piste qu'on a est de rendre explicite les valeurs qui sous-tendent le process d'annotation et d'alignement
