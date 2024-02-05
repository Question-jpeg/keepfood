//
//  titleStyle.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

extension View {
    func titleStyle() -> some View {
        self
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
