//
//  LoginView.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import SwiftUI

struct LoginView: View {
    // usr_prueba1
    // Nuevo1234
    @State var user: String = ""
    @State var pass: String = ""
    @State var showAlert: Bool = false
    @State var loginResult: Bool = false
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            
            VStack(spacing: 18) {
                TextField(text: $user) {
                    Text("Usuario")
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
                
                TextField(text: $pass) {
                    Text("Contraseña")
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
                
                Text("OK")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        Capsule()
                            .foregroundStyle(buttonDisabled() ? Color.gray : Color.blue)
                    }
                    .onTapGesture {
                        if !buttonDisabled() {
                            Task {
                                let result = await viewModel.login(user: user, password: pass)
                                self.loginResult = result
                                print("Result is: \(result)")
                            }
                            showAlert.toggle()
                        }
                    }
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: {
                    Text("Login \(loginResult ? "exitoso" : "fallido")")
                }())
            })
            .padding()
            .navigationTitle("Log in")
        }
    }
    
    private func buttonDisabled() -> Bool {
        return user.isEmpty || pass.isEmpty
    }
}

#Preview {
    ContentView()
}
