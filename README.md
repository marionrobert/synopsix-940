# Synopsix : un jeu pour les fans de cinéma🎬🍿🎟

Synopsix est un jeu en ligne autour de l'univers du cinéma. Sur le modèle de [Pédantix](https://cemantix.certitudes.org/pedantix), il s'agit de retrouver le titre du film en découvrant peu à peu le synopsix de ce dernier. Deux modes sont possibles : 
- le mode classique (Play word search / input mode) : il s'agit d'entrer des mots pour découvrir progressivement le synopsix.
- le mode contre la montre (Play Against Time / timer mode) : vous avez deux minutes pour retrouver le titre du film dont les mots du synopsix apparaissent progressivement.

L'applciation est disponible uniquement en anglais.



## Installation et Configuration ⚙️🛠️

### Prérequis système :
L'application tourne actuellement sur :
- Ruby (version 3.1.2) 💎 
- Node.js (version 16.15.1)
- PostgreSQL (version 1.1)
- Rails (version 7.0.3.1)
- Yarn (version 1.22.19)
- Webpack (version 5.74.0)

### Étapes d'installation :
1. Clonez le dépôt Git : `git clone https://github.com/marionrobert/synopsix-940.git`
2. Assurez-vous d'avoir Rails, Yarn et Webpack installés avec les versions correspondantes.
3. Créez un fichier `.env` à la racine du projet et ajoutez votre clé API Cloudinary : `CLOUDINARY_URL=VOTRE_CLÉ_API_ICI`
4. Exécutez les commandes suivantes pour installer les dépendances et configurer la base de données :
   - `bundle install`
   - `yarn install`
   - `rails db:create db:migrate db:seeds`
5. Pour démarrer le serveur, vous avez deux options :
   - Ouvrez deux terminaux et exécutez simultanément les commandes suivantes : `rails server` ET `yarn build --watch`
   - Utilisez la commande `dev` pour automatiser ces étapes grâce au fichier `Procfile.dev` (pratique!  :bulb:)




## Utilisation :

#### Page accueil: Bienvenue !
Au démarrage de l'application, l'utilisateur arrive sur la page d'accueil qui offre plusieurs fonctionnalités : 
- se connecter
- créer un compte
- choisir un mode de jeu entre "Play Word Search" ou "Play Against Time"

![image](https://github.com/marionrobert/synopsix-940/assets/107509668/3a742c2b-a218-46be-89f4-74a6b5098de2)

:information_source: Remarque : pour jouer, l'utilisateur doit être connecté. S'il n'a pas de compte, il peut en créer un. Vous pouvez aussi utiliser les comptes créés lors de la génération des seeds. Par exemple : `email : mar@gmail.com` et `mot de passe : 123456`.

#### Choix de la catégorie
Une fois connecté.e et après avoir choisi un mode de jeu, vous serez invité.e à choisir la catégorie de film dans laquelle vous souhaitez jouer:
- All :dizzy:
- Blockbuster 🎟
- Action 💪⚔️
- Drama 😭
- Comedy :laughing:
- Hystorical 🏛️

Après avoir fait votre choix, c'est à vous de jouer ! 

### Mode "Play Words Search"

Dans ce mode, votre objectif est de deviner le titre du film en retrouvant progressivement son synopsis. Vous pouvez le faire en entrant des mots dans la barre de recherche. Chaque mot que vous entrez révèle une partie du synopsis, vous rapprochant ainsi de la solution. N'hésitez pas à expérimenter avec différents mots pour découvrir le synopsis complet. Cependant, gardez à l'esprit que le nombre d'essais que vous faites affectera votre score. Soyez stratégique dans le choix des mots pour maximiser votre score final ! Dès que vous pensez avoir trouvé le titre du film, utilisez cette même barre de recherche pour faire une proposition.

#### Score de proximité
A chaque fois que vous entrez un mot dans la barre de recherche, il sera évalué en fonction de sa similarité avec chaque mot du synopsis du film. Pour ce faire, nous utilisons la gem similar_text pour calculer le score de proximité entre les mots.
- Si le score de proximité entre un mot entré et un mot du synopsis est supérieur à 0.9, le mot sera considéré comme découvert et sera affiché découvert dans le synopsis (après une animation avec une couleur de fond verte): exemple avec le mot "woman"
- Si le score de proximité est compris entre 0.8 et 0.9, le mot sera affiché en orange sur fond blanc pour indiquer une correspondance partielle: exemple avec le mot "hero"
- Si le score de proximité est compris entre 0.7 et 0.8, le mot sera affiché en rouge sur fond blanc pour indiquer une correspondance faible: exemple avec le mot "again"
- Si le score de proximité est inférieur à 0.7, le mot restera complètement grisé pour indiquer une faible correspondance.

Cela permet aux joueurs de découvrir progressivement le synopsis du film en entrant différents mots dans la barre de recherche et en observant les mots du synopsis qui sont révélés en fonction de leur proximité avec les mots entrés.

![image](https://github.com/marionrobert/synopsix-940/assets/107509668/322178c7-ef08-4c5e-a4fb-2e6d351328fa)


#### GET HINT :key:
Dans ce mode, vous pouvez aussi demander découvrir un indice en cliquant sur le bouton "Get Hint". Vous pouvez découvrir jusqu'à trois indices. Mais attention, cela impactera votre score.

![image](https://github.com/marionrobert/synopsix-940/assets/107509668/222ab01d-152f-4bee-8c36-b71324be273c)


### Mode "Play Against Time"
Dans le mode "Play Against Time", vous avez seulement 2 minutes pour deviner le titre du film. Les mots du synopsis du film se révèlent progressivement et automatiquement, vous offrant des indices pour trouver la réponse. Utilisez la barre de recherche pour faire une proposition du film dès que vous pensez avoir trouvé la solution. Plus tôt vous trouvez le film, meilleur sera votre score final !


### Victoire
Lorsque vous aurez trouvé le titre du film, vous obtiendrez les félicitations du jury ! Vous découvrerez votre score et la bande annonce du film en arrière plan. De quoi vous donnez envie de (re)voir le film !
![image](https://github.com/marionrobert/synopsix-940/assets/107509668/eac540ff-a105-4e1c-9220-adf450d7bdf7)


Pour les compétiteurs, vous pourez comparer vos scores avec les autres utilisateurs et suivre votre progression dans le classement.
![image](https://github.com/marionrobert/synopsix-940/assets/107509668/596659d7-c261-4eef-a7a9-3926d332e0d3)
![image](https://github.com/marionrobert/synopsix-940/assets/107509668/78b5f647-4e9a-4be7-bd6d-9bfacf9ae30f)





Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
