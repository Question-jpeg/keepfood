//
//  AllergicFoodView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct AllergicFoodFormView: View {
    
    @State private var searchText = ""
    @Binding var selectedFood: [Food]
    
    var query: [Food] {
        let filtered = searchText.isEmpty ? MockData.allFood : MockData.allFood.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        return Array(filtered.prefix(6))
    }
    
    var body: some View {
        VStack {
            Text("На какие продукты у вас есть аллергия")
                .titleStyle()
            
            TextField("Введите название продукта", text: $searchText)
                .fieldStyle()
                .padding(.vertical)
                .padding(.bottom)
            
            LazyVGrid(columns: [.init(.flexible()), .init(.flexible()), .init(.flexible())], spacing: 0) {
                ForEach(query) { food in
                    let isSelected = selectedFood.contains(where: { $0.id == food.id })
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
            .frame(height: 0, alignment: .top)
        }
    }
}

#Preview {
    AllergicFoodFormView(selectedFood: .constant([]))
}
