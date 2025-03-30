# Guide d'Installation du Modpack Inden

Ce document explique comment installer et configurer le modpack Minecraft "Inden" dans différents launchers.

## Pré-requis

- **Java 8 64-bit** (minimum) ou **Java 11 64-bit** (recommandé)
- Configuration PC recommandée :
  - **Processeur** : Intel Core i5 (6e génération ou plus) / AMD Ryzen 5 ou équivalent
  - **RAM** : 8 Go minimum (dont 6 Go alloués à Minecraft)
  - **Stockage** : 2 Go d'espace disque libre
  - **Carte graphique** : Avec 2 Go de VRAM minimum
  - **Internet** : Connexion pour le téléchargement des mods (environ 350 Mo)

## Installation via CurseForge Launcher

1. **Téléchargez le CurseForge Launcher** depuis le [site officiel](https://www.curseforge.com/download/app)
2. **Installez et lancez** l'application
3. **Cliquez sur l'onglet Minecraft** dans la barre latérale
4. **Sélectionnez "Parcourir les modpacks"**
5. **Recherchez "Inden"** et cliquez sur le modpack
6. **Cliquez sur "Installer"** et attendez la fin du téléchargement
7. Une fois l'installation terminée, le modpack apparaîtra dans votre bibliothèque
8. **Cliquez sur "Jouer"** pour lancer le modpack

### Configuration recommandée pour CurseForge

1. Sélectionnez le modpack Inden dans votre bibliothèque
2. Cliquez sur les trois points (...) puis sur "Paramètres du profil"
3. Dans l'onglet "Java Settings", vérifiez que :
   - Java est correctement détecté (Java 8/11 64-bit)
   - L'allocation de mémoire est d'au moins 6 Go (6144 Mo)
4. Cliquez sur "Appliquer" pour sauvegarder les modifications

## Installation via MultiMC/Prism Launcher

1. **Téléchargez MultiMC** depuis le [site officiel](https://multimc.org/) ou **Prism Launcher** depuis [leur site](https://prismlauncher.org/)
2. **Installez et lancez** l'application
3. **Téléchargez le fichier .zip du modpack Inden** depuis [GitHub Releases](https://github.com/DaMolks/Inden/releases)
4. Dans MultiMC/Prism, **cliquez sur "Ajouter une instance"**
5. Sélectionnez **"Importer depuis un zip"**
6. **Naviguez** jusqu'au fichier .zip téléchargé et **sélectionnez-le**
7. **Donnez un nom** à votre instance (par exemple "Inden")
8. **Cliquez sur "OK"** pour créer l'instance
9. Une fois l'instance créée, vous pouvez la lancer en double-cliquant dessus

### Configuration recommandée pour MultiMC/Prism

1. **Faites un clic droit** sur l'instance Inden
2. Sélectionnez **"Modifier l'instance"**
3. Dans l'onglet **"Paramètres"**, augmentez la mémoire allouée à au moins 6 Go
4. Dans l'onglet **"Java"**, vérifiez que vous utilisez Java 8/11 64-bit
5. **Cliquez sur "OK"** pour sauvegarder les modifications

## Installation Manuelle (pour les utilisateurs avancés)

1. **Installez Forge 1.16.5** depuis le [site officiel de Forge](https://files.minecraftforge.net/net/minecraftforge/forge/index_1.16.5.html)
2. **Créez un dossier pour le modpack**
3. **Téléchargez tous les mods** listés dans le document [mods-list.md](https://github.com/DaMolks/Inden/blob/main/docs/mods-list.md)
4. **Placez tous les fichiers .jar** dans le dossier `mods`
5. **Téléchargez les configurations** depuis le [dépôt GitHub](https://github.com/DaMolks/Inden/tree/main/config)
6. **Placez les fichiers de configuration** dans le dossier `config`
7. **Lancez Minecraft** avec le profil Forge 1.16.5

## Résolution des Problèmes Courants

### Le jeu ne se lance pas

1. **Vérifiez la version de Java** - Assurez-vous d'utiliser Java 8 ou 11 en 64-bit
2. **Augmentez la mémoire allouée** - 6 Go minimum recommandés
3. **Vérifiez les logs** - Consultez les logs dans le dossier `logs` pour identifier l'erreur

### Les performances sont mauvaises

1. **Allouez plus de RAM** si possible
2. **Installez OptiFine** pour améliorer les performances
3. **Réduisez la distance de rendu** dans les paramètres graphiques
4. **Désactivez les animations de terraformation avancées** dans les options du mod Inden

### Incompatibilité avec d'autres mods

Le modpack Inden a été soigneusement équilibré. L'ajout d'autres mods peut provoquer des incompatibilités ou des déséquilibres. Si vous souhaitez ajouter des mods, vérifiez d'abord leur compatibilité avec les mods principaux (Ex Nihilo, Mekanism, Create, etc.).

## Configuration Spécifique au Modpack

### Options Recommandées

Une fois le modpack installé, nous recommandons les configurations suivantes :

1. **Graphismes** : Moyen ou Élevé pour apprécier les effets visuels de terraformation
2. **Distance de rendu** : 12 chunks pour un bon équilibre performance/visibilité
3. **Mipmaps** : 4 pour améliorer la qualité des textures distantes
4. **Qualité du ciel** : Activée pour apprécier les changements atmosphériques

### Fichier de Configuration Personnalisé

Vous pouvez éditer le fichier `config/inden-config.toml` pour personnaliser l'expérience :

```toml
# Difficulté globale (0.5 = plus facile, 2.0 = plus difficile)
difficulty_multiplier = 1.0

# Vitesse de terraformation (1.0 = normal, 2.0 = deux fois plus rapide)
terraforming_speed = 1.0

# Activer les effets visuels avancés (true/false)
enable_advanced_visuals = true
```

## Mode Multijoueur

Le modpack Inden est entièrement compatible avec le jeu multijoueur. Pour configurer un serveur :

1. **Téléchargez le pack serveur** depuis [GitHub Releases](https://github.com/DaMolks/Inden/releases)
2. **Suivez les instructions** dans le fichier README inclus dans le pack serveur
3. **Utilisez au moins 4 Go de RAM** pour le serveur (recommandé: 8 Go pour 10+ joueurs)

## Commencer à Jouer

Une fois le modpack installé, vous serez guidé par le système de quêtes FTB. Suivez les quêtes du chapitre "Protocole d'Atterrissage" pour commencer votre aventure de terraformation !

---

Pour plus d'informations ou en cas de problèmes, consultez [le dépôt GitHub du projet](https://github.com/DaMolks/Inden) ou rejoignez [notre serveur Discord](https://discord.gg/indonecraft) pour obtenir de l'aide.

*Guide mis à jour le 30 mars 2025*