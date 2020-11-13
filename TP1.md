# Formation K8S

## TP1 : Mongodb 

#### Deployment 

Créer un deployment mongo db avec comme image docker : `mongo:4.0.8`.

Ce deployment va créér (par défault) 1 pod, l'utilisation des selecteurs est important (deployment -> pod). On attribuera le label `role: mongo`.


#### Service

Créer un service qui va servir à exposer notre pod Mongo à l'intérieur de notre cluster afin qu'il puisse être utilisé comme DB pour d'autres pods (un backend par exemple...).

Ce service aura comme nom : `mongo`

Ce service ciblera les pods du deployment instancié plus hauts.

On mettra tout d'abord le service en type `NodePort` afin de pouvoir le tester (via la commande `mongo 127.0.0.1:PORT`).

On enlevera le type `NodePort` afin qu'il ne soit pas accessible directement via un port de la VM.


#### Attention un des seuls ports ouvert pour l'accès à minikube à l'intérieur ou à l'extérieur de la vm est le 30001 ... 
