# Formation K8S

## TP9 - QosClass, gestion des ressources & PDB (PodDisruptionBudget)

Kubernetes gére lui même la gestion du CPU, du disque et de la Mémoire de ses noeuds, en cas de MemoryPressure par exemple il peu choisir d'éliminer un pod pour libérer de la mémoire.

Il est possible de lui indiquer quel pod éliminer dans ces cas là.

#### QosClass & gestion des ressources

Se placer dans un namespace de notre application.

> kub get pod -o jsonpath="{range .items[*]}{@.metadata.name} -> {@.status.qosClass};{end}" |  tr ";" "\n"

> Rappel:
>
> Pour l'instant tous les pods sont en `BestEffort`, ça veut dire que si le cluster doit tuer (passer au status `evicted`) un pod il va d'abord tuer un de ceux là.
>
> Il va choisir dans l'ordre les pods en `BestEffort` -> `Burstable` -> `Guaranteed`
>
> Pour changer ça il faut ajouter une request et une limit au pod afin de modifier sa QosClass.
> 
> L'attribution des QosClass se fait comme suit :
> * BestEffort -> aucun container n'a de request ou de limit.
> * Burstable -> au moins un container a une request de définie
> * Guaranteed -> tous les containers ont une request et une limit de CPU et de Mémoire égales.

_(faculatif: Tester les attributions de QosClass)_

Donner des requests memory aux pods backend de 1G (volontairement trop élévé pour un prochain TP)

Verifier que la QosClass des pods backend modifié ont bien changé. 
