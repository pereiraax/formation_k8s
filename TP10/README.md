# Formation K8S

## TP10 - Pod priority class

Comme on l'a vu un cluster peut abriter plusieurs instances de l'application grâce au namespace. 

La plus grosse limite au déploiement de nos applications va être les ressources de la machine sur laquelle on est. 

Par exemple si deux environnements (dev, acc) reservent déjà la totalité de la mémoire de la machine, on ne veut pas pouvoir installer un autre environnement. les pods vont rester au status `Pending`.

Dans certain cas on veut avoir un systeme de priorité dans nos déploiement, c'est à dire qu'un environnement de Prod doit pouvoir s'installer à la place d'un environnement de dev si besoin.

#### Priority class

Créér 3 PriorityClass avec des valeurs différentes comme suit:
* pod-priority-prod : 1000
* pod-priority-acc : 500
* pod-priority-dev : 100

Ajouter / Ajuster les request en mémoire de deux deployment, pour que chaque environnement prenne la (quasi) totalité de la RAM de la machine (back-dev -> 2G & back-acc -> 2G). 

Vérifier que l'environnement avec la plus grosse priorité se lance bien à la place du premier.