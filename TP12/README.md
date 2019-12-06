# Formation K8S

## TP12 : Helm factorisation

#### Factorisation

Helm propose un systéme de "sub-chart" afin de mieux ranger nos fichiers Yaml présents dans le dossier template. on va avoir un chart principal qui va rassembler plusieurs autres charts.

L'architecture du chart helm classique va se transformer pour utiliser plus de fonctionnalité de helm:
>
>```
> helm/
>   Chart.yaml
>   values.yaml
>   requirements.yaml
>   (.helmignore)
>   (OWNERS)
>   charts/
>      configuration-chart/
>         Chart.yaml
>         templates/
>            (_helpers.tpl)
>            (NOTE.txt)
>            someYamlFile.yaml
>            someOtherYamlFile.yaml
>      frontend-chart/
>         Chart.yaml
>         templates/
>            (_helpers.tpl)
>            (NOTE.txt)
>            someYamlFile.yaml
>            someOtherYamlFile.yaml
>      backend-chart/
>         Chart.yaml
>         templates/
>            (_helpers.tpl)
>            (NOTE.txt)
>            someYamlFile.yaml
>            someOtherYamlFile.yaml
> ```
>
> Dans cet exemple on va avoir un sub-chart chargé de la configuration (namespace, configmap, secret, ingress, ...), un sub-chart pour l'applicatif backend (deployment & service) et un autre pour l'applicatif frontend (deployment & service).
>

l'utilisation et la variabilisation des ces sub-charts vont passer par le nouveau fichier `requirements.yaml` & le fichier `values.yaml`.

Le fichiers `requirements.yaml` va indiquer quels sub-chart il va devoir installer, et quels blocs de configuration il va devoir utiliser dans le `values.yaml`

> Exemple:
>
> requirements.yaml:
>
>```
> - name: frontend-chart
>   version: 0.1.0
>   alias: frontend
>```
>
> values.yaml:
>
>```
> frontend:
>   image: my-image-frontend
>   tag: "1.0"
>   replicas: 2
>```
>
> le champ `alias` du `requirements.yaml` et la premiére clé du bloc du fichier `values.yaml` doivent être les mêmes pour qu'ils se retrouvent.
>
> les champs `name` & `version` du `requirements.yaml` doivent correspondrent à ces mêmes champs dans le `Chart.yaml` du sub-chart correspondant pour qu'il sache quel sub-chart il doit utiliser.

> On peut ajouter des variables communes à tous les sub-chart via le bloc définie en dessous du `values.yaml`:
>
>```
> global:
>    myCommonKey1: myCommonValue1
>    myCommonKey2: myCommonValue2
>```


**On va transformer le chart helm réalisé dans le TP11 en un chart un peu plus complexe comme celui expliqué au dessus.**

> Ce découpage est une simple proposition, si d'autres découpages semblent plus pertinent, libre à vous d'éxpérimenter et de nous faire un retour sur votre vision d'un possible autre découpage.

Dans le cadre de l'application déployé dans cette formation, le passage à un systéme de sub-chart n'est pas obligatoire et n'apporte pas beaucoup de plus-value. Mais dans le cas où l'application évoluerai avec d'autres backend nodeJS par exemple, on pourrait arriver à déployer plusieurs deployment backend en utilisant un seul sub-chart bien paramétré.

En général les micro services d'une même application ont toujours la même configuration de ressource kubernetes, les seules choses qui changent sont souvent les images utilisées et le nom de l'application. C'est pourquoi il peut être interressant de factoriser la définition des ressources, et de simplement avoir à ajouter une entré dans les fichiers `requirements.yaml` & `values.yaml`.

#### Pistes d'améliorations

* Tester les commandes helm install/delete/upgrade/history/rollback et leurs différentes options.
* Rendre plus paramétrables la gestion des request/limits 
* Rendre plus paramétrables la gestion des podPriorityClass
* Utilisation du `_helpers.tpl` pour modifier / attribuer des valeurs selon certaines conditions (environnement par exemple).
* Création d'un chart package pour déployé via helm depuis une archive.