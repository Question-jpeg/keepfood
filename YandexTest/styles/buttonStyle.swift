//
//  buttonStyle.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

extension View {
    func buttonStyle(foregroundColor: Color, backgroundColor: Color) -> some View {
        self
            .font(.headline)
            .foregroundStyle(foregroundColor)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
