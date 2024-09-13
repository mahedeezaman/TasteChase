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
        GeometryReader { gr in
            ZStack {
                if mealRecipeVM.isLoading {
                    ProgressView()
                }
                VStack {
                    Text("Kill")
                }
                .disabled(mealRecipeVM.isLoading)
            }
            .frame(width: gr.size.width, height: gr.size.height)
        }
        .onAppear {
            Task {
                mealRecipeVM.onAppearValueAssign(meal: meal)
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
