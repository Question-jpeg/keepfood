//
//  ContentView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.isLoggedIn {
                FormView()
            } else {
                WelcomeScreen()
            }
        }
        .animation(.default, value: authModel.isLoggedIn)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
