//
//  MealViewModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private var imageCache: [String: UIImage] = [:]
    
    func fetchMeals() async {
        do {
            let responseData = try await NetworkServices.performRequestOperation(url: NetworkConstants.mealUrl, responseType: MealDataModel.self)
            if let mealsData = responseData.meals {
                DispatchQueue.main.async {
                    for meal in mealsData {
                        let data = Meal(strMeal: meal.strMeal ?? "", strMealThumb: meal.strMealThumb ?? "", idMeal: meal.idMeal ?? "")
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
    
    func loadImage(from url: String) -> UIImage? {
        if let cachedImage = imageCache[url] {
            return cachedImage
        }
        guard let imageUrl = URL(string: url),
              let data = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: data) else {
            return nil
        }
        
        DispatchQueue.main.async {
            self.imageCache[url] = image
        }
        return image
    }
}

