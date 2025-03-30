# Système de Biomasse et Terraformation

Ce document détaille l'implémentation technique du système de biomasse et de terraformation, élément central du modpack Inden.

## Vue d'ensemble

Le système de biomasse fonctionne comme suit:
1. Le joueur cultive et récolte diverses plantes
2. Ces récoltes sont transformées en biomasse par une machine dédiée
3. La biomasse est compressée et envoyée dans l'espace via une fusée
4. Une fois un seuil atteint, une zone de la carte est terraformée

## Items Personnalisés Nécessaires

### Items de Base
```
inden:biomass                  // Biomasse brute
inden:compressed_biomass       // Biomasse compressée
inden:biomass_catalyst         // Catalyseur pour améliorer l'efficacité
inden:terraform_canister       // Conteneur final pour lancement
```

### Machines
```
inden:biomass_processor        // Transforme les cultures en biomasse
inden:biomass_compressor       // Compresse la biomasse
inden:launch_pad               // Lanceur de fusée
inden:terraforming_monitor     // Surveille la progression
```

### Items de Progression
```
inden:zone_key_1               // à inden:zone_key_8 (pour débloquer les zones)
inden:terraform_data_chip      // Stocke les informations de progression
```

## Équilibrage Suggéré

- Les cultures de base (blé, carottes, etc.) produisent des quantités modestes de biomasse
- Les cultures avancées (Pam's HarvestCraft, Mystical Agriculture) sont beaucoup plus efficaces
- La diversité des cultures augmente la production via un multiplicateur de bonus
- Les catalyseurs permettent d'améliorer l'efficacité mais nécessitent des ressources rares
- Les zones plus grandes nécessitent exponentiellement plus de biomasse pour être terraformées

## Progression de Terraformation

1. **Zone 1**: Petite zone autour du point d'arrivée (1,000 biomasse)
2. **Zone 2**: Extension modérée (5,000 biomasse)
3. **Zone 3**: Extension significative (15,000 biomasse)
4. **Zone 4**: Biome complet (50,000 biomasse)
5. **Zone 5**: Région complète (100,000 biomasse)
6. **Zone 6**: Continent partiel (250,000 biomasse)
7. **Zone 7**: Continent entier (500,000 biomasse)
8. **Zone 8**: Planète entière (1,000,000 biomasse)

## Avantages du Système

1. **Incitation à la diversité**: Les joueurs sont encouragés à cultiver différentes plantes
2. **Automatisation progressive**: Le système commence manuellement et devient automatisable
3. **Récompense visuelle**: Les joueurs voient leur progression par la transformation des biomes
4. **Objectif commun**: Les joueurs en serveur peuvent collaborer pour terraformer plus rapidement
5. **Fonctionnalité pour streamers**: Les viewers peuvent contribuer via des "dons de biomasse"

## Intégration avec les Quêtes FTB

Le système de quêtes FTB guide les joueurs à travers les étapes de:
- Construction des machines nécessaires
- Production de biomasse
- Lancement et suivi de la terraformation
- Déblocage de nouvelles zones et technologies

*Note: L'implémentation complète nécessite des scripts CraftTweaker et un mod personnalisé pour la gestion des zones et la transformation visuelle des biomes.*