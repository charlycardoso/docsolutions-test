//
//  FormView.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        NavigationStack {
            VStack() {
                HStack {
                    TextField(text: .constant("")) {
                        Text("Buscar")
                            .padding()
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    .padding()
                    
                    Button(action: {
                        
                    }) {
                        Text("OK")
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color.green)
                    }
                    .padding(.trailing)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    FormView()
}
