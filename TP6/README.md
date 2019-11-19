# Formation K8S

## TP6 : Secret et ConfigMap

#### Backend Configmap

Créér une ConfigMap pour rendre plus propre la gestion des variable d'environnement de notre backend. 

Les variables misent en ConfigMap pourront être réutiliser par d'autres pods si besoin (partage du hostname de la bdd entre micro service par exemple).

La ConfigMap créé aura comme nom : `back-configmap`.

Remplacer toutes les variables d'environnements renseignées avant par une référence vers la ConfigMap.

#### MongoDb Secret

Créér un secret de type opaque pour mongo contenant le username et le password du user root que l'on va utiliser. 

Modifier le statefulset pour qu'il utilise ce secret via variable d'environnement.

Le Secret créé aura comme nom : `mongo-secret`.

Mongo aura besoin de deux variable d'environnement :
* MONGO_INITDB_ROOT_USERNAME
* MONGO_INITDB_ROOT_PASSWORD


#### Backend Secret

Créér un Secret pour renseigné le username/password de la base de donnée, modifié plus tôt.

Comme pour les ConfigMap les variables misent en Secret pourront être réutiliser par d'autres pods si besoin (partage du username/password de la bdd entre micro service par exemple).

Le Secret créé aura comme nom : `back-secret`.

Notre backend va donc devoir etre modifié comme ceci :
* Ajout de deux variables d'environnments:
    * MONGO_USERNAME
    * MONGO_PASSWORD
* Modification de l'image pour passer de la version `1.0` à la version `1.1` (Avec authentification).

