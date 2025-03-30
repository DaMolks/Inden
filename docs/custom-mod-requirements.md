# Spécifications du Mod Personnalisé Inden

Ce document détaille les fonctionnalités à implémenter dans le mod personnalisé pour le modpack Inden.

## Fonctionnalités Principales

### 1. World Borders Dynamiques

**Description**: Création de barrières visuelles et physiques autour des zones non encore terraformées.

**Fonctionnalités requises**:
- Système de définition de zones par coordonnées (rectangulaires ou circulaires)
- Barrière visuelle (texture "accès interdit") aux limites des zones
- Effet de dégâts et/ou de repoussement lorsque le joueur tente de traverser
- Configuration par zone (coordonnées, état actuel, niveau de protection)
- API pour activer/désactiver les barrières (déclenchée par les quêtes)

**Intégration avec FTB Quests**:
- Commande `/inden unlock_zone [zone_id]` pour désactiver une barrière

### 2. Système de Transformation des Biomes

**Description**: Modification visuelle des biomes lors de la terraformation, passant d'un état désaturé/mort à un état vivant et coloré.

**Fonctionnalités requises**:
- Système de "couche" de rendu pour désaturer les biomes non terraformés
- Modification de la génération des plantes (désactivée dans les zones non terraformées)
- Animation progressive de "résurrection" lors de la transformation
- Sauvegarde de l'état de terraformation dans les données du monde
- API pour déclencher la terraformation d'une zone

**Aspects techniques**:
- Shader pour désaturer les couleurs dans les zones non terraformées
- Modification des règles de génération des plantes et arbres
- Système de particules pour l'animation de terraformation

### 3. Fusée d'Expédition de Biomasse

**Description**: Système permettant d'envoyer la biomasse compressée dans l'espace, avec animation visuelle.

**Fonctionnalités requises**:
- Block multiblock pour la plateforme de lancement
- Animation de décollage et de vol de la fusée
- Interface pour charger la biomasse compressée
- Système de suivi de la quantité totale de biomasse envoyée
- Déclenchement de la terraformation une fois les seuils atteints

**Intégration avec CraftTweaker**:
- Détection des items `inden:terraform_canister` placés dans le lanceur
- Lecture des tags de données des canisters pour déterminer la quantité de biomasse

### 4. Interface de Scoring

**Description**: Système de score basé sur la terraformation, avec intégration pour streamers.

**Fonctionnalités requises**:
- Suivi des métriques de terraformation par joueur
  - Quantité totale de biomasse produite
  - Zones terraformées
  - Efficacité énergétique
  - Diversité des cultures
- Interface graphique pour afficher les scores
- Système de classement des joueurs sur un serveur
- API pour streamers permettant aux viewers d'influer sur le score

**Intégration avec Twitch/YouTube**:
- Commandes pour que les viewers puissent "faire un don de biomasse"
- Possibilité de nommer les colons d'après les donateurs

## Aspects Techniques

### 1. Nouveaux Blocs à Créer

```
inden:biomass_processor
inden:improved_biomass_processor
inden:biomass_compressor
inden:improved_biomass_compressor
inden:launch_pad
inden:advanced_launch_pad
inden:terraforming_monitor
inden:advanced_terraforming_monitor
```

### 2. Nouveaux Items à Créer

```
inden:biomass
inden:compressed_biomass
inden:biomass_catalyst
inden:advanced_biomass_catalyst
inden:terraform_canister
inden:advanced_terraform_canister
inden:zone_key_1 à inden:zone_key_8
inden:terraform_data_chip
```

### 3. Structure de Données

Stockage des données de terraformation dans le monde:
```java
class TerraformingData {
    Map<String, Zone> zones;
    Map<UUID, PlayerData> playerData;
    long totalBiomassProcessed;
    int globalTerraformingPercentage;
}

class Zone {
    String id;
    BoundingBox boundaries;
    boolean terraformed;
    int terraformingProgress;  // 0-100%
    ZoneType type;
}

class PlayerData {
    UUID playerId;
    long biomassProduced;
    int zonesUnlocked;
    List<String> cultureDiversity;
    float energyEfficiency;
    int score;
}
```

### 4. Hooks et Événements

Liste des événements Forge à capturer:
- `WorldTickEvent` - Pour les animations progressives de terraformation
- `ChunkLoadEvent` - Pour appliquer l'effet de désaturation aux zones non terraformées
- `PlayerInteractEvent` - Pour les interactions avec les machines et lanceurs
- `BlockPlaceEvent` - Pour empêcher la construction dans les zones non terraformées
- `EntitySpawnEvent` - Pour contrôler le spawn des mobs dans les zones non terraformées

### 5. Intégration avec FTB Quests

Commandes à exposer:
```
/inden terraform [zone_id] [percentage]
/inden unlock_zone [zone_id]
/inden set_score @p [amount]
/inden add_biomass @p [amount]
/inden analyze_zone [x] [y] [z]
```

### 6. Paramètres Configurables

Fichier de configuration `inden-config.toml`:
```toml
[general]
# Vitesse de terraformation (0.0-10.0)
terraforming_speed = 1.0
# Difficulté globale (0.5-2.0)
difficulty_multiplier = 1.0

[world_borders]
# Dégâts infligés en traversant une barrière (0-20)
barrier_damage = 5
# Force de repoussement (0.0-5.0)
push_force = 1.5
# Visibilité de la barrière (0-100%)
barrier_visibility = 75

[visuals]
# Niveau de désaturation des zones non terraformées (0-100%)
desaturation_level = 85
# Intensité des particules lors de la terraformation (0-100%)
particle_intensity = 65
# Utiliser des shaders avancés (true/false)
use_advanced_shaders = true
```

## Dépendances et Compatibilité

### Dépendances:
- Forge 1.16.5
- CraftTweaker
- FTB Quests

### Compatibilité testée:
- Biomes O' Plenty
- Oh The Biomes You'll Go
- Dynamic Trees
- MineColonies
- Serene Seasons

## Objectifs de Performance

- Le système de désaturation ne doit pas réduire les FPS de plus de 5%
- Les animations de terraformation doivent pouvoir être désactivées pour les machines moins puissantes
- Optimisation des sauvegardes des données de terraformation pour ne pas impacter le tick rate

## Ressources Nécessaires

### Textures et Modèles:
- Blocs et items mentionnés précédemment
- Effet de barrière pour les world borders
- Animation de lancement de fusée
- Interface du moniteur de terraformation
- Texture de shader pour les zones non terraformées

### Sons:
- Bruits de machines pour les processeurs et compresseurs
- Son du décollage de la fusée
- Ambiance pour les zones terraformées vs non terraformées
- Alarme lors de la tentative de franchissement d'une barrière

## Plan de Développement

1. **Phase Alpha**: Implémentation des blocs, items et mécanique de base
2. **Phase Beta**: Développement du système de zones et de transformation des biomes
3. **Phase Gamma**: Création des effets visuels, animations et interfaces utilisateur
4. **Phase Delta**: Optimisation et intégration avec les mods existants
5. **Release Candidate**: Tests finaux et équilibrage avec le modpack complet

L'objectif est une mise en production dans 2 mois, avec une version alpha disponible dans 2 semaines.