//
//  MealDataModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import Foundation

struct MealDataModel: Codable {
    let meals: [Meal]?
}

struct Meal: Codable, Identifiable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
    
    var id: String {
        idMeal ?? UUID().uuidString
    }
}
