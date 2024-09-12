//
//  MealCellView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct MealCellView: View {
    let meal: Meal
    func reloadImage(from url: String) -> UIImage? {
        guard let imageUrl = URL(string: url),
              let data = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: data) else { return nil }
        return image
    }
    
    var body: some View {
        HStack {
            if let image = meal.strMealThumb, let imageUrl = reloadImage(from: image) {
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
}
