//
//  MockRecipeExt.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let composition: String
    let image: Image
    let calories: Int
    let protein: Int
    let fats: Int
    let carbs: Int
    let time: Int
    var isLiked = false
    
    func getCompilation() -> Compilation {
        Compilation(
            title: title,
            image: image,
            tags: [],
            description: "",
            items: [.init(title: title, description: MockData.getMockCompilation().items[0].description)]
        )
    }
}

enum RecipeInfo: CaseIterable {
    case calories, protein, fats, carbs
    
    var title: String {
        switch self {
        case .calories:
            return "Калорийность"
        case .protein:
            return "Белки"
        case .fats:
            return "Жиры"
        case .carbs:
            return "Углеводы"
        }
    }
    
    var measureUnit: String {
        switch self {
        case .calories:
            return "ккал"
        case .protein:
            return "грамм"
        case .fats:
            return "грамм"
        case .carbs:
            return "грамм"
        }
    }
    
    func getNumber(forRecipe recipe: Recipe) -> Int {
        switch self {
        case .calories:
            return recipe.calories
        case .protein:
            return recipe.protein
        case .fats:
            return recipe.fats
        case .carbs:
            return recipe.carbs
        }
    }
}

extension MockData {
    static func getMockRecipe1() -> Recipe { Recipe(
        title: "Венские вафли с мёдом и черникой",
        composition: "Яйца • Мука • Черника • Сахар • Сливочное масло • Молоко • Соль • Разрыхлитель",
        image: Image(.image3),
        calories: 676,
        protein: 10,
        fats: 46,
        carbs: 55,
        time: 15
    )
    }
    
    static func getMockRecipe2() -> Recipe { Recipe(
        title: "Брауни",
        composition: "Темный шоколад • Сливочное масло • Коричневый сахар • Куриное яйцо • Пшеничная мука • Грецкие орехи",
        image: Image(.image4),
        calories: 686,
        protein: 11,
        fats: 44,
        carbs: 58,
        time: 25
    )
    }
    
    static var recipes: [Recipe] = [
        getMockRecipe1(),
        getMockRecipe2(),
        getMockRecipe1(),
        getMockRecipe2(),
    ]
}
