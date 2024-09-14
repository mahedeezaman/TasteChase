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
        ZStack {
            if mealRecipeVM.isLoading {
                ProgressView()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    HStack {
                        Spacer()
                        VStack {
                            if let image = meal.urlImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                            Text(meal.strMeal)
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if !mealRecipeVM.mealsRecipe.strDrinkAlternate.isEmpty {
                            Text("Drink Alternate: \(mealRecipeVM.mealsRecipe.strDrinkAlternate)")
                        }
                        if !mealRecipeVM.mealsRecipe.strCategory.isEmpty {
                            Text("Category: \(mealRecipeVM.mealsRecipe.strCategory)")
                        }
                        if !mealRecipeVM.mealsRecipe.strTags.isEmpty {
                            Text("Tags: \(mealRecipeVM.mealsRecipe.strTags)")
                        }
                        if !mealRecipeVM.mealsRecipe.strArea.isEmpty {
                            Text("Area: \(mealRecipeVM.mealsRecipe.strArea)")
                        }
                    }
                    .padding(.vertical)
                    
                    Text("Ingredients")
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(mealRecipeVM.mealsRecipe.ingredientAndMeasure.indices, id: \.self) { index in
                            let ingAndMeas = mealRecipeVM.mealsRecipe.ingredientAndMeasure[index]
                            Text("\(ingAndMeas.0) : \(ingAndMeas.1)")
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 0.7)
                                )
                                .padding(.horizontal)
                        }
                    }
                    
                    Text("Method")
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(0..<mealRecipeVM.mealsRecipe.strInstructions.count, id: \.self) { ind in
                            Text("• Step \(ind+1): \(mealRecipeVM.mealsRecipe.strInstructions[ind]).")
                                .padding(.horizontal)
                        }
                    }
                    
                    if !mealRecipeVM.mealsRecipe.strYoutube.isEmpty {
                        YouTubeView(youTubeurl: mealRecipeVM.mealsRecipe.strYoutube)
                            .frame(width: 300, height: 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.red, lineWidth: 0.7)
                            )
                            .cornerRadius(20)
                            .padding()
                    }
                    
                    VStack(alignment: .leading) {
                        if let url = URL(string: mealRecipeVM.mealsRecipe.strSource), !mealRecipeVM.mealsRecipe.strSource.isEmpty {
                            HStack(alignment: .top) {
                                Text("Source: ")
                                Link(mealRecipeVM.mealsRecipe.strSource, destination: url)
                            }
                        }
                        if !mealRecipeVM.mealsRecipe.strImageSource.isEmpty {
                            Text("Image Source: \(mealRecipeVM.mealsRecipe.strImageSource)")
                        }
                        if !mealRecipeVM.mealsRecipe.strCreativeCommonsConfirmed.isEmpty {
                            Text("Creative Commons Confirmed: \(mealRecipeVM.mealsRecipe.strCreativeCommonsConfirmed)")
                        }
                    }
                    if !mealRecipeVM.mealsRecipe.dateModified.isEmpty {
                        Text("Date Modified: \(mealRecipeVM.mealsRecipe.dateModified)")
                    }
                }
                .padding()
                .padding(.vertical, 10)
            }
            .disabled(mealRecipeVM.isLoading)
        }
        .navigationBarTitle("", displayMode: .inline)
        .onAppear {
            mealRecipeVM.isLoading = true
            Task {
                mealRecipeVM.onAppearValueAssign(meal: meal)
                await mealRecipeVM.getRecipe()
            }
        }
        .onDisappear {
            mealRecipeVM.cancelImageFetch()
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
