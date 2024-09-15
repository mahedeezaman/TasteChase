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
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    HStack {
                        Spacer()
                        VStack(spacing: 15) {
                            if let image = meal.urlImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 275, height: 275)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(fromHex: ColorConstants.primaryText), lineWidth: 2)
                                    )
                            } else {
                                progressRing()
                                    .frame(width: 275, height: 275)
                                    .cornerRadius(20)
                            }
                            Text(meal.strMeal)
                                .font(.custom(CeraProFontFamily.black, size: 25))
                                .foregroundStyle(Color(fromHex: ColorConstants.title))
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if !mealRecipeVM.mealsRecipe.strDrinkAlternate.isEmpty {
                            Text(StringConstants.drinkAlternate)
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strDrinkAlternate)")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                        if !mealRecipeVM.mealsRecipe.strCategory.isEmpty {
                            Text(StringConstants.category)
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strCategory)")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                        if !mealRecipeVM.mealsRecipe.strTags.isEmpty {
                            Text(StringConstants.tags)
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strTags)")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                        if !mealRecipeVM.mealsRecipe.strArea.isEmpty {
                            Text(StringConstants.area)
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strArea)")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                    }
                    .foregroundStyle(Color(fromHex: ColorConstants.primaryText))
                    .padding(.vertical)
                    
                    Text(StringConstants.ingredients)
                        .font(.custom(CeraProFontFamily.bold, size: 20))
                        .foregroundStyle(Color(fromHex: ColorConstants.title))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(mealRecipeVM.mealsRecipe.ingredientAndMeasure.indices, id: \.self) { index in
                            let ingAndMeas = mealRecipeVM.mealsRecipe.ingredientAndMeasure[index]
                            Text("\(ingAndMeas.0) : \(ingAndMeas.1)")
                                .font(.custom(CeraProFontFamily.medium, size: 18))
                                .foregroundStyle(Color(fromHex: ColorConstants.primaryText))
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color(fromHex: ColorConstants.cell))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal)
                        }
                    }
                    
                    Text(StringConstants.method)
                        .font(.custom(CeraProFontFamily.bold, size: 20))
                        .foregroundStyle(Color(fromHex: ColorConstants.title))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(0..<mealRecipeVM.mealsRecipe.strInstructions.count, id: \.self) { ind in
                            Text("\(StringConstants.step) \(ind+1): ")
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strInstructions[ind]).")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                    }
                    .foregroundStyle(Color(fromHex: ColorConstants.primaryText))
                    .padding(.horizontal)
                    
                    if !mealRecipeVM.mealsRecipe.strYoutube.isEmpty {
                        HStack {
                            Spacer()
                            YouTubeView(youTubeurl: mealRecipeVM.mealsRecipe.strYoutube)
                                .frame(width: 275, height: 275)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(fromHex: ColorConstants.cell), lineWidth: 0.7)
                                )
                                .cornerRadius(20)
                                .padding()
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        if let url = URL(string: mealRecipeVM.mealsRecipe.strSource), !mealRecipeVM.mealsRecipe.strSource.isEmpty {
                            HStack(alignment: .top) {
                                Text(StringConstants.source)
                                    .font(.custom(CeraProFontFamily.bold, size: 18))
                                
                                Link(mealRecipeVM.mealsRecipe.strSource, destination: url)
                                    .font(.custom(CeraProFontFamily.bold, size: 18))
                                    .lineLimit(1)
                            }
                        }
                        if let url = URL(string: mealRecipeVM.mealsRecipe.strImageSource), !mealRecipeVM.mealsRecipe.strImageSource.isEmpty {
                            HStack(alignment: .top) {
                                Text(StringConstants.imageSource)
                                    .font(.custom(CeraProFontFamily.bold, size: 18))
                                
                                Link(mealRecipeVM.mealsRecipe.strImageSource, destination: url)
                                    .font(.custom(CeraProFontFamily.bold, size: 18))
                            }
                        }
                        if !mealRecipeVM.mealsRecipe.strCreativeCommonsConfirmed.isEmpty {
                            Text(StringConstants.ccConfirmed)
                                .font(.custom(CeraProFontFamily.bold, size: 18)) +
                            
                            Text("\(mealRecipeVM.mealsRecipe.strCreativeCommonsConfirmed)")
                                .font(.custom(CeraProFontFamily.light, size: 18))
                        }
                    }
                    
                    if !mealRecipeVM.mealsRecipe.dateModified.isEmpty {
                        Text(StringConstants.dateModified)
                            .font(.custom(CeraProFontFamily.bold, size: 18)) +
                        
                        Text("\(mealRecipeVM.mealsRecipe.dateModified)")
                            .font(.custom(CeraProFontFamily.light, size: 18))
                    }
                }
                .padding(20)
                .padding(.vertical, 10)
            }
            .disabled(mealRecipeVM.isLoading)
            if mealRecipeVM.isLoading {
                BlurView()
                    .opacity(0.1)
                progressRing()
            }
        }
        .background(Color(fromHex: ColorConstants.background))
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
