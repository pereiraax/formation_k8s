# Formation K8S

## TP2 : Frontend

#### Deployment 

Créer un deployment pour notre Frontend avec comme image docker : `axelpereira/k8s-training-test-app-front:1.0`.

Ce deployment va devoir créer des pods qui vont répondre à plusieurs exigences :
- Ils doivent avoir le label `app:front-training-app`
- L'image doit être pull seulement lorsqu'elle n'est pas présente dans notre cluster.
- On veut 2 pods pour être sûr que si l'un tombe l'autre puisse répondre !

Le port 80 du container est déjà exposé, pas besoin de l'exposé encore une fois.
Pour rappel on l'aurait exposé via :
```
ports:
- containerPort: 80
```

#### Service

Créer un service qui va servir à exposer nos pods Frontend à l'exterieur de notre cluster via un port de notre machine. 

Ce service aura comme nom : `front-training-app`
Ce service ciblera les pods du deployment instancié plus hauts.

On mettra le service en type `NodePort` afin de pouvoir le tester (via la un navigateur à l'url : `IP_DE_LA_VM:PORT`).
