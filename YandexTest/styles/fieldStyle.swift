//
//  fieldStyle.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

extension View {
    func fieldStyle() -> some View {
        self
            .padding()
            .padding(.horizontal, 10)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
