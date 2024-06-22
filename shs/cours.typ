#import "template.typ": *

#let title = "Com B - Essor de l'I.A."
#let author = ""
#let professor = "Floran Jaton, Rémi Lebret"
#let creater = "Emmanuel Omont, Simon Lefort"
#let time = "Spring 2024"
#let abstract = "Cours de SHS - Enjeux mondiaux de la communication en lien avec l’essor de l’intelligence."
#set quote(block: true)

#show: note_page.with(title, author, professor, creater, time, abstract)

= La loi de Moore

== Les promesses technoscientifiques

- du 16e siècle au 18e siècle #sym.arrow fonction de sensibilisation
- 19e siècle #sym.arrow fonction idéologique

=== Ces promesses sont toujours...

- non dystopiques
- imposent des solutions technologiques
- performatives#footnote[\#olympedegouge], le fait de formuler la promesse contribue à la faire réaliser (orientent les moyens alloués à la recherche & innovation)

=== ...et ont pour contraintes...

- la nécessité de nouveauté radicale (la promesse est la solution unique à un problème urgent)
- crédibilité (soutient des spécialistes, quitte à inventer ces soutiens)

=== Loi de Moore en microélectronique

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

== depuis 2010 : la course aux GPU

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

== Loi de Huang

#quote(attribution: [Jensen Huang (CEO Nvidia, leader des cartes GPU)], "Les performances des GPUs seront plus que doublées chaque 2 ans", )

== Optimisation

*Représentation des nombres :* réduction de la précision pour accélerer les calculs. (2019, Google, grâce au brain floating point).

*Nouvelles cartes :* 
- le T.P.U. (Tensor Processing Unit) par Google (2015), conçu pour les réseaux de neurones (fonctionne avec Tensorflow)
- le L.P.U. (Language Processing Unit) par Groq
- Apple Série M (système sur une unique puce SoC : CPU, GPU, mémoire unifié)

et beaucoup d'autres entreprises (AWS...)

== Etat du marché

Nvidia domine, tensions géopolitiques liées aux semi-conducteurs.

= Les modèles de langue

LLM : Large Language Model

== Recette d'un bon LLM

- bcp de paramètres (x10 chaque année, nouvelle loi de Moore#footnote[OMG la dinguerie !??!] ?)
- de la puissance de calcul
- bcp (bcp) de données (seront épuisées en 2026 !)

= Des booms et des hivers de l'IA

Historiquement, les technologies IA ont traversé des phases de booms et de crises.

== Genèse et 1er boom de l'IA (1940–1965)

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

1949 : 1er ordinateur BINAC (sert de référence à UNIVAC, 1951), les ordinateurs/calculateurs sortent progressivement de la recherche militaire #sym.arrow *industrie et administration*.


1956 : 1ère appartition du terme I.A. (John McCarthy)

1960 : premier boom de l'IA dite "symbolique" \
#sym.arrow.r.curve recherche logicielle visant à décrire les règles de pensée et les exprimer sous forme de code informatique (par ex. chatbot ELIZA).

Un groupe fermé de chercheurs s'arroge le monopole de la définition des enjeux de l'IA. \
#sym.arrow.r.curve capture l'essentiel des financements (75% de US Air Force) \
#sym.arrow.r.curve conserve l'accès aux grands systèmes informatiques

... cela conduit au premier hiver.

== Premier hiver de l'IA (1965-1975)

#sym.arrow promesses des promoteurs de l'IA symbolique n'ont pas été tenues \
#sym.arrow à partir de 1970, baisse des financements (notamment militaires) \
#sym.arrow accusés de se concentrer sur des "mondes jouets"

== Systèmes experts experts et 2ème boom (1975-1985)

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

== Deuxième hiver et travail de l'ombre

Des promesses non tenues (encore...) \
#sym.arrow problème de hardware \
#sym.arrow problème de maintenance des logiciels \
#sym.arrow la plupart des startups ont fait faillite

1990 : IA symbolique est si affaiblie que le terme disparaît quasiment du vocabulaire de recherche.

=== Parallel Distributed Processing

1986 : à l'écart de l'IA symbolique, un groupe de chercheurs travaille sur les *réseaux de neurones* (notamment reconnaissance des codes postaux)

notion de rétropropagation du gradient (ajuster les paramètres du modèle en fonction des erreurs qu'il commet, en fait le gradient c'est la dérivée, on l'utilise pour savoir dans quelle direction aller pour minimiser l'erreur).

LeNet-1, reconnaissance de chiffres - 1989 \
LeNet-5, reconnaissance de caractères (reconnaissances de ZIP codes par ex.) - 1998

== Réseau de neurones profonds et 3ème boom (2005-2024)

=== Avènement du Deep Learning :
- puissance de calcul augmente (performances des cpu #sym.arrow.tr + GPU)
- réseaux de neurones + profonds

=== Numérisation et essort d'Internet

- quantité de données #sym.arrow.tr
- mise en place de plateformes de crowdsourcing (pour labelliser des données)

Exemple : ImageNet (1k catégories d'objets, 1.2M d'images)

2012 : AlexNet, reconnaissance d'objets, meilleurs performances sur ImageNet (25% #sym.arrow 16%) grâce aux *filtres de convolution*.

2015 : ResNet

#sym.arrow application d’une même transformation linéaire sur différentes zones de l’image \
#sym.arrow on part de petites matrices (3x3) en demandant au modèle de générer de grandes matrices (5x5) *, chaque groupe est une couche de convolution* (pour éviter de se concentrer sur les détails).

Il y a plusieurs *cartes d'activation* (filtre = feature, appris à l'entraînement) à la sortie de chaque couche.

Réduction des cartes d’activation par *opération de pooling*.

Chaque convolution est suivie d'une *fonction d'activation* non linéaire.

La dernière couche est la couche *de classification*, qui détermine la sortie avec poids (appris pendant l'entraînement).

= Des booms et des hivers de l'IA (II)

== Genèse: memorandum de Weaver et démos. publiques (1950-1965)

1949 : Weaver suggère une meilleure approche (statistique et probabiliste) que celle de la traduction linéaire

1954 : première démonstration publique à New York, traduction de russe à anglais en public.

== Crise: le rapport ALPAC et ses conséquences (1965-1990)

1966 : le rapport ALPAC (Automatic Language Processing Advisory Committee)

#quote(attribution: [National Research Council, 1966])[Il n’y a aucune urgence dans le domaine de la traduction automatique. Le
problème n’est pas de satisfaire un besoin inexistant à travers des
systèmes de traduction automatiques inexistants]

peu de bénéfices à court-terme #sym.arrow *chute drastique des financements.*

== Renouveau et tradition statistique (1990-2015)

1990 : apparition de corpus parallèles#footnote[Merci au parlement canadien d'avoir traduit gratuitement des textes anglais-français. Sinon, on utilise aussi la Bible, vu que c'est un texte traduit dans quasiment 100% des langues] (utiles pour la traduction)

1992 : rapport JTEC (Japan Technology Evaluation Center) et incitations politiques (convaincre les gouvernements d'utiliser les nouvelles technologies)

mais aussi puissance de calcul et stockage #sym.arrow.tr \
et nouvelle culture statistique, probabiliste

=== Focus sur modèles de traduction basés sur les groupes de mots

1993 : IBM introduit plusieurs modèles statistiques pour la traduction (corpus parallèles issus du parlement canadien)

2006 : Google Translate, basée sur cette méthode

==== Comment ça marche ?

- segmentation des phrases en groupe de mots (tokens)
- recherche de correspondances les + probables
- assemblage des correspondances

==== Limitations de l’approche statistique

- traduction fausse si syntaxe non courante
- utilisation de l'anglais comme "langue pivot" (FR #sym.arrow EN #sym.arrow IT)#footnote[le truc drôle en plus, c'est si vous le mettez en PLS il sortira une phrase de la Bible]

== Traduction automatique par réseau de neurones (2014-2024)

=== Boom des ConvNets

Entre 2012 et 2015 : boom des ConvNets pour traitement des images

==== Comment ça marche ?

Comment apprendre le langage naturel avec des réseaux de neurones?

- les machines comprennent le langage binaire
- les réseaux de neurones doivent recevoir en entrée des données continues
- le texte est représenté par des symboles discrets (lettres, chiffres, caractères spéciaux, etc.)

*Problème :* avec ASCII, l'encodage binaire, un mot n'est pas défini par ses lettres, impossibilité d'apprendre le sens d'un mot avec binaire. (ex chouette #sym.eq.not brouette).

*Solution :* encodage one-hot : grâce au word embeddings un graph basé sur le sens tous les mots va se former.

Pour cela : on prend la probabilité de coocurrence P(c/w), puis on réduit les dimensions trouvées pour être + ou - précis dans la compréhension (grâce à la SVD).

#sym.arrow une méthode efficace mais peu efficiente (ça a pris 4 mois pour s'entraîner sur Wikipedia).

==== word2vec (2013)

- modèle linéaire
- tricks pour améliorer l'apprentissage des mots rares
- code open source en C
- apprentissages de word embeddings en quelques minutes

Exemple : déterminer si un avis est positif ou négatif.

=== Réseaux récurrents

- adapté au langage, qui est séquentiel

2014 : premiers réseaux de neurones récurrents pour la traduction
automatique

=== Long-Short Term Memory (LSTM) Network (traduction)

Problème de l'époque : apprentissage des réseaux récurrents difficile pour les longues
séquences.

Une idée des années 90 refait surface: LSTM networks.

2016: Google Translate opte pour un modèle de traduction neuronal basé sur les LSTM

==== Limites des LSTM-RNN

- problème d'optimisation
- modèles séquentiels difficilement parallélisables
- architecture peu efficace sur GPU
- temps d'apprentissage + long

=== Transformer: Attention Is All You Need

- 2017: nouvelle architecture basée uniquement sur le mécanisme d’attention
- efficace sur GPU (entraînement + rapide)
- les RRN n'ont pas dit leur dernier mot (transformer + rapide en entraînement mais gourmands en mémoire)
- Mars 2024: Google DeepMind présente deux nouveaux modèles de langue basés sur des RNNs

*Mécanisme d'attention :* fait attention à n'importance des mots en fonction du contexte des mots en l'entourant.

= Supervision et apprentissage automatique

== Apprentissage supervisé

Une fois qu'un jeu de données est disponible, les chercheurs la divise en 2 sous-ensembles :
- jeu d'entraînement
- jeu d'évaluation

=== Des avancées et des limites

- biais de sélection des données
- biais des annotations des données
- coût de l'annotation des données (contraîntes de temps : ex. annotation de contrats juridiques 1/4 de temps juste pour les annoter).

== Apprentissage auto-supervisé

Yann Le Cun “Cake Analogy” : la grosse partie du gâteau est faite avec un apprentissage non supervisé, et le glaçage, la cerise, est faite avec un peu d'apprentissage supervisé.

=== Apprentissage des données d'entrée

- apprendre à prédire le mot d’après, ou les mots cachés
- GPT (Generative Pre-Trained Transformer) #sym.arrow prédire le mot suivant
- apprendre des images avec des tâches "prétextes" prédéfinies (rotation, mettre en couleur)

=== Apprentissage discriminatif

utilise un signal discriminant entre les images, permet de classifier les images

=== Apprentissage contrastif

Apprendre à déterminer si une paire d'image est positive ou pas (donc si les deux images sont de la même catégorie) \
On donne des paires d'images positives, c'est-à-dire d'un même set, et des paires d'images négatives. Ensuite pour continuer à l'entraîner on lui donne des paires avec une image A et cette image A retournée, et on vérifie si le résultat est bien "positif" (c'est les tâches prétextes).

Exemple : *modèle CLIP*, auto-supervision avec 400M de paires (image, description) collectées sur le web. Performances équivalentes à ImageNet. Meilleures généralisation des données inconnues.

== Apprentissage par instruction (objectif: alignement)

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

Exemple : *Alpaca dataset,* 52 000 instructions générées avec GPT-3.5 à partir de 175 instructions.

*Solution améliorée : s'aligner sur les domaines spécialisés *

Exemple : Google Med-PaLM (modèle sous license propriétaire) adapté depuis PaLM.

*A intégrer à la solution : s'aligner sur les valeurs humaines*

- le web contient des données toxiques ou mensongères
- human in the loop : humains qui vérifient les données

=== Les limites de l'alignement

- Gemini image était woke
- il est actuellement dans les faits impossible de sortir de la supervision
- les modèles d'IA qu'on utilise ont été supervisés avec des biais arbitraires
- la seule piste qu'on a est de rendre explicite les valeurs qui sous-tendent le process d'annotation et d'alignement#footnote[basiquement on va juste dire "oui j'assume que notre modèle est biaisé et pense que la terre est plate, désolé on y peut rien nos données venaient des platistes"]

= IA Generative & sphère informelle

== Quelques exemples

- Pape François en doudoune, généré par un employé du BTB à Chicago, relayée sur twitter
- Donald Trump arrêté par la police de NY, dans un contexte tendu
- Emmanuel Macron au milieu de la réforme des retraites

#sym.arrow À Davos, tous les regards sont sur les deepfakes.

== Generateur d'images par IA

=== IA generative VS IA discriminative

- Discriminatif : focus sur les caractéristiques qui distinguent les différentes catégories (objectif : reconnaître une image)
- Génératif : modélisation de la distribution des données

=== Type de modèles pour la distribution d'images.

*Auto-Encodeur : *\
Apprendre une distribution approximée d'un ensemble de points ayant une distribution inconnue.

Cool : compresser des images dans un espace réduit, apprentissage auto-supervisé.\
Pas cool : Qualité mauvaise, manque de contrôle sur la génération (on ne peut pas dire où sont les yeux d'une image par ex).

*Auto-Encodeur variationnel * \

Apprentissage d'une représentation probabiliste et continue de l'entrée \
Le décodeur génère une image à partir d'une variable latente

Cool : Représentation plus structurée, images + diversifiées, bcp plus de contrôle \
Pas cool : On génère l'image en une étape (VAE)

* Modèle de diffusion * \

On génère l'image en plusieurs étapes. \
#sym.arrow.curve On apprend à prédire le bruit d'une image avec un encodeur, qui "bruite" l'image au fur et à mesure (à la fin on a un espace réduit ducoup), après, on apprend à reconstruire l'image avec un décodeur. \

forward diffusion : obtenir le bruit à partir de l'image \
reverse diffusion : l'inverse.

On a une chaîne de markov, avec des étapes petit à petit.

=== Entrainement pour modèle de diffusion

1. Prend une image
2. Générer du niveau de bruit
3. On choisit un niveau de bruit
4. Ajouter le bruit à l'image
5. On lui demande de prédire le bruit qui a été ajouté à l'image. \
#sym.arrow.curve Une fois entraîné, on peut prédire l'image suivante en retirant le bruit que le modèle pense qui a été ajouté.

=== Conditionner la génération d'image

On va ajouter du texte à notre jeu d'entrainement.\
#sym.arrow.curve On utilise des modèles qui ont déjà labelisé les images (modèle CLIP) #sym.arrow Chaque mot est représenté par du text embedding. \
#sym.arrow.curve Le prédicteur de bruit avec mécanisme d'intention va générer une image aléatoire conditionnée avec le texte entré \
#sym.arrow.curve On peut aussi conditionner en disant "eh à cet endroit tu me met un train"#footnote[Si vous voulez voir à quoi ça ressemble concrètement, vous pouvez aller voir Nvidia Canvas]

=== Principaux modèles de diffusion text-to-image

1. Midjourney (v1 #sym.arrow v6)
2. Dalle-E (2 #sym.arrow 3)
3. Imagen ( #sym.arrow 2)
4. Stable diffusion (v1 #sym.arrow v3)

=== Controverse de génération d'image

Des scientifiques ont publié un papier avec des images générées par Midjourney, ils se sont fait taper dessus

== Fausses images et sphère informationnelle

Jusqu'à présent, il n'y a pas eu de répercussions géopolitiques majeures#footnote[où on ne le sait pas encore MDR], mais ces images génères des inquiétudes. \
#sym.arrow.curve Elles mettent à mal la recherche d'image inversée et l'analyse des retouches (les 2 check des sécurités)

Ces fausses images continuent de mettre de l'huile sur le feu dans un monde avec déjà beaucoup de guerres.

Point de départ de la guerre informationnelle : *Guerre du Golfe*, quand le gouvernement du Koweit engage de nombreuses ressources pour mobiliser l'opinion publique contre Saddam Hussein (ex. témoignage vidéo de Nahira, vu par 60,000,000 d'américains *qui était un faux !*). \
#sym.arrow.r.curve aide bcp le Koweit

Tous les pays commencent à prendre au sérieux cette domination informationnelle.

*Début années 1990 :* Iran, mise en place de l'IRIB. un peu comme CNN, 1Md de budget, 15k employés, mais l'information est orientée pour aller dans le sens de l'islam

*1996* : fondation d'Al Jazeera par le Qatar, sur le modèle aussi de CNN, constitue un canal pour les déclarations du Hamas, du Hezbollah (sud Liban), et d'Al-Qaïda.

*1998* : opération bouclier doré (contrôle de l'accès des internautes chinois aux contenus étrangers). En 2022 : 73% du trafic internet chinois provient de l'intérieur de ses frontières !

*1994* : système SORM (Système pour Activité d'Enquête Opératoire) permet d'intercepter l'ensemble des communications sur l'ensemble des territoires russophones.

*2005* : lancement du média Russia Today (propagande)

*2016* : grande campagne de déstabilisation informationnelle, lors de la campagne électoral entre Trump et Hillary Clinton (piratage des boîtes mails d'Hillary Clinton)

Situation préoccupante de chaos informationnelle.

2024 : Annonce faite par le Hamas (bombardement de l'hopital Al-Ahli) #sym.arrow relayée par la presse internationale... alors que c'était faux. Cela a conduit à une très forte augmentation des manifestations pro-palestine.

== Mais il reste de l'espoir !

Le propriétaire du journal The Guardian est dirigé par une fondation, à but non lucratif. Il assure une indépendance d'écriture, car les journalistes n'ont pas besoin de "rechercher le scoop".

De même Le Temps est sorti d'une entreprise pour se faire racheter par une fondation, Aventinus, créée par des personnes riches pour soutenir la presse romande. *le comité de rédaction est séparé du conseil de fondation !* pas de conflit d'intérêt.
