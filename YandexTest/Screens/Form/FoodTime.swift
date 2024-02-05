//
//  FoodTime.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import Foundation

enum FoodTime: Int, CaseIterable {
    case snack, breakfast, lunch, dinner
    
    var text: String {
        switch self {
        case .breakfast:
            return "Завтрак"
        case .lunch:
            return "Обед"
        case .dinner:
            return "Ужин"
        case .snack:
            return "Перекус"
        }
    }
    
    var products: [Food] {
        switch self {
        case .breakfast:
            return MockData.breakfastFood
        case .lunch:
            return MockData.lunchFood
        case .dinner:
            return MockData.dinnerFood
        case .snack:
            return MockData.snackFood
        }
    }
    
    var formScreen: FormScreen {
        switch self {
        case .breakfast:
            return .breakfast
        case .lunch:
            return .lunch
        case .dinner:
            return .dinner
        case .snack:
            return .snack
        }
    }
}
