# Synopsix : un jeu pour les fans de cinéma🎬🍿🎟

Synopsix est un jeu en ligne autour de l'univers du cinéma. Sur le modèle de [Pédantix](https://cemantix.certitudes.org/pedantix), il s'agit de retrouver le titre du film en découvrant peu à peu le synopsix de ce dernier. Deux modes sont possibles : 
- le mode classique (Play word search / input mode) : il s'agit d'entrer des mots pour découvrir progressivement le synopsix.
- le mode contre la montre (Play Against Time / timer mode) : vous avez deux minutes pour retrouver le titre du film dont les mots du synopsix apparaissent progressivement.

Le jeu est disponible en anglais.

## Installation et Configuration:

### Prérequis système :
L'application tourne actuellement sur :
- Ruby (version 3.1.2)
- Node.js (version 16.15.1)
- PostgreSQL (version 1.1)

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
   - Utilisez la commande `dev` pour automatiser ces étapes grâce au fichier `Procfile.dev`.


## Utilisation :
Au démarrage de l'application, l'utilisateur arrive sur la page d'accueil qui offre plusieurs fonctionnalités : 
- se connecter
- créer un compte
- choisir un mode de jeu entre "Play Word Search" ou "Play Against Time"

![image](https://github.com/marionrobert/synopsix-940/assets/107509668/3a742c2b-a218-46be-89f4-74a6b5098de2)

:information_source: Remarque : pour joueur, l'utilisateur doit être connecté. S'il n'a pas de compte, il peut en créer un. Vous pouvez aussi utiliser les comptes créés lors de la génération des seeds.
Par exemple :
- email : mar@gmail.com
- mot de passe : 123456

Une fois connecté.e et après avoir choisi un mode de jeu, vous serez invité.e à choisir la catégorie de film dans laquelle vous souhaitez jouer:
1. All :dizzy:
2. Blockbuster 🎟
3. Action :runner:
4. Drama :cry:
5. Comedy :laughing:
6. Hystorical 🏛️

Après avoir fait votre choix, c'est à vous de jouer ! 

### Mode "Play Words Search"

Si vous avez choisi le mode "Play Words Search", votre objectif est de deviner le titre du film en découvrant progressivement le synopsis. Vous pouvez le faire en entrant des mots dans la barre de recherche. Chaque mot que vous entrez révèle une partie du synopsis, vous rapprochant ainsi de la solution. N'hésitez pas à expérimenter avec différents mots pour découvrir le synopsis complet. Cependant, gardez à l'esprit que le nombre d'essais que vous faites affectera votre score. Soyez stratégique dans le choix des mots pour maximiser votre score final ! Dès que vous pensez avoir trouvé le titre du film, utilisez cette même barre de recherche pour faire une proposition.

A chaque fois que vous entrez un mot dans la barre de recherche, il sera évalué en fonction de sa similarité avec chaque mot du synopsis du film. Pour ce faire, nous utilisons la gem similar_text pour calculer le score de proximité entre les mots.

Si le score de proximité entre un mot entré et un mot du synopsis est supérieur à 0.9, le mot sera considéré comme découvert et sera affiché dans le synopsis.

Si le score de proximité est compris entre 0.8 et 0.9, le mot sera affiché en orange sur fond blanc pour indiquer une correspondance partielle.

Si le score de proximité est compris entre 0.7 et 0.8, le mot sera affiché en rouge sur fond blanc pour indiquer une correspondance faible.

Si le score de proximité est inférieur à 0.7, le mot sera complètement grisé pour indiquer une faible correspondance.

Cela permet aux joueurs de découvrir progressivement le synopsis du film en entrant différents mots dans la barre de recherche et en observant les mots du synopsis qui sont révélés en fonction de leur proximité avec les mots entrés.

![image](https://github.com/marionrobert/synopsix-940/assets/107509668/7371cefa-a2fe-4200-a417-22d054941e19)


### Mode "Play Against Time"
Dans le mode "Play Against Time", vous avez seulement 2 minutes pour deviner le titre du film. Les mots du synopsis du film se révèlent progressivement et automatiquement, vous offrant des indices pour trouver la réponse. Utilisez la barre de recherche pour faire une proposition du film dès que vous pensez avoir trouvé la solution. Plus tôt vous trouvez le film, meilleur sera votre score final !



Exemples et Captures d'écran :
Des exemples concrets d'utilisation de votre application.
Des captures d'écran pour illustrer l'apparence et l'interface utilisateur de votre application.








Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
