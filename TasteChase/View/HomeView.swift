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
        NavigationView {
            VStack {
                Text(StringConstants.selectMeal)
                    .font(.custom(CeraProFontFamily.bold, size: 25))
                
                ZStack {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(mealVM.meals) { meal in
                                NavigationLink {
                                    MealRecipeView(meal: meal)
                                } label: {
                                    MealCellView(meal: meal)
                                        .background(Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    if mealVM.isLoading {
                        BlurView()
                            .opacity(0.1)
                        progressRing()
                    }
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
        .background(Color.blue)
        .navigationTitle("")
        .onAppear {
            mealVM.isLoading = true
            Task {
                await mealVM.fetchMeals()
            }
        }
        .environmentObject(mealVM)
    }
}

#Preview {
    HomeView()
}
