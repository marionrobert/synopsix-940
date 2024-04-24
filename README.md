(english below)

# Synopsix : un jeu pour les fans de cinéma🎬🍿🎟

Synopsix est une appplication web proposant un jeu autour de l'univers du cinéma, développé sur le modèle de [Pédantix](https://cemantix.certitudes.org/pedantix). Le but du jeu est de retrouver le titre du film en découvrant peu à peu le synopsix de ce dernier.
Deux modes sont possibles :
- **le mode classique** (Play word search / input mode) : il s'agit d'entrer des mots pour découvrir progressivement le synopsix.
- **le mode contre la montre** (Play Against Time / timer mode) : vous avez deux minutes pour retrouver le titre du film dont les mots du synopsix apparaissent progressivement.

L'application est disponible uniquement en anglais.

<br/>

## Contexte de développement 💻🤝
Il s'agit d'un projet éducatif développé en équipe lors du bootcamp "Développement Web" à Le Wagon. 🚋

<br/>

## Installation et Configuration ⚙️🛠️

### Prérequis système :
L'application tourne actuellement sur :
- Ruby (version 3.1.2) 💎
- Node.js (version 16.15.1)
- PostgreSQL (version 1.1)
- Rails (version 7.0.3.1) 🛤️
- Yarn (version 1.22.19)
- Webpack (version 5.74.0)

<br/>

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
<br/>


## Utilisation

### Page d'accueil
Au démarrage de l'application, l'utilisateur arrive sur la page d'accueil qui offre plusieurs fonctionnalités :
- se connecter
- créer un compte
- choisir un mode de jeu entre **"Play Word Search"** ou **"Play Against Time"**

<img src="/app/assets/images/screenshots/homepage.png" alt="screenshot page d'accueil" width="800">


:information_source: Remarque :information_source: Pour jouer, l'utilisateur doit être connecté. S'il n'a pas de compte, il peut en créer un. Vous pouvez aussi utiliser les comptes "test" créés lors de la génération des seeds. Par exemple : `email : mar@gmail.com` et `mot de passe : 123456`.

### Page de choix de la catégorie
Une fois connecté.e et après avoir choisi un mode de jeu, vous serez invité.e à choisir la catégorie de film dans laquelle vous souhaitez jouer:
- All :dizzy:
- Blockbuster 🎟
- Action 💪⚔️
- Drama 😭
- Comedy :laughing:
- Hystorical 🏛️

Après avoir fait votre choix, c'est à vous de jouer !

<br/>

### Page de jeu : Mode "Play Words Search"

Dans ce mode, votre objectif est de deviner le titre du film en retrouvant progressivement son synopsis. Vous pouvez le faire en entrant des mots dans la barre de recherche. Chaque mot que vous entrez révèle une partie du synopsis, vous rapprochant ainsi de la solution. N'hésitez pas à expérimenter avec différents mots pour découvrir le synopsis complet. 
Cependant, gardez à l'esprit que le nombre d'essais que vous faites affectera votre score. Soyez stratégique dans le choix des mots pour maximiser votre score final ! Dès que vous pensez avoir trouvé le titre du film, utilisez cette même barre de recherche pour faire une proposition.

#### Score de proximité
A chaque fois que vous entrez un mot dans la barre de recherche, il sera **évalué en fonction de sa similarité avec chaque mot du synopsis** du film. Nous utilisons la `gem similar_text` pour calculer le score de proximité entre les mots. Le score de proximité est basé sur le **nombre de caractères identiques** et la **longueur des chaînes de caractères** comparées.
- Si le score de proximité entre un mot entré et un mot du synopsis est supérieur à 0.9, le mot sera considéré comme trouvé et sera affiché découvert dans le synopsis (après une animation avec une couleur de fond verte): exemple avec le mot "woman"
- Si le score de proximité est compris entre 0.8 et 0.9, le mot sera affiché en orange sur fond blanc pour indiquer une correspondance partielle: exemple avec le mot "hero"
- Si le score de proximité est compris entre 0.7 et 0.8, le mot sera affiché en rouge sur fond blanc pour indiquer une correspondance faible: exemple avec le mot "again"
- Si le score de proximité est inférieur à 0.7, le mot restera complètement grisé pour indiquer une faible correspondance.

Cela permet aux joueurs de découvrir progressivement le synopsis du film en entrant différents mots dans la barre de recherche et en observant les mots du synopsis qui sont révélés en fonction de leur proximité avec les mots entrés.

<img src="/app/assets/images/screenshots/inputGame.png" alt="screenshot input game" width="800">

:bulb: Si vous le souhaitez, vous pouvez ajouter des niveaux de score avec des mises en forme différentes pour aider davantage les joueurs. Il vous suffira de modifier la fonction hidden_synopsis dans le fichier `app/models/player_gam.rb`

```
def hidden_synopsis
    #get the synopsis
    synopsis = self.game.movie.synopsis

    #split the synopsis with word borders
    displayed_synopsis = synopsis.split(/\b/)

    #   pour chaque mot du synopsis,
    displayed_synopsis.map! do |element|
      # on display l'élément sauf si l'élément commence par une lettre ou un chiffre
      next "<span class='not-a-word'>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/

      if inputs.any? && inputs.first.content.downcase == element.downcase && self.words[element.downcase]["found"]
        "<span class='lastfound'>#{element}</span>".html_safe
      elsif self.words[element.downcase]["found"]
        "<span class='wfound'>#{element}</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.8
        "<span class='not_far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.7
        "<span class='far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      else
        "<span class='not_found'>&nbsp#{element.chars.map { '&nbsp' }.join}&nbsp</span>".html_safe
      end
    end
    #display_array to string + html.safe = à intepréter comme du html
    displayed_synopsis.join.html_safe
  end
```

<br/>

#### GET HINT :key: (à droite)
Dans ce mode, vous pouvez aussi demander découvrir un indice en cliquant sur le bouton "Get Hint". Vous pouvez découvrir jusqu'à trois indices. Mais attention, cela impactera votre score.

#### Derniers mots recherchés (à gauche)

<img src="/app/assets/images/screenshots/hintsAndTries.png" alt="screenshot hint and tries div" width="800">


### Page de jeu : Mode "Play Against Time"
Dans le mode "Play Against Time", vous avez seulement 2 minutes pour deviner le titre du film. Les mots du synopsis du film se révèlent progressivement et automatiquement, vous offrant des indices pour trouver la réponse. Utilisez la barre de recherche pour faire une proposition du film dès que vous pensez avoir trouvé la solution. Plus tôt vous trouvez le film, meilleur sera votre score final !

<img src="/app/assets/images/screenshots/timerGame.png" alt="screenshot timer game" width="800">


<br/>

### Victoire
#### Lorsque vous aurez trouvé le titre du film, vous obtiendrez les félicitations du jury ! Vous découvrirez votre score et la bande annonce du film en arrière plan. De quoi vous donnez envie de (re)voir le film !
<img src="/app/assets/images/screenshots/victory.png" alt="screenshot victory" width="800">

<br/>

### Page du dashboard

#### Pour les compétiteurs, vous pourez comparer vos scores avec les autres utilisateurs et suivre votre progression dans le classement.
<img src="/app/assets/images/screenshots/dahsboard.png" alt="screenshot dashboard" width="800">

---
---
# Synopsix: A Game for Movie Fans 🎬🍿🎟

Synopsix is a web application offering a game based on the cinema universe, developed following the model of [Pédantix](https://cemantix.certitudes.org/pedantix). The goal of the game is to find the movie title by gradually discovering its synopsix. Two modes are available:
- **Classic mode** (Play word search / input mode): Enter words to progressively discover the synopsix.
- **Against the Clock mode** (Play Against Time / timer mode): You have two minutes to guess the movie title as the synopsix words are gradually revealed.

The application is available only in English.

## Development Context 💻🤝
This is an educational project developed as a team during the "Web Development" bootcamp at Le Wagon. 🚋

## Installation and Configuration ⚙️🛠️

### System Requirements:
The application currently runs on:
- Ruby (version 3.1.2) 💎
- Node.js (version 16.15.1)
- PostgreSQL (version 1.1)
- Rails (version 7.0.3.1) 🛤️
- Yarn (version 1.22.19)
- Webpack (version 5.74.0)

### Installation Steps:
1. Clone the Git repository: `git clone https://github.com/marionrobert/synopsix-940.git`
2. Make sure Rails, Yarn, and Webpack are installed with the corresponding versions.
3. Create a `.env` file at the root of the project and add your Cloudinary API key: `CLOUDINARY_URL=YOUR_API_KEY_HERE`
4. Run the following commands to install dependencies and configure the database:
   - `bundle install`
   - `yarn install`
   - `rails db:create db:migrate db:seeds`
5. To start the server, you have two options:
   - Open two terminals and simultaneously run these commands: `rails server` AND `yarn build --watch`
   - Use the `dev` command to automate these steps using the `Procfile.dev` file (convenient! :bulb:)

## Usage

### Homepage
Upon starting the application, the user lands on the homepage offering several functionalities:
- Log in
- Create an account
- Choose a game mode between **"Play Word Search"** or **"Play Against Time"**

![Homepage](/app/assets/images/screenshots/homepage.png)

:information_source: Note: To play, the user must be logged in. If they don't have an account, they can create one. You can also use the "test" accounts created during seed generation. For example: `email: mar@gmail.com` and `password: 123456`.

### Category Selection Page
Once logged in and after choosing a game mode, you'll be prompted to choose the movie category you want to play in:
- All :dizzy:
- Blockbuster 🎟
- Action 💪⚔️
- Drama 😭
- Comedy :laughing:
- Historical 🏛️

After making your choice, it's time to play!

### "Play Words Search" Game Page

In this mode, your goal is to guess the movie title by gradually uncovering its synopsix. You can do this by entering words in the search bar. Each word you enter reveals part of the synopsix, bringing you closer to the solution. Feel free to experiment with different words to discover the complete synopsix. However, keep in mind that the number of attempts you make will affect your score. Be strategic in choosing words to maximize your final score! When you think you've found the movie title, use the same search bar to make a guess.

#### Proximity Score
Each time you enter a word in the search bar, it will be **evaluated based on its similarity to each word in the synopsix** of the film. We use the `similar_text` gem to calculate the proximity score between words. The proximity score is based on the **number of identical characters** and the **length of the compared strings**.
- If the proximity score between an entered word and a word in the synopsix is above 0.9, the word will be considered found and will be displayed as discovered in the synopsix (after an animation with a green background color): example with the word "woman"
- If the proximity score is between 0.8 and 0.9, the word will be displayed in orange on a white background to indicate a partial match: example with the word "hero"
- If the proximity score is between 0.7 and 0.8, the word will be displayed in red on a white background to indicate a weak match: example with the word "again"
- If the proximity score is below 0.7, the word will remain fully grayed out to indicate a low match.

This allows players to gradually discover the film's synopsix by entering different words in the search bar and observing which words in the synopsix are revealed based on their proximity to the entered words.

![Input Game](/app/assets/images/screenshots/inputGame.png)

:bulb: If you wish, you can add score levels with different formatting to further assist players. You just need to modify the `hidden_synopsis` function in the `app/models/player_gam.rb` file.
```
def hidden_synopsis
    #get the synopsis
    synopsis = self.game.movie.synopsis

    #split the synopsis with word borders
    displayed_synopsis = synopsis.split(/\b/)

    #   for each word of the synopsis,
    displayed_synopsis.map! do |element|
      # on display l'élément sauf si l'élément commence par une lettre ou un chiffre
      next "<span class='not-a-word'>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/

      if inputs.any? && inputs.first.content.downcase == element.downcase && self.words[element.downcase]["found"]
        "<span class='lastfound'>#{element}</span>".html_safe
      elsif self.words[element.downcase]["found"]
        "<span class='wfound'>#{element}</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.8
        "<span class='not_far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.7
        "<span class='far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      else
        "<span class='not_found'>&nbsp#{element.chars.map { '&nbsp' }.join}&nbsp</span>".html_safe
      end
    end
    #display_array to string + html.safe = à intepréter comme du html
    displayed_synopsis.join.html_safe
  end
```

<br/>


#### GET HINT :key: (on the right)
In this mode, you can also request hints by clicking the "Get Hint" button. You can uncover up to three hints, but beware, this will impact your score.

#### Last searched words (on the left)

![Hints and Tries](/app/assets/images/screenshots/hintsAndTries.png)

### "Play Against Time" Game Page

In "Play Against Time" mode, you have only 2 minutes to guess the movie title. The words of the film's synopsix are revealed gradually and automatically, providing you with clues to find the answer. Use the search bar to make a movie title guess as soon as you think you have the solution. The sooner you find the film, the better your final score!

![Timer Game](/app/assets/images/screenshots/timerGame.png)

### Victory
#### Once you've found the movie title, you'll receive congratulations from the jury! You'll discover your score and the movie trailer in the background. Enough to make you want to (re)watch the film!

![Victory](/app/assets/images/screenshots/victory.png)

### Dashboard Page

#### For competitors, you can compare your scores with other users and track your progress in the rankings.

![Dashboard](/app/assets/images/screenshots/dahsboard.png)

