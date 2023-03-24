# Rails Rent Cars

Dans cet exercice, vous devez implémenter des fonctionnalités dans une application web `rails` à partir du cahier des charges spécifié ci-dessous et correspondant à votre sujet :

```
Vous devez créer une plateforme pour louer des voitures entre particuliers
```

## Setup

Clonez le dépôt GitHub et exécutez les commandes habituelles vous permettant de lancer l'application sur votre ordinateur.

Si vous voyez s'afficher le message `rbenv: version 3.1.2 is not installed`, exécutez la commande suivante pour installez la version de `ruby` correspondante :

```bash
rbenv install 3.1.2 && gem install bundler rubocop pry pry-byebug
```

Vous pourrez alors réexécuter les commandes habituelles vous permettant de lancer l'application.

## Base de données

Effectuez les modifications du code nécessaires à l'obtention du schema de données suivant :

<img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/assess/rent_car_db_schema.png" alt="DB schema">

Une voiture n'est pas valide :

- Si elle n'a pas de marque.
- Si elle n'a pas de modèle.
- Si elle n'a pas d'adresse.
- Si son prix journalier est inférieur ou égal à zéro.

Une réservation n'est pas valide :

- Si elle n'a pas de date de début.
- Si elle n'a pas de date de fin.

La suppression d'un utilisateur doit entraîner la suppression de ses voitures et de ses réservations. La suppression d'une voiture doit entraîner la suppression de ses réservations.

**NB :** La gem `devise` a déjà été ajoutée et la table `users` a déjà été créée.

## Interface utilisateur

Effectuez les modifications du code nécessaires à l'implémentation des parcours utilisateurs suivants :

- En tant qu'utilisateur, je peux accéder à la page d'accueil.
- En tant qu'utilisateur, je peux voir la liste de toutes les voitures.
- En tant qu'utilisateur, je peux accéder aux détails d'une voiture.
- En tant qu'utilisateur, je peux réserver une voiture.

## Spécifications

- Respectez les conventions de `rails`.
- La page d'accueil doit contenir un lien permettant d'accéder à la liste des voitures.
- La page listant les voitures doit contenir les liens permettant d'accéder aux détails de chaque voiture.
- La page affichant les détails d'une voiture doit contenir un lien permettant de retourner sur la page listant toutes les voitures.
- La page affichant les détails d'une voiture doit contenir le formulaire permettant de faire une réservation.
- Le formulaire de réservation doit utiliser un sélecteur de date <a href="https://flatpickr.js.org/examples/" target="_blank">Flatpickr</a> pour faciliter la saisie des dates, de type <a href="https://flatpickr.js.org/examples/#range-calendar" target="_blank">range</a>, le plus adapté a la saisie d'une période.
- Lors de la soumission du formulaire de réservation, l'utilisateur doit être redirigé vers la page de détails de la voiture et une <a href="https://www.rubyguides.com/2019/11/rails-flash-messages/" target="_blank">notification flash</a> doit s'afficher pour confirmer la réservation.

## Ressources

Pour avoir une interface soignée, nous vous conseillons d'utiliser :

- <a href="https://getbootstrap.com/docs/5.1/getting-started/introduction/" target="_blank">Bootstrap</a> (déjà installé)
- <a href="https://uikit.lewagon.com/" target="_blank">L'UI Kit du Wagon</a>
