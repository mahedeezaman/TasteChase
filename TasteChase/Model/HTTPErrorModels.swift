//
//  HTTPErrorModels.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import Foundation

enum ErrorModels: Error {
    case noInternet
    case parsingError
    case apiError
    case serverError
}
