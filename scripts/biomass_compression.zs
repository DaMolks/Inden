#loader crafttweaker

// Inden - Système de Biomasse
// Script définissant les recettes pour la compression de biomasse et le système de lancement

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.registries.IRecipeManager;

// Import des valeurs de biomasse depuis le fichier biomass_values.zs
import scripts.biomass_values.catalystBonus;
import scripts.biomass_values.zoneBiomassThresholds;

// Recette de fabrication du Compresseur de Biomasse
craftingTable.addShaped("biomass_compressor", <item:inden:biomass_compressor>, [
    [<item:minecraft:iron_block>, <item:minecraft:piston>, <item:minecraft:iron_block>],
    [<item:minecraft:piston>, <item:thermal:machine_press>, <item:minecraft:piston>],
    [<item:minecraft:iron_block>, <item:minecraft:redstone_block>, <item:minecraft:iron_block>]
]);

// Recette alternative sans Thermal
if (!loadedMods.contains("thermal")) {
    craftingTable.addShaped("biomass_compressor_alt", <item:inden:biomass_compressor>, [
        [<item:minecraft:iron_block>, <item:minecraft:piston>, <item:minecraft:iron_block>],
        [<item:minecraft:piston>, <item:minecraft:anvil>, <item:minecraft:piston>],
        [<item:minecraft:iron_block>, <item:minecraft:redstone_block>, <item:minecraft:iron_block>]
    ]);
}

// Recette pour comprimer la biomasse
craftingTable.addShaped("compress_biomass", <item:inden:compressed_biomass>, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass_compressor>.reuse(), <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>]
]);

// Recette avec catalyseur pour efficacité améliorée
craftingTable.addShaped("compress_biomass_catalyst", <item:inden:compressed_biomass> * 2, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass_catalyst>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass_compressor>.reuse(), <item:inden:biomass>]
]);

// Recette avec catalyseur avancé pour efficacité supérieure
craftingTable.addShaped("compress_biomass_advanced_catalyst", <item:inden:compressed_biomass> * 3, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:advanced_biomass_catalyst>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass_compressor>.reuse(), <item:inden:biomass>]
]);

// Compresseur de Biomasse Amélioré (débloqué par les quêtes)
craftingTable.addShaped("improved_biomass_compressor", <item:inden:improved_biomass_compressor>, [
    [<item:mekanism:alloy_reinforced>, <item:minecraft:piston>, <item:mekanism:alloy_reinforced>],
    [<item:minecraft:piston>, <item:inden:biomass_compressor>, <item:minecraft:piston>],
    [<item:mekanism:alloy_reinforced>, <item:minecraft:redstone_block>, <item:mekanism:alloy_reinforced>]
]);

// Recette avec compresseur amélioré (double efficacité)
craftingTable.addShaped("improved_compress_biomass", <item:inden:compressed_biomass> * 2, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:improved_biomass_compressor>.reuse(), <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>]
]);

// Recette avec compresseur amélioré et catalyseur
craftingTable.addShaped("improved_compress_biomass_catalyst", <item:inden:compressed_biomass> * 4, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:biomass_catalyst>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:improved_biomass_compressor>.reuse(), <item:inden:biomass>]
]);

// Recette avec compresseur amélioré et catalyseur avancé
craftingTable.addShaped("improved_compress_biomass_advanced_catalyst", <item:inden:compressed_biomass> * 6, [
    [<item:inden:biomass>, <item:inden:biomass>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:advanced_biomass_catalyst>, <item:inden:biomass>],
    [<item:inden:biomass>, <item:inden:improved_biomass_compressor>.reuse(), <item:inden:biomass>]
]);

// Compatibilité avec d'autres mods d'automatisation

// Create Pressing
if (loadedMods.contains("create")) {
    <recipetype:create:pressing>.addRecipe("create_compress_biomass", 
        [<item:inden:compressed_biomass>], 
        <item:inden:biomass> * 9);
}

// Thermal Multiservo Press
if (loadedMods.contains("thermal")) {
    <recipetype:thermal:press>.addRecipe("thermal_compress_biomass", 
        [<item:inden:compressed_biomass>], 
        <item:inden:biomass> * 9, 
        1000);
}

// Mekanism Compressing
if (loadedMods.contains("mekanism")) {
    <recipetype:mekanism:combining>.addRecipe("mek_compress_biomass", 
        <item:inden:biomass> * 8, 
        <item:inden:biomass>, 
        <item:inden:compressed_biomass>);
}

// Industrial Foregoing Compactor
if (loadedMods.contains("industrialforegoing")) {
    // La syntaxe exacte peut varier selon la version d'Industrial Foregoing
    mods.industrialforegoing.Compactor.add(<item:inden:biomass> * 9, <item:inden:compressed_biomass>, 1000);
}

// Terraforming Canister - Contient la biomasse compressée pour le lancement
craftingTable.addShaped("terraform_canister", <item:inden:terraform_canister>, [
    [<item:minecraft:glass>, <item:minecraft:redstone>, <item:minecraft:glass>],
    [<item:minecraft:glass>, <item:inden:compressed_biomass>, <item:minecraft:glass>],
    [<item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>]
]);

// Version améliorée du canister (déblocable par les quêtes)
craftingTable.addShaped("advanced_terraform_canister", <item:inden:advanced_terraform_canister>, [
    [<item:minecraft:glass>, <item:minecraft:redstone_block>, <item:minecraft:glass>],
    [<item:minecraft:glass>, <item:inden:terraform_canister>, <item:minecraft:glass>],
    [<item:minecraft:diamond>, <item:minecraft:diamond>, <item:minecraft:diamond>]
]);

// Le canister amélioré contient plus de biomasse
craftingTable.addShapeless("fill_advanced_canister", 
    <item:inden:advanced_terraform_canister>.withTag({Biomass: 200}), 
    [<item:inden:advanced_terraform_canister>, <item:inden:compressed_biomass>, <item:inden:compressed_biomass>]);

// Système de lancement - Partie 1: Lanceur de base
craftingTable.addShaped("launch_pad", <item:inden:launch_pad>, [
    [<item:minecraft:iron_block>, <item:minecraft:redstone_block>, <item:minecraft:iron_block>],
    [<item:minecraft:iron_block>, <item:minecraft:piston>, <item:minecraft:iron_block>],
    [<item:minecraft:iron_block>, <item:minecraft:blast_furnace>, <item:minecraft:iron_block>]
]);

// Système de lancement - Partie 2: Lanceur avancé
craftingTable.addShaped("advanced_launch_pad", <item:inden:advanced_launch_pad>, [
    [<item:mekanism:alloy_reinforced>, <item:minecraft:redstone_block>, <item:mekanism:alloy_reinforced>],
    [<item:mekanism:alloy_reinforced>, <item:inden:launch_pad>, <item:mekanism:alloy_reinforced>],
    [<item:mekanism:alloy_reinforced>, <item:minecraft:blast_furnace>, <item:mekanism:alloy_reinforced>]
]);

// Système de lancement - Partie 3: Moniteur de Terraformation
craftingTable.addShaped("terraforming_monitor", <item:inden:terraforming_monitor>, [
    [<item:minecraft:glass_pane>, <item:minecraft:glass_pane>, <item:minecraft:glass_pane>],
    [<item:minecraft:redstone>, <item:minecraft:compass>, <item:minecraft:redstone>],
    [<item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>, <item:minecraft:iron_ingot>]
]);

// Moniteur de Terraformation avancé (meilleure précision et portée)
craftingTable.addShaped("advanced_terraforming_monitor", <item:inden:advanced_terraforming_monitor>, [
    [<item:minecraft:glass_pane>, <item:minecraft:ender_eye>, <item:minecraft:glass_pane>],
    [<item:minecraft:redstone_block>, <item:inden:terraforming_monitor>, <item:minecraft:redstone_block>],
    [<item:minecraft:diamond>, <item:minecraft:diamond>, <item:minecraft:diamond>]
]);

// Clés de Zone - déblocables via les quêtes ou avec de la biomasse compressée
// Ces items sont utilisés pour débloquer l'accès aux zones terraformées

// Exemple pour la Zone 1
craftingTable.addShaped("zone_key_1", <item:inden:zone_key_1>, [
    [<item:minecraft:air>, <item:inden:compressed_biomass>, <item:minecraft:air>],
    [<item:inden:compressed_biomass>, <item:minecraft:diamond>, <item:inden:compressed_biomass>],
    [<item:minecraft:air>, <item:inden:compressed_biomass>, <item:minecraft:air>]
]);

// Exemple pour la Zone 2
craftingTable.addShaped("zone_key_2", <item:inden:zone_key_2>, [
    [<item:minecraft:air>, <item:inden:compressed_biomass>, <item:minecraft:air>],
    [<item:inden:compressed_biomass>, <item:inden:zone_key_1>, <item:inden:compressed_biomass>],
    [<item:minecraft:air>, <item:inden:compressed_biomass>, <item:minecraft:air>]
]);

// Puce de données de terraformation - Stocke les données sur la progression
craftingTable.addShaped("terraform_data_chip", <item:inden:terraform_data_chip>, [
    [<item:minecraft:redstone>, <item:minecraft:diamond>, <item:minecraft:redstone>],
    [<item:minecraft:diamond>, <item:minecraft:compass>, <item:minecraft:diamond>],
    [<item:minecraft:redstone>, <item:minecraft:diamond>, <item:minecraft:redstone>]
]);
