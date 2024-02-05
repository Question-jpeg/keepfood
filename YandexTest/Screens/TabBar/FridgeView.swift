//
//  FridgeView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct FridgeView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            Text("Мой холодильник")
                .titleStyle()
                .padding(.top, 50)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                
                TextField("Введите название продукта", text: $name)
            }
            .fieldStyle()
            
            Spacer()
            
            Text("Это ваш холодильник, выберите продукты которые у вас есть чтобы рекомендации блюд были максимально удобными и точными для вас")
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
        }
            .padding(.horizontal)
    }
}

#Preview {
    FridgeView()
}
