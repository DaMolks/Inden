#loader crafttweaker

// Inden - Système de Biomasse
// Script définissant les valeurs de biomasse pour différentes cultures et matériaux organiques

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.data.MapData;

// Définition d'un dictionnaire de valeurs de biomasse pour les cultures
public var biomassValues as double[IItemStack] = {
    // Cultures Minecraft de base
    <item:minecraft:wheat> : 1.0,
    <item:minecraft:carrot> : 1.0,
    <item:minecraft:potato> : 1.0,
    <item:minecraft:beetroot> : 1.0,
    <item:minecraft:melon_slice> : 0.5,
    <item:minecraft:pumpkin> : 4.0,
    <item:minecraft:apple> : 2.0,
    <item:minecraft:sweet_berries> : 0.8,
    <item:minecraft:cocoa_beans> : 1.2,
    <item:minecraft:kelp> : 0.5,
    <item:minecraft:bamboo> : 0.3,
    <item:minecraft:sugar_cane> : 0.7,
    <item:minecraft:cactus> : 0.8,
    <item:minecraft:chorus_fruit> : 3.0,
    <item:minecraft:nether_wart> : 2.0,
    
    // Pam's HarvestCraft 2 - Cultures
    <item:pamhc2crops:cornitem> : 2.0,
    <item:pamhc2crops:riceitem> : 2.0,
    <item:pamhc2crops:soybeanitem> : 3.0,
    <item:pamhc2crops:cabbageitem> : 2.5,
    <item:pamhc2crops:tomatoitem> : 1.5,
    <item:pamhc2crops:bellpepperitem> : 1.8,
    <item:pamhc2crops:broccoliitem> : 2.2,
    <item:pamhc2crops:caulifloweritem> : 2.2,
    <item:pamhc2crops:cottonitem> : 1.7,
    <item:pamhc2crops:peasitem> : 1.8,
    <item:pamhc2crops:spinachitem> : 1.5,
    <item:pamhc2crops:lettuceitem> : 1.5,
    <item:pamhc2crops:cucumberitem> : 1.7,
    <item:pamhc2crops:zucchiniitem> : 1.8,
    
    // Pam's HarvestCraft 2 - Fruits
    <item:pamhc2trees:apricotitem> : 2.2,
    <item:pamhc2trees:avocadoitem> : 2.5,
    <item:pamhc2trees:bananaitem> : 2.0,
    <item:pamhc2trees:cherryitem> : 1.8,
    <item:pamhc2trees:coconutitem> : 3.0,
    <item:pamhc2trees:dragonfruititem> : 3.5,
    <item:pamhc2trees:orangeitem> : 2.0,
    <item:pamhc2trees:pearitem> : 2.0,
    <item:pamhc2trees:lemonitem> : 1.8,
    <item:pamhc2trees:limeitem> : 1.8,
    <item:pamhc2trees:mangoitem> : 2.3,
    
    // Mystical Agriculture
    <item:mysticalagriculture:inferium_essence> : 10.0,
    <item:mysticalagriculture:prudentium_essence> : 25.0,
    <item:mysticalagriculture:tertium_essence> : 50.0,
    <item:mysticalagriculture:imperium_essence> : 100.0,
    <item:mysticalagriculture:supremium_essence> : 250.0,
    <item:mysticalagriculture:fertilized_essence> : 15.0,
    <item:mysticalagriculture:soulium_dust> : 20.0,
    
    // Aliments transformés (valeur ajoutée)
    <item:pamhc2foodcore:toastitem> : 3.0,
    <item:pamhc2foodextended:cornbreaditem> : 5.0,
    <item:pamhc2foodextended:raisinsitem> : 4.0,
    <item:minecraft:cake> : 10.0,
    <item:minecraft:honey_bottle> : 7.0,
    <item:minecraft:golden_apple> : 25.0,
    <item:minecraft:enchanted_golden_apple> : 100.0,
    
    // Matières organiques diverses
    <item:minecraft:bone_meal> : 1.0,
    <item:minecraft:rotten_flesh> : 0.5,
    <item:minecraft:bone> : 2.0,
    <item:minecraft:spider_eye> : 1.0,
    <item:minecraft:egg> : 2.0,
    <item:minecraft:leather> : 4.0,
    <item:minecraft:feather> : 1.0,
    <item:minecraft:ink_sac> : 2.0,
    
    // Matériaux forestiers
    <item:minecraft:oak_sapling> : 3.0,
    <item:minecraft:spruce_sapling> : 3.0,
    <item:minecraft:birch_sapling> : 3.0,
    <item:minecraft:jungle_sapling> : 3.0,
    <item:minecraft:acacia_sapling> : 3.0,
    <item:minecraft:dark_oak_sapling> : 3.0,
    <item:minecraft:oak_leaves> : 0.5,
    <item:minecraft:spruce_leaves> : 0.5,
    <item:minecraft:birch_leaves> : 0.5,
    <item:minecraft:jungle_leaves> : 0.5,
    <item:minecraft:acacia_leaves> : 0.5,
    <item:minecraft:dark_oak_leaves> : 0.5
};

// Facteurs de bonus pour types de cultures diversifiés
// Ce multiplicateur est appliqué quand le joueur utilise différents types de cultures
public var diversityBonus as double = 1.25;

// Bonus pour l'utilisation d'un Catalyseur de Biomasse
public var catalystBonus as double = 2.0;

// Facteurs d'efficacité pour différentes méthodes de production
public var productionEfficiency as double[string] = {
    "manual" : 1.0,        // Production manuelle
    "create" : 1.2,        // Automatisation avec Create
    "industrial" : 1.5,    // Automatisation avec Industrial Foregoing
    "botanical" : 1.3,     // Production via Botany Pots
    "mystical" : 1.8       // Production via Mystical Agriculture
};

// Seuils de biomasse pour débloquer les zones de terraformation
public var zoneBiomassThresholds as int[] = [
    1000,    // Zone 1
    5000,    // Zone 2
    15000,   // Zone 3
    50000,   // Zone 4
    100000,  // Zone 5
    250000,  // Zone 6
    500000,  // Zone 7
    1000000  // Zone 8 (planète entière)
];

// Fonction pour calculer la valeur de biomasse avec bonus de diversité
public function calculateBiomassWithBonus(inputs as IItemStack[], method as string) as double {
    var totalValue = 0.0;
    var uniqueItems = new stdlib.List<string>();
    
    // Calcul de la valeur de base et comptage des types uniques
    for input in inputs {
        if (biomassValues.keySet.contains(input)) {
            totalValue += biomassValues[input];
            if (!uniqueItems.contains(input.registryName.toString())) {
                uniqueItems.add(input.registryName.toString());
            }
        }
    }
    
    // Appliquer bonus de diversité si plusieurs types
    if (uniqueItems.size() > 1) {
        totalValue *= (1.0 + (diversityBonus - 1.0) * (uniqueItems.size() - 1) / 5.0);
        // Maximum 25% de bonus pour 5+ types uniques
    }
    
    // Appliquer bonus de méthode de production
    if (productionEfficiency.keySet.contains(method)) {
        totalValue *= productionEfficiency[method];
    }
    
    return totalValue;
}