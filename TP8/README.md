# Formation K8S

## TP8 : Deployment rolling upgrade & Probes

#### Deployment rolling upgrade

Upgrader le deployment de backend avec une nouvelle version de l'image `1.1` -> `1.2`.

> Que se passe t'il ?

#### Health probes

>*Rappel :*
>
> Dans le cas où un pod ne démarre pas, aucune requete n'arrive jusqu'au pod donc le service n'est pas interrompue. 
>
> En revanche, par exemple dans le cas où le pod démarre, mais n'arrive pas à exposer son API, les requetes qui arrivant maintenant sur le pod tombent en erreur.
>
> Pour empécher ça, il faut ajouter des health probes pour autoriser/couper le routing sur le pod si celui ne marche pas.


Implémenter des Heallth probes (readiness / liveness) sur le backend.

> l'image `1.3` du backend expose la route `/health` qui répond : 
> * 200 si connexion à la base ok et API ok
> * 500 si connexion à la base ko
> * 400 si API ko

La readiness se déclenchera après 3 secondes afins de laisser le backend exposé son API.

La liveness se déclenchera après 10 secondes pour laisser la readiness le temps de se mettre en place.

Le pod redémarrera si la liveness échoue deux fois consécutives et ces appels seront espacés de 5 secondes. 
