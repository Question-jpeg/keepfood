//
//  FoodTimeFormView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct FoodTimeFormView: View {
    
    @Binding var selectedFoodTimes: [FoodTime]
    
    var body: some View {
        VStack {
            Text("Укажите ваши приёмы пищи")
                .titleStyle()
                .padding(.bottom, 20)
            
            VStack(spacing: 20) {
                ForEach(FoodTime.allCases, id: \.self) { foodTime in
                    let isSelected = selectedFoodTimes.contains(foodTime)
                    
                    Button {
                        if isSelected {
                            selectedFoodTimes.removeAll(where: { $0 == foodTime })
                        } else {
                            selectedFoodTimes.append(foodTime)
                        }
                    } label: {
                        Text(foodTime.text)
                            .checkboxSelectableStyle(
                                foregroundColor: isSelected ? .white : .black,
                                backgroundColor: isSelected ? .accentOrange : Color(.systemGray6),
                                isChecked: isSelected
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    FoodTimeFormView(selectedFoodTimes: .constant([]))
}
