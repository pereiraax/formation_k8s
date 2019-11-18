# Formation K8S

## TP5 : Persistence des données

#### MongoDb deployment to statefulset

Redémarrer le pod mongo va supprimer toutes les données enregistrées... 

Pour palier à ce soucis on va devoir utiliser un stockage persistent.

Mais premiérement on va transformer notre deployment MongoDb en statefulset cela va permettre de toujours rattacher le bon stockage persistent au bon pod créé par notre StatefulSet (en cas de réplicas de notre pod).

La déclaration d'un StatefulSet et celle d'un Deployment sont sensiblement les mêmes.

Une des différences est que le StatefulSet demande absolument un Service, il faut lui indiquer lequel utilisé. 

En revanche il ne le créé pas tout seul il faut le créér pour lui.

#### PersistentVolumeClaim

Une fois l'application mongo passé en StatefulSet on va pouvoir lui attacher une stockage persistent via l'attribut volumeClaimTemplates du StatefulSet.

Quelques exigences à respecter : 
* Le stockage sera de 1 Giga
* le mode d'accés au stockage sera `ReadWriteOnce`
* le stockage sera monté dans le repertoire `/data/db` du container Mongo