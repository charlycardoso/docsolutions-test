//
//  LoginViewModel.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    func login(user: String, password: String) async -> Bool {
        do {
            let result: LoginModel = try await LoginProvider().login(user: user, password: password)
            return result.isOK
        } catch {
            return false
        }
    }
}
