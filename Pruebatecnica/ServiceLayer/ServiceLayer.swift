//
//  ServiceLayer.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

@MainActor
class ServiceLayer {
    
    static func callService<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        let serviceURL = URLComponents(string: requestModel.getURL())
        // serviceURL?.queryItems = buildQueryItems(params: requestModel.queryItems ?? [:])
        // serviceURL?.queryItems?.append(URLQueryItem(name: "", value: ""))
        
        guard let componentURL = serviceURL?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = requestModel.httpMethod.rawValue
        do {
            let params = requestModel.bodyItems ?? [:]
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch {
            throw NetworkError.dataSerializationError
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            if (httpResponse.statusCode > 299) {
                throw NetworkError.errorInCodeResponse
            }

            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            } catch {
                throw NetworkError.dataSerializationError
            }
        } catch {
            throw NetworkError.genericError
        }
    }
    
    static func buildQueryItems(params: [String: String]) -> [URLQueryItem] {
        var items = [URLQueryItem]()

        for param in params {
            items.append(URLQueryItem(name: param.key, value: param.value))
        }
        
        return items
    }
}
