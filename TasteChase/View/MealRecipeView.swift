//
//  MealRecipeView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct MealRecipeView: View {
    @StateObject var mealRecipeVM = MealRecipeViewModel()
    let meal : MealViewDataModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                mealRecipeVM.onAppearValueAssign(meal: meal)
                Task {
                    await mealRecipeVM.getRecipe()
                }
            }
    }
}

#Preview {
    MealRecipeView(
        meal: MealViewDataModel(
            idMeal: "52768",
            strMeal: "Apple Frangipan Tart",
            strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
        )
    )
}
