//
//  ContentView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct HomeView: View {
    let tempVal = [
        Meal(
            strMeal: "Apam balik",
            strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            idMeal: "53049"
        ),
        Meal(
            strMeal: "Apple & Blackberry Crumble",
            strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
            idMeal: "52893"
        ),
        Meal(
            strMeal: "Apple Frangipan Tart",
            strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
            idMeal: "52768"
        )
    ]

    var body: some View {
        GeometryReader { gr in
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(tempVal) { meal in
                        MealCellView(meal: meal)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color.black)
    }
}

#Preview {
    HomeView()
}
