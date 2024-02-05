//
//  SearchView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var name = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .font(.title2)
                        TextField("Введите название рецепта", text: $name)
                            .font(.subheadline)
                    }
                    .fieldStyle()
                    
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundStyle(.gray)
                        .font(.title2)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.horizontal)
                
                Text("Категории по продуктам")
                    .titleStyle()
                    .padding(.horizontal)
                    .padding(.top)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(MockData.allergicFood) { food in
                            FoodCell(food: food, isSelected: false)
                                .frame(width: 100)
                        }
                    }
                    .padding(.horizontal)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                
                CompilationsView()
            }
        }
    }
}

#Preview {
    SearchView()
}
