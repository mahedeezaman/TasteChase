//
//  MealCellView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct MealCellView: View {
    let meal: Meal
    @EnvironmentObject var mealVM: MealViewModel
    
    var body: some View {
        HStack {
            if let imageUrl = mealVM.loadImage(from: meal.strMealThumb ?? "") {
                Image(uiImage: imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            Text(meal.strMeal ?? "")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MealCellView(meal:
        Meal(
            strMeal: "Apple Frangipan Tart",
            strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
            idMeal: "52768"
        )
    )
    .environmentObject(MealViewModel())
}
