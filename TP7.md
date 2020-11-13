# Formation K8S

## TP7 : Multi env w/ Namespace

#### Namespace

Jusque là, les ressources ont été créé dans le namespace par défault car aucun n'a été spécifié. 

Ajouter un namespace `form-k8s-dev`, avec une label représentant l'environnement (`env: dev`).

Recréér toutes les ressources applicatives exceptés le `app-ingress` sur le nouveau namespace sans supprimer les anciennes, le but et d'avoir deux instances de l'application qui tourne en parralléle sur le cluster.

Récapitulatif de ce qui doit etre recréé sur le bon namespace:
* mongo secret
* mongo statefulset
* mongo service
* back secret
* back configmap
* back deployment
* back service
* front deployment
* front service

#### ingress

L'Ingress va devoir contenir deux routes:
* `VM_IP/env/`
* `VM_IP/env/api/`

Un seul ingress est nécessaire car le front et backend vont répondre sur le même basepath (/env). Voir ennoncé du TP4 pour rappel.

#### Limite de l'application

L'application doit répondre sur l'url : `VM_IP/env/` avec le dernier / car les compétences en react du formateur ne permettent pas de faire répondre l'application sur `VM_IP/env`.