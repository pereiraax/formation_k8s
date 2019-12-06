# Formation K8S

## Helm démo

#### En modifiant le fichier values.yaml 

> helm install --name form-k8s-prod ./

#### Supprimer définitivement la release 

> helm del --purge form-k8s-prod

#### Directement en ligne de commande

> helm install --set env="prod" --name form-k8s-prod ./

#### Upgrade release

> helm upgrade --set backend.tag=1.4  form-k8s-prod ./