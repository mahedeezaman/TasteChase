//
//  MealCellView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct MealCellView: View {
    let meal: MealViewDataModel
    @EnvironmentObject var mealVM: MealViewModel
    
    var body: some View {
        HStack {
            if let image = meal.urlImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            Text(meal.strMeal)
            Spacer()
        }
        .padding()
        .onAppear {
            mealVM.loadImage(for: meal)
        }
        .onDisappear {
            mealVM.cancelImageFetch(for: meal)
        }
    }
}

#Preview {
    MealCellView(
        meal: MealViewDataModel(
            idMeal: "52768",
            strMeal: "Apple Frangipan Tart",
            strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
        )
    )
    .environmentObject(MealViewModel())
}
