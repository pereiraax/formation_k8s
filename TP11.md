# Formation K8S

## TP11 : Helm

#### Rassembler les Yamls

On va rassembler les fichiers yamls décrivant toutes nos ressources :
 * configuration : secret, configmap, namespace
 * mongo: statefulSet & service
 * frontend: deployment & service
 * backend : deployment & service

> l'arborsescence d'un chart helm est conçu comme cela:
>
>```
> helm/
>   Chart.yaml
>   values.yaml
>   (.helmignore)
>   (OWNERS)
>   templates/
>      (_helpers.tpl)
>      (NOTE.txt)
>      someYamlFile.yaml
>      someOtherYamlFile.yaml
> ```
>
> les fichiers entre parenthéses sont optionels.

#### Variabilisation

Les variables que l'on veut variabiliser doivent être remplacés dans nos fichiers YAML.

Les variables sont stockés sous format `clé: valeur` dans le fichier `values.yaml`, elles seront accessibles dans les fichiers descripteurs des ressources via la syntax : `{{ .Values.laVariable }}`

Par exemple une variable `"form-k8s-dev"` deviendra `"form-k8s-{{ .Values.env }}"` 

**Dans un premier temps réalisé une premiére version où sera variablisé seulement l'environnement.**

*tips: la commande `helm template ./` permet de voir si notre chart est bien écrit et de simuler la définition de nos ressources sans rien appliquer.*

L'application doit pouvoir être installé et rendu accessible via la commande `helm install --set env=test --name form-k8s-test ./` 

**Une fois l'application fonctionnelle vous pouvez variabilisé tout ce qui vous semble pertinent de variabiliser**

**Faites en sorte de pouvoir *upgrader* la version du backend via un `--set backend.tag="1.4"` et qu'il n'y ai bien sûr que votre backend qui en soit impacté.**
