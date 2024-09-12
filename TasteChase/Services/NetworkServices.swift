//
//  NetworkServices.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-12.
//

import Foundation

class NetworkServices {
    static func performRequestOperation<T: Codable> (url: String, responseType: T.Type) async throws -> T {
        guard let urlString = URL(string: url) else {
            throw ErrorModels.serverError
        }

        let urlRequest = URLRequest(url: urlString)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
            throw ErrorModels.apiError
        }
        
        return try JSONDecoder().decode(responseType.self, from: data)
    }
}
