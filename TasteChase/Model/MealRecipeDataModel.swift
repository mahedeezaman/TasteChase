//
//  MealRecipeDataModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-13.
//

import Foundation

struct MealRecipeDataModel {
    var idMeal, strMeal, strDrinkAlternate, strCategory: String
    var strArea, strInstructions: String
    var strTags: String
    var strYoutube: String
    var ingredientAndMeasure : [(String, String)]
    var strSource: String
    var strImageSource: String
    var strCreativeCommonsConfirmed: String
    var dateModified: String
}
