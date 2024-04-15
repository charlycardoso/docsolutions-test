//
//  NetworkError.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case invalidResponse
    case errorInCodeResponse
    case dataSerializationError
    case genericError
}


