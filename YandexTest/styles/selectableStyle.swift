//
//  buttonStyle.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

extension View {
    func selectableStyle(foregroundColor: Color, backgroundColor: Color) -> some View {
        self
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .foregroundStyle(foregroundColor)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func checkboxSelectableStyle(foregroundColor: Color, backgroundColor: Color, isChecked: Bool) -> some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundStyle(isChecked ? .white : .gray )
            
            self
                .font(.subheadline)
                .foregroundStyle(foregroundColor)
            
            Spacer()
        }
        .padding()
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
