//
//  FoodCell.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct FoodCell: View {
    let food: Food
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            food.image
                .resizable()
                .scaledToFit()
                .overlay {
                    if isSelected {
                        Color.black
                            .opacity(0.5)
                        
                        Image(systemName: "checkmark")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            Text(food.name)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(height: 50, alignment: .top)
        }
    }
}

#Preview {
    FoodCell(food: MockData.allFood[0], isSelected: true)
}
