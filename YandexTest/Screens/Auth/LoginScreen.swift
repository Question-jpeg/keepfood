//
//  LoginScreen.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authModel: AuthViewModel
    
    var isValid: Bool {
        email.contains("@") && password.count > 5
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(.image2)
                .resizable()
                .frame(height: 500)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    Text("Войти")
                        .font(.title)
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .padding(.vertical, 35)
                    
                    TextField("Email", text: $email)
                        .focusable(false)
                        .fieldStyle()
                    
                    TextField("Введите пароль", text: $password)
                        .fieldStyle()
                    
                    Button {
                        authModel.isLoggedIn = true
                    } label: {
                        Text("Войти")
                            .buttonStyle(foregroundColor: .white, backgroundColor: .accentOrange)
                    }
                    .disabled(!isValid)
                    .opacity(isValid ? 1 : 0.5)
                    .padding(.top)
                    
                    NoAccountFootView()
                }
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
    }
}

#Preview {
    LoginScreen()
}
