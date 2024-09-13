//
//  ContentView.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

struct HomeView: View {
    @StateObject var mealVM = MealViewModel()

    var body: some View {
        GeometryReader { gr in
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(mealVM.meals) { meal in
                        MealCellView(meal: meal)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await mealVM.fetchMeals()
            }
        }
        .background(Color.black)
        .environmentObject(mealVM)
    }
}

#Preview {
    HomeView()
}
