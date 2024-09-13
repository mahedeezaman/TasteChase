//
//  MealViewModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [MealViewDataModel] = []
    
    func fetchMeals() async {
        do {
            let responseData = try await NetworkServices.performRequestOperation(url: NetworkConstants.mealUrl, responseType: MealResponseModel.self)
            if let mealsData = responseData.meals {
                DispatchQueue.main.async {
                    for meal in mealsData {
                        let data = MealViewDataModel(
                            idMeal: meal.idMeal ?? "",
                            strMeal: meal.strMeal ?? "",
                            strMealThumb: meal.strMealThumb ?? "",
                            urlImage: nil
                        )
                        if data.idMeal != "" {
                            self.meals.append(data)
                        }
                    }
                }
            }
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
    
    func loadImage(for meal: MealViewDataModel) {
        guard let index = meals.firstIndex(where: { $0.idMeal == meal.idMeal }) else {
            return
        }
        
        meals[index].fetchTask?.cancel()
        
        meals[index].fetchTask = Task {
            try? await Task.sleep(nanoseconds: 5 * 100_000_000)
            if Task.isCancelled {
                return
            }
            if let url = URL(string: meal.strMealThumb),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.meals[index].urlImage = image
                }
            }
        }
    }

    func cancelImageFetch(for meal: MealViewDataModel) {
        guard let index = meals.firstIndex(where: { $0.idMeal == meal.idMeal }) else {
            return
        }
        meals[index].fetchTask?.cancel()
        meals[index].fetchTask = nil
    }
}

