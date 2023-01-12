# ProgMobile

Ce TP nous a permis de développer une applcation complète de type Gestionnaire de tâches(Todo List).Cette application est faite en suivant le modèle MVC.

L'utilisateur peut créer un nouvel élément, le supprimer ou le modifier.Il peut aussi le "cocher" pour ainsi lui indiquer que la tâche est finie.

Pour faire ceci, nous avons eu besoin de 3 vues: une pour la vue "principale", une pour pouvoir créer un nouvel objet(avec en paramètre un titre et une description), et une pour pouvoir voir le titre et la description(et ainsi la modifier si l'utilisateur le veut).

# Explication du code

<img width="445" alt="image" src="https://user-images.githubusercontent.com/65290829/212012624-0423a353-e7b0-49d1-9e13-54a3079f16f6.png">

La classe TodoViewController possède un champ pour la description et un champ pour le titre de l'objet.Elle possède aussi une méthode save permettant de "sauvegarder" et de déléguer les données transmises dans les champs de description et titre.

<img width="361" alt="image" src="https://user-images.githubusercontent.com/65290829/212014779-363e27f5-0812-4dbb-83e8-1eaf9e90f72f.png">

La classe ViewController est la classe principale.Elle permet d'afficher et d'intéragir avec les différents boutons et objets délégués de la classe TodoViewController.

<img width="506" alt="image" src="https://user-images.githubusercontent.com/65290829/212015372-b9071c0d-7543-47b9-8ca3-35cebf2b0bae.png">

La fonction addTache permet de naviguer vers la vue de la classe TodoViewController. Si la description et le titre ne sont pas vide, alors celà l'ajoute au tableau todos et on réactualise la vue principale pour que celà s'affiche.

<img width="701" alt="image" src="https://user-images.githubusercontent.com/65290829/212018819-c393dbd2-3304-49bb-bc4c-a12a588303b9.png">

Cette fonction tableview permet de faire glisser vers la gauche la cellule touchée.

<img width="640" alt="image" src="https://user-images.githubusercontent.com/65290829/212021049-53e20b52-1a87-4025-bb39-d51838eff5ff.png">

Ces fonctions permettent de supprimer une cellule(et une itération du tableau) une fois qu'elle a été glissé vers la gauche et appuyé sur le bouton supprimer(ou delete selon la langue de l'appareil)
