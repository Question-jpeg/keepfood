//
//  SkillLevel.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import Foundation

enum SkillLevel: CaseIterable {
    case beginner, medium, advanced, excellent
    
    var text: String {
        switch self {
        case .beginner:
            return "Я не очень умею готовить, смогу приготовить простые блюда"
        case .medium:
            return "Я уже неплохо разбираюсь на кухне, умею готовить средние рецепты, но что-то сложное - не для меня"
        case .advanced:
            return "Я хорошо умею готовить, периодически готовлю сложные блюда"
        case .excellent:
            return "Я - шеф-повар, умею готовить блюда любой сложности, уверенно чувствую себя на кухне"
        }
    }
}
