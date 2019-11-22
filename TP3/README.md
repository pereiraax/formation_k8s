# Formation K8S

## TP3 : Ingress et exposition

#### NGINX controller setup

Cette commande va construire un ingress controller afin d'exposer certaine route de notre cluster sur internet 

> minikube addons enable ingress

Pour l'instant aucune route n'est défini, donc cette commande a juste créés des pods et des services en plus dans notre cluster.

#### Service

Nous allons enlever le type NodePort à notre service frontend afin qu'on ne puisse plus y accéder que par l'ingress que nous allons créér juste apres.

#### Ingress applicatif

Créer un ingress qui va servir à établir les routes vers nos différents services.

Cet ingress va devoir créér une route (la racine `/`) vers notre service frontend sur le port 80.

