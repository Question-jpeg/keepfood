//
//  WelcomeScreen.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.image1)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("Добро пожаловать в")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("keepfoød")
                        .foregroundStyle(.accentOrange)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Получайте каждый день уникальный рецепт, готовьте, наслаждайтесь.")
                        .foregroundStyle(.gray)
                        .padding(.vertical)
                    
                    NavigationLink {
                        LoginScreen()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Войти через Email")
                            .buttonStyle(foregroundColor: .white, backgroundColor: .accentOrange)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 5) {
                            Text("Продолжить через")
                            
                            Image(.googleIcon)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 1)
                        }
                        .buttonStyle(foregroundColor: .black, backgroundColor: .white)
                    }
                    .padding(.top, 5)
                    
                    NoAccountFootView()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}

struct NoAccountFootView: View {
    var body: some View {
        VStack {
            Text("Нет аккаунта? ")
                .foregroundStyle(.gray)
            +
            Text("Зарегистрируйтесь!")
                .foregroundStyle(.accentOrange)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
    }
}
