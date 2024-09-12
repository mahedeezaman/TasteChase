//
//  NetworkConstants.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import Foundation

struct NetworkConstants {
    let baseUrl = "https://themealdb.com/api.php"
    let mealUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    func mealDetailsUrl(mealId: String) -> String {
        return "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
    }
}
