#loader crafttweaker

// Inden - Système de Biomasse
// Script définissant les recettes pour le traitement de la biomasse

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.registries.IRecipeManager;

// Import des valeurs de biomasse depuis le fichier biomass_values.zs
import scripts.biomass_values.biomassValues;
import scripts.biomass_values.diversityBonus;
import scripts.biomass_values.catalystBonus;

// Recette de fabrication du Processeur de Biomasse
craftingTable.addShaped("biomass_processor", <item:inden:biomass_processor>, [
    [<item:mekanism:steel_casing>, <item:minecraft:diamond>, <item:mekanism:steel_casing>],
    [<item:thermal:machine_frame>, <item:minecraft:composter>, <item:thermal:machine_frame>],
    [<item:mekanism:basic_control_circuit>, <item:minecraft:hopper>, <item:mekanism:basic_control_circuit>]
]);

// Créer la recette personnalisée du processeur
// Cette fonction sera appelée pour chaque entrée dans biomassValues
public function addBiomassProcessingRecipe(input as IItemStack, value as double) as void {
    var outputCount = math.round(value) as int;
    if (outputCount < 1) outputCount = 1;
    if (outputCount > 64) outputCount = 64;
    
    // Recette de base avec le processeur
    craftingTable.addShapeless("biomass_from_" + input.registryName.path, 
        <item:inden:biomass> * outputCount, 
        [input, <item:inden:biomass_processor>.reuse()]);
        
    // Si Thermal est disponible, ajout d'une recette Pulverizer
    if (loadedMods.contains("thermal")) {
        <recipetype:thermal:pulverizer>.addRecipe("pulverize_biomass_" + input.registryName.path,
            [<item:inden:biomass> * outputCount % 150], 
            input, 
            0.2 * value,
            2000);
    }
    
    // Si Mekanism est disponible, ajout d'une recette Crusher
    if (loadedMods.contains("mekanism")) {
        <recipetype:mekanism:crushing>.addRecipe("mek_crush_biomass_" + input.registryName.path,
            input,
            <item:inden:biomass> * outputCount);
    }
    
    // Si Create est disponible, ajout d'une recette Crushing Wheel
    if (loadedMods.contains("create")) {
        <recipetype:create:crushing>.addRecipe("create_crush_biomass_" + input.registryName.path,
            <item:inden:biomass> * outputCount,
            input);
    }
}

// Versions améliorées des machines de traitement de biomasse
// Processeur de biomasse amélioré (déblocable via quêtes)
craftingTable.addShaped("improved_biomass_processor", <item:inden:improved_biomass_processor>, [
    [<item:mekanism:alloy_reinforced>, <item:minecraft:diamond_block>, <item:mekanism:alloy_reinforced>],
    [<item:thermal:machine_frame>, <item:inden:biomass_processor>, <item:thermal:machine_frame>],
    [<item:mekanism:elite_control_circuit>, <item:minecraft:hopper>, <item:mekanism:elite_control_circuit>]
]);

// Recette avec processeur amélioré (double l'efficacité)
public function addImprovedBiomassProcessingRecipe(input as IItemStack, value as double) as void {
    var outputCount = math.round(value * 2) as int;
    if (outputCount < 2) outputCount = 2;
    if (outputCount > 64) outputCount = 64;
    
    craftingTable.addShapeless("improved_biomass_from_" + input.registryName.path, 
        <item:inden:biomass> * outputCount, 
        [input, <item:inden:improved_biomass_processor>.reuse()]);
}

// Recette avec catalyseur (augmente l'efficacité de 100%)
craftingTable.addShapeless("catalyzed_biomass_processing", 
    <item:inden:biomass> * 10, 
    [<tag:items:forge:crops>, <tag:items:forge:crops>, <tag:items:forge:crops>, <tag:items:forge:crops>, 
     <item:inden:biomass_processor>.reuse(), <item:inden:biomass_catalyst>]);

// Recette du catalyseur de biomasse
craftingTable.addShaped("biomass_catalyst", <item:inden:biomass_catalyst>, [
    [<item:minecraft:bone_meal>, <item:minecraft:glowstone_dust>, <item:minecraft:bone_meal>],
    [<item:mysticalagriculture:inferium_essence>, <item:minecraft:diamond>, <item:mysticalagriculture:inferium_essence>],
    [<item:minecraft:bone_meal>, <item:minecraft:glowstone_dust>, <item:minecraft:bone_meal>]
]);

// Catalyseur avancé (débloqué par les quêtes)
craftingTable.addShaped("advanced_biomass_catalyst", <item:inden:advanced_biomass_catalyst>, [
    [<item:minecraft:bone_block>, <item:minecraft:glowstone>, <item:minecraft:bone_block>],
    [<item:mysticalagriculture:tertium_essence>, <item:minecraft:diamond_block>, <item:mysticalagriculture:tertium_essence>],
    [<item:minecraft:bone_block>, <item:minecraft:glowstone>, <item:minecraft:bone_block>]
]);

// Recette avec catalyseur avancé (triple efficacité)
craftingTable.addShapeless("advanced_catalyzed_biomass_processing", 
    <item:inden:biomass> * 30, 
    [<tag:items:forge:crops>, <tag:items:forge:crops>, <tag:items:forge:crops>, <tag:items:forge:crops>, 
     <item:inden:biomass_processor>.reuse(), <item:inden:advanced_biomass_catalyst>]);

// Enregistre toutes les recettes de biomasse à partir des valeurs définies
function registerAllBiomassRecipes() as void {
    for input, value in biomassValues {
        addBiomassProcessingRecipe(input, value);
        addImprovedBiomassProcessingRecipe(input, value);
    }
}

// Recettes de conversion de biomasse pour les modpacks sans mods spécifiques
craftingTable.addShapeless("biomass_from_saplings",
    <item:inden:biomass> * 3,
    [<tag:items:minecraft:saplings>, <tag:items:minecraft:saplings>, <item:inden:biomass_processor>.reuse()]);

craftingTable.addShapeless("biomass_from_leaves",
    <item:inden:biomass> * 1,
    [<tag:items:minecraft:leaves>, <tag:items:minecraft:leaves>, <tag:items:minecraft:leaves>, 
     <tag:items:minecraft:leaves>, <item:inden:biomass_processor>.reuse()]);

// Appel initial pour enregistrer toutes les recettes
registerAllBiomassRecipes();