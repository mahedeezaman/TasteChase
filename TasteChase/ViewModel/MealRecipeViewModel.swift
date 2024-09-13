//
//  MealRecipeViewModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-13.
//

import SwiftUI

class MealRecipeViewModel: ObservableObject {
    @Published var mealsRecipe = MealRecipeDataModel()
    @Published var isLoading = false
    
    func onAppearValueAssign(meal: MealViewDataModel) {
        self.isLoading = true
        mealsRecipe.idMeal = meal.idMeal
        mealsRecipe.strMeal = meal.strMeal
        mealsRecipe.urlImage = meal.urlImage
    }
    
    func getRecipe() async {
        do {
            let responseData = try await NetworkServices.performRequestOperation(url: NetworkConstants.mealDetailsUrl(mealId: mealsRecipe.idMeal), responseType: MealRecipeResponseModel.self)
            if let mealRecipe = responseData.meals, let mealsRecipeData = mealRecipe.first {
                
                let ingredients = [
                    mealsRecipeData.strIngredient1, mealsRecipeData.strIngredient2, mealsRecipeData.strIngredient3, mealsRecipeData.strIngredient4,mealsRecipeData.strIngredient5, mealsRecipeData.strIngredient6, mealsRecipeData.strIngredient7, mealsRecipeData.strIngredient8, mealsRecipeData.strIngredient9, mealsRecipeData.strIngredient10, mealsRecipeData.strIngredient11, mealsRecipeData.strIngredient12, mealsRecipeData.strIngredient13, mealsRecipeData.strIngredient14, mealsRecipeData.strIngredient15, mealsRecipeData.strIngredient16, mealsRecipeData.strIngredient17, mealsRecipeData.strIngredient18, mealsRecipeData.strIngredient19, mealsRecipeData.strIngredient20
                ]
                
                let measures = [
                    mealsRecipeData.strMeasure1, mealsRecipeData.strMeasure2, mealsRecipeData.strMeasure3, mealsRecipeData.strMeasure4, mealsRecipeData.strMeasure5, mealsRecipeData.strMeasure6, mealsRecipeData.strMeasure7, mealsRecipeData.strMeasure8, mealsRecipeData.strMeasure9, mealsRecipeData.strMeasure10, mealsRecipeData.strMeasure11, mealsRecipeData.strMeasure12, mealsRecipeData.strMeasure13, mealsRecipeData.strMeasure14, mealsRecipeData.strMeasure15, mealsRecipeData.strMeasure16, mealsRecipeData.strMeasure17, mealsRecipeData.strMeasure18, mealsRecipeData.strMeasure19, mealsRecipeData.strMeasure20
                ]
                
                DispatchQueue.main.async {[weak self] in
                    self?.mealsRecipe.strDrinkAlternate = mealsRecipeData.strDrinkAlternate ?? ""
                    self?.mealsRecipe.strCategory = mealsRecipeData.strCategory ?? ""
                    self?.mealsRecipe.strArea = mealsRecipeData.strArea ?? ""
                    self?.mealsRecipe.strInstructions = mealsRecipeData.strInstructions ?? ""
                    self?.mealsRecipe.strTags = mealsRecipeData.strTags ?? ""
                    self?.mealsRecipe.strYoutube = mealsRecipeData.strYoutube ?? ""
                    self?.mealsRecipe.strSource = mealsRecipeData.strSource ?? ""
                    self?.mealsRecipe.strImageSource = mealsRecipeData.strImageSource ?? ""
                    self?.mealsRecipe.strCreativeCommonsConfirmed = mealsRecipeData.strCreativeCommonsConfirmed ?? ""
                    self?.mealsRecipe.dateModified = mealsRecipeData.dateModified ?? ""
                    self?.mealsRecipe.ingredientAndMeasure = []
                    
                    for (ingredient, measure) in zip(ingredients, measures) {
                        if let ingredient = ingredient, !ingredient.isEmpty,
                           let measure = measure, !measure.isEmpty {
                            self?.mealsRecipe.ingredientAndMeasure.append((ingredient, measure))
                        }
                    }
                    print(self?.mealsRecipe ?? [])
                    self?.isLoading = false
                }
            }
        } catch {
            self.isLoading = false
            print("Error fetching Meals Recipe: \(error)")
        }
    }
}
