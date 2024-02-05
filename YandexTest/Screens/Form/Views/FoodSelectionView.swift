//
//  FoodSelectionView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct FoodSelectionView: View {
    let foodTime: FoodTime
    @Binding var selectedFood: [Food]
    
    var body: some View {
        VStack {
            Text("Что бы Вы выбрали на \(foodTime.text)")
                .titleStyle()
                .padding(.bottom)
            
            LazyVGrid(columns: [.init(.flexible()), .init(.flexible()), .init(.flexible())], spacing: 0) {
                ForEach(foodTime.products) { food in
                    let isSelected = selectedFood.contains { $0.id == food.id }
                    
                    Button {
                        if isSelected {
                            selectedFood.removeAll(where: { $0.id == food.id })
                        } else {
                            selectedFood.append(food)
                        }
                    } label: {
                        FoodCell(food: food, isSelected: isSelected)
                    }
                }
            }
        }
    }
}

#Preview {
    FoodSelectionView(foodTime: .breakfast, selectedFood: .constant([]))
}
