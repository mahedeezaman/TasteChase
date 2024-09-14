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
                HStack {
                    Text("Select a Meal for Recipe")
                }
                .padding()
                
                ScrollView {
                    if mealVM.isLoading {
                        ProgressView()
                    } else {
                        LazyVStack(spacing: 10) {
                            ForEach(mealVM.meals) { meal in
                                NavigationLink {
                                    MealRecipeView(meal: meal)
                                } label: {
                                    MealCellView(meal: meal)
                                        .background(Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
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
