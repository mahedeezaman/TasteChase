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
                    Text("Select a Meal")
                    Spacer()
                }
                .padding()
                ScrollView {
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
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .task {
            await mealVM.fetchMeals()
        }
        .environmentObject(mealVM)
    }
}

#Preview {
    HomeView()
}
