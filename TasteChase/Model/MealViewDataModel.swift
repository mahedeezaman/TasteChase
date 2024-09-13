//
//  MealViewDataModel.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import Foundation
import UIKit

struct MealViewDataModel: Identifiable {
    let id = UUID().uuidString
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    var urlImage : UIImage?
    var fetchTask: Task<Void, Never>?
}
