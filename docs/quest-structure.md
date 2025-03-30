# Structure des Quêtes FTB pour Inden

## Vue d'ensemble

Les quêtes FTB pour Inden sont organisées en chapitres qui suivent la progression naturelle du joueur, de l'arrivée sur une Terre dévastée jusqu'à sa terraformation complète et le retour des humains. Chaque chapitre correspond à une phase majeure du développement et débloque de nouvelles technologies et zones à terraformer.

## Format des fichiers

Les quêtes FTB sont définies dans des fichiers au format SNBT (Stringified NBT) avec la structure suivante :
- Dossier principal : `/config/ftbquests/`
- Fichier de chapitres : `/chapters/[chapitre_id].snbt`
- Fichier de quêtes : `/quests/[quete_id].snbt`

## Chapitres de Quêtes

### Chapitre 1: Protocole d'Atterrissage

**ID**: `landing_protocol`  
**Description**: "Vous venez d'atterrir sur une Terre abandonnée. Activez vos systèmes et commencez la mission de terraformation."

**Quêtes:**
1. **Activation des Systèmes** - Création du premier coffre et établissement d'une base simple
2. **Premiers Outils** - Fabrication des outils Ex Nihilo (marteau, tamis)
3. **Source d'Énergie Initiale** - Construction d'un générateur de base Create ou Mekanism
4. **Analyse du Sol** - Utilisation du tamis pour obtenir les premières ressources
5. **Plantation Initiale** - Création des premières cultures de base
6. **Base d'Opérations** - Construction d'un abri de base avec stockage

**Récompenses:** Graines de base, matériaux de construction, composants électroniques simples

### Chapitre 2: Production de Biomasse

**ID**: `biomass_production`  
**Description**: "La Terre a besoin de vie. Développez des systèmes de production de biomasse pour commencer le processus de terraformation."

**Quêtes:**
1. **Agriculture de Base** - Développement de fermes manuelles avec Pam's HarvestCraft
2. **Automatisation Agricole** - Introduction aux machines d'automatisation agricole (Create ou Industrial Foregoing)
3. **Traitement de la Biomasse** - Construction d'un système pour transformer les plantes en biomasse
4. **Stockage Amélioré** - Mise en place d'un système de stockage simple (coffres ou débutant AE2)
5. **Production d'Énergie Stable** - Construction d'un réseau énergétique fiable (Mekanism ou Thermal)
6. **Système d'Irrigation** - Mise en place d'un système d'irrigation pour cultures

**Récompenses:** Graines avancées, composants d'automatisation, ressources rares initiales

### Chapitre 3: Première Terraformation

**ID**: `first_terraforming`  
**Description**: "Il est temps de tester le processus de terraformation sur une petite zone. Préparez votre première expédition de biomasse."

**Quêtes:**
1. **Station de Compression** - Construction d'une machine pour compresser la biomasse
2. **Système de Lancement** - Préparation du système d'envoi de biomasse vers l'espace
3. **Premier Lancement** - Envoi du premier paquet de biomasse (débloque la première zone de terraformation)
4. **Analyse de Zone** - Exploration de la première zone terraformée
5. **Culture Spécialisée** - Développement de nouvelles cultures adaptées à la zone terraformée
6. **Monitoring Environnemental** - Installation d'un système de suivi des zones terraformées

**Récompenses:** Déverrouillage de la première zone terraformée (changement visuel), nouvelles ressources de la zone

### Chapitre 4: Expansion Technologique

**ID**: `tech_expansion`  
**Description**: "Avec les nouvelles ressources disponibles, développez des technologies plus avancées pour accélérer la terraformation."

**Quêtes:**
1. **Réseau AE2** - Construction d'un système AE2 fonctionnel pour gérer les ressources
2. **Machines Mekanism** - Développement des machines Mekanism pour un traitement avancé
3. **Production Énergétique Avancée** - Construction de générateurs avancés (solaire, éolien)
4. **Systèmes Create** - Utilisation de Create pour les processus mécaniques complexes
5. **Extraction Automatisée** - Mise en place de systèmes d'extraction automatisés
6. **Production en Masse** - Développement de chaînes de production automatisées

**Récompenses:** Composants technologiques avancés, déverrouillage de nouvelles recettes

### Chapitre 5: Terraformation à Grande Échelle

**ID**: `large_scale_terraforming`  
**Description**: "L'heure est venue d'étendre considérablement vos efforts de terraformation. Préparez des lancements multiples et terraformez plusieurs zones."

**Quêtes:**
1. **Fermes Industrielles** - Construction de fermes à grande échelle avec Industrial Foregoing
2. **Centre de Lancement** - Amélioration du système de lancement pour des envois multiples
3. **Terraformation Zone Alpha** - Terraformation d'une zone importante (débloque une grande région)
4. **Système Climatique** - Introduction au contrôle climatique via Environmental Tech
5. **Ressources Renouvelables** - Mise en place de systèmes de production de ressources renouvelables
6. **Réseau Énergétique Global** - Extension du réseau énergétique à toutes les zones terraformées

**Récompenses:** Composants de terraformation avancés, nouvelles technologies

### Chapitre 6: Préparation à la Colonisation

**ID**: `colonization_prep`  
**Description**: "Les capteurs indiquent que la Terre devient habitable. Préparez l'arrivée des premiers colons humains."

**Quêtes:**
1. **Centre de Commandement** - Construction d'un bâtiment central MineColonies
2. **Infrastructures de Base** - Préparation des infrastructures nécessaires pour les colons
3. **Quartiers d'Habitation** - Construction de logements pour les colons
4. **Ressources Alimentaires** - Mise en place d'un système alimentaire durable
5. **Systèmes de Sécurité** - Protection des zones colonisées
6. **Installation de Communication** - Construction d'un système de communication avec l'espace

**Récompenses:** Premiers colons, plans de construction, ressources spéciales pour bâtiments

### Chapitre 7: Retour de l'Humanité

**ID**: `humanity_return`  
**Description**: "Les premiers colons arrivent sur Terre. Développez une colonie fonctionnelle pour accueillir le retour progressif de l'humanité."

**Quêtes:**
1. **Premier Contact** - Accueil des premiers colons humains
2. **Expansion Coloniale** - Développement de la colonie avec MineColonies
3. **Spécialisation des Colons** - Formation des colons dans différents métiers
4. **Centre de Recherche** - Construction d'un bâtiment de recherche pour débloquer des technologies avancées
5. **Équilibre Écologique** - Maintien de l'équilibre entre développement humain et écosystème
6. **Célébration Terrestre** - Organisation d'un événement spécial pour célébrer le retour réussi de l'humanité

**Récompenses:** Colons avancés, technologies finales, bonus de score

### Chapitre 8: Terraformation Planétaire

**ID**: `planetary_terraforming`  
**Description**: "Le rêve devient réalité - la terraformation complète de la planète est désormais possible. Lancez le processus final."

**Quêtes:**
1. **Réseau de Terraformation** - Installation d'un réseau planétaire de terraformation
2. **Protocole Atmosphérique** - Stabilisation de l'atmosphère terrestre
3. **Restauration Océanique** - Purification et restauration des océans
4. **Régénération Forestière** - Plantations à échelle continentale
5. **Équilibre Climatique** - Établissement d'un équilibre climatique stable
6. **Nouvelle Aube** - Activation du processus final de terraformation planétaire

**Récompenses:** Transformation complète du monde, déblocage du mode créatif, score maximum

## Système de Progression et Récompenses

### Types de Récompenses
- **Items**: Ressources, outils, composants technologiques
- **Recettes**: Déblocage de nouvelles recettes
- **Zones**: Déverrouillage de nouvelles zones à explorer et terraformer
- **Colons**: Arrivée de nouveaux colons avec compétences spéciales
- **Score**: Points contribuant au système de classement

### Système de Biomasse
La biomasse est une ressource clé calculée en fonction de:
- Types de cultures produites
- Efficacité des systèmes agricoles
- Diversité des écosystèmes restaurés

Le système de scoring tiendra compte de:
- Quantité totale de biomasse produite
- Nombre de zones terraformées
- Diversité des cultures et écosystèmes
- Efficacité énergétique des systèmes
- Taille et fonctionnalité de la colonie humaine

## Format d'un fichier SNBT pour une quête

```snbt
{
	id: "quest_unique_id",
	x: 0.0d,
	y: 0.0d,
	text: [
		"Description de la quête visible aux joueurs"
	],
	dependencies: [
		"quest_prerequis_id"
	],
	tasks: [{
		id: "task_unique_id",
		type: "item",
		item: "minecraft:dirt",
		count: 1L
	}],
	rewards: [{
		id: "reward_unique_id",
		type: "item",
		item: "minecraft:diamond",
		count: 1
	}]
}
```

## Exemples de Quêtes SNBT

### Quête 1: Activation des Systèmes (Chapitre 1)

```snbt
{
	id: "activation_systems",
	x: -3.0d,
	y: 0.0d,
	title: "Activation des Systèmes",
	icon: "minecraft:crafting_table",
	description: [
		"Vos systèmes de base sont en mode veille après le long voyage.",
		"",
		"Établissez un espace de travail minimum pour commencer la mission."
	],
	dependencies: [],
	tasks: [
		{
			id: "craft_table",
			type: "item",
			item: "minecraft:crafting_table",
			count: 1L
		},
		{
			id: "craft_chest",
			type: "item",
			item: "minecraft:chest",
			count: 1L
		}
	],
	rewards: [
		{
			id: "starter_food",
			type: "item",
			item: "minecraft:bread",
			count: 16
		},
		{
			id: "starter_torch",
			type: "item",
			item: "minecraft:torch",
			count: 16
		}
	]
}
```

### Quête 2: Compression de Biomasse (Chapitre 3)

```snbt
{
	id: "biomass_compression",
	x: 0.0d,
	y: 3.0d,
	title: "Compression de Biomasse",
	icon: "inden:biomass_compressor",
	description: [
		"Pour envoyer la biomasse dans l'espace, elle doit être compressée et préparée.",
		"",
		"Construisez une machine de compression de biomasse pour préparer vos premiers envois."
	],
	dependencies: [
		"biomass_production_complete"
	],
	tasks: [
		{
			id: "craft_compressor",
			type: "item",
			item: "inden:biomass_compressor",
			count: 1L
		},
		{
			id: "craft_biomass_block",
			type: "item",
			item: "inden:compressed_biomass",
			count: 4L
		}
	],
	rewards: [
		{
			id: "reward_efficient_recipe",
			type: "command",
			command: "/crafttweaker recipes add inden:efficient_compressor",
			player_command: false
		},
		{
			id: "reward_biomass_boost",
			type: "item",
			item: "inden:biomass_catalyst",
			count: 2
		}
	]
}
```

## Prochaines étapes de développement des quêtes

1. Finaliser tous les fichiers SNBT pour chaque chapitre
2. Créer les items personnalisés nécessaires (biomasse, compresseur, etc.)
3. Définir les recettes CraftTweaker pour les items personnalisés
4. Tester la progression des quêtes en jeu
5. Équilibrer les récompenses pour maintenir l'intérêt du joueur
6. Intégrer le système de scoring pour streamers

*Dernière mise à jour: 30 mars 2025*