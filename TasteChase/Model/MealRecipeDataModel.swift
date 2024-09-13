//
//  MealRecipeDataModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-13.
//

import Foundation

struct MealRecipeDataModel {
    var idMeal : String = ""
    var strMeal : String = ""
    var strDrinkAlternate : String = ""
    var strCategory: String = ""
    var strArea : String = ""
    var strInstructions: String = ""
    var strTags: String = ""
    var strYoutube: String = ""
    var ingredientAndMeasure : [(String, String)] = []
    var strSource: String = ""
    var strImageSource: String = ""
    var strCreativeCommonsConfirmed: String = ""
    var dateModified: String = ""
}
