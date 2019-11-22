# Formation K8S

## TP4 : Backend

#### Deployment 

Créer un deployment pour notre Backend avec comme image docker : `axelpereira/k8s-training-test-app-back:1.0`.

Ce deployment va devoir créer des pods qui vont répondre à plusieurs exigences :
- Ils doivent avoir le label `app: back-training-app`
- L'image doit être pull seulement lorsqu'elle n'est pas présente dans notre cluster.
- Ils doivent avoir les variables d'environnement :
    * MONGO_HOSTNAME -> DNS interne kubernetes pour accéder à Mongodb
    * MONGO_PORT -> port exposé par mongo (27017)
    * MONGO_DB -> nom de la base que l'on va utiliser (`training`)

Le container expose déjà le port 5000 donc pas besoin de l'exposé une autre fois dans le deployment.

#### Service

Créer un service qui va servir à exposer notre pod Backend à l'exterieur de notre cluster via une route que l'on définira dans l'ingress. 

Ce service aura comme nom : `back-training-app`

Ce service ciblera les pods du deployment instancié plus hauts.

Ce service mappera le port 80 du service en entrée avec le port 5000 du pod sur lequel écoute notre backend.

#### Ingress applciatif

L'ingress va devoir router une nouvelle route pour le backend.

Ajouter la route `/api` vers le service backend.

L'application écoute sur `/quelque-chose` et non `/api/quelque-chose`
donc il va falloir ajouter des parametres à l'ingress.

> Rappel :
> * L'annotation rewrite target permet de réécrire l'url qui est transmis au service. Cette annotation va de paires avec le pattern `(.*)`. 
>
>Une route en `/quelque-chose/(.*)` avec un rewrite target `$1` indique que tout le reste du chemin capté par `(.*)` sera récrit lors de la transmission au service.
>
> exemple :
>
> frontend -> /quelque-chose/users/1 -> ingress (réécriture de l'url) -> /users/1 -> service -> pod

Deux solutions sont possibles pour ce TPs, la plus propre va être de créér un ingress spécifique pour le backend en plus de celui du frontend.
