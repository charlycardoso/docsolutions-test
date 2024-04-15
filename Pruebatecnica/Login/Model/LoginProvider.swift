//
//  LoginProvider.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

class LoginProvider {
    
    func login(user: String, password: String) async throws -> LoginModel {
        let userInfoBody: [String:String] = ["Username":user, "Password":password]
        let bodyParams: [String: [String:String]] = ["Body": userInfoBody]

        let requestModel = RequestModel(endPoint: .login, bodyItems: bodyParams)

        do {
            let model = try await ServiceLayer.callService(requestModel, LoginModel.self)
            return model
        } catch {
            throw error
        }
    }
}
