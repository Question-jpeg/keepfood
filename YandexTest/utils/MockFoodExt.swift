//
//  MockFoodExt.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}

extension MockData {
    static let breakfastFood: [Food] = [
        .init(image: Image(.waffles), name: "Вафли"),
        .init(image: Image(.yogurt), name: "Йогурт"),
        .init(image: Image(.egg), name: "Яйцо"),
        .init(image: Image(.pancakes), name: "Блины"),
        .init(image: Image(.cereals), name: "Хлопья"),
        .init(image: Image(.cheesecakes), name: "Сырники"),
        .init(image: Image(.sandwich), name: "Сэндвич"),
        .init(image: Image(.porridge), name: "Каша"),
        .init(image: Image(.fruits), name: "Фрукты"),
    ]
    
    static let lunchFood: [Food] = [
        .init(image: Image(.soup), name: "Суп"),
        .init(image: Image(.pasta), name: "Паста"),
        .init(image: Image(.setLunch), name: "Комплексный обед"),
        .init(image: Image(.fishSideDish), name: "Рыба и гарнир"),
        .init(image: Image(.rolls), name: "Роллы"),
        .init(image: Image(.pilaf), name: "Плов"),
        .init(image: Image(.steak), name: "Стейк"),
        .init(image: Image(.salad), name: "Салат"),
        .init(image: Image(.vegetableLunch), name: "Овощной обед"),
    ]
    
    static let dinnerFood: [Food] = [
        .init(image: Image(.steakSideDish), name: "Стейк и гарнир"),
        .init(image: Image(.nuggets), name: "Наггетсы"),
        .init(image: Image(.salad2), name: "Салат"),
        .init(image: Image(.chicken), name: "Курица"),
        .init(image: Image(.pizza), name: "Пицца"),
        .init(image: Image(.dumplings), name: "Пельмени"),
        .init(image: Image(.bakedPotato), name: "Печёный картофель"),
        .init(image: Image(.pancakes), name: "Блины"),
        .init(image: Image(.pasta2), name: "Паста"),
    ]
    
    static let snackFood: [Food] = [
        .init(image: Image(.chocolate), name: "Шоколад"),
        .init(image: Image(.cerealBar), name: "Злаковый батончик"),
        .init(image: Image(.fruits2), name: "Свежие фрукты"),
        .init(image: Image(.smoothie), name: "Смузи"),
        .init(image: Image(.cookies), name: "Печенье"),
        .init(image: Image(.marmalade), name: "Мармелад"),
        .init(image: Image(.fastFood), name: "Fast food"),
        .init(image: Image(.nuts), name: "Орехи"),
        .init(image: Image(.smallLoadsOfBread), name: "Хлебцы"),
    ]
    
    static let allergicFood: [Food] = [
        .init(image: Image(.eggs), name: "Яйца"),
        .init(image: Image(.milk), name: "Молоко"),
        .init(image: Image(.chocolate), name: "Шоколад"),
        .init(image: Image(.fish), name: "Рыба"),
        .init(image: Image(.strawberry), name: "Клубника"),
        .init(image: Image(.nuts), name: "Орехи"),
    ]
    
    static let allFood: [Food] = [
        .init(image: Image(.waffles), name: "Вафли"),
        .init(image: Image(.yogurt), name: "Йогурт"),
        .init(image: Image(.pancakes), name: "Блины"),
        .init(image: Image(.cereals), name: "Хлопья"),
        .init(image: Image(.cheesecakes), name: "Сырники"),
        .init(image: Image(.sandwich), name: "Сэндвич"),
        .init(image: Image(.porridge), name: "Каша"),
        .init(image: Image(.fruits), name: "Фрукты"),
        .init(image: Image(.soup), name: "Суп"),
        .init(image: Image(.pasta), name: "Паста"),
        .init(image: Image(.setLunch), name: "Комплексный обед"),
        .init(image: Image(.fishSideDish), name: "Рыба и гарнир"),
        .init(image: Image(.rolls), name: "Роллы"),
        .init(image: Image(.pilaf), name: "Плов"),
        .init(image: Image(.steak), name: "Стейк"),
        .init(image: Image(.salad), name: "Салат"),
        .init(image: Image(.vegetableLunch), name: "Овощной обед"),
        .init(image: Image(.steakSideDish), name: "Стейк и гарнир"),
        .init(image: Image(.nuggets), name: "Наггетсы"),
        .init(image: Image(.chicken), name: "Курица"),
        .init(image: Image(.pizza), name: "Пицца"),
        .init(image: Image(.dumplings), name: "Пельмени"),
        .init(image: Image(.bakedPotato), name: "Печёный картофель"),
        .init(image: Image(.chocolate), name: "Шоколад"),
        .init(image: Image(.cerealBar), name: "Злаковый батончик"),
        .init(image: Image(.smoothie), name: "Смузи"),
        .init(image: Image(.cookies), name: "Печенье"),
        .init(image: Image(.marmalade), name: "Мармелад"),
        .init(image: Image(.fastFood), name: "Fast food"),
        .init(image: Image(.nuts), name: "Орехи"),
        .init(image: Image(.smallLoadsOfBread), name: "Хлебцы"),
        .init(image: Image(.fish), name: "Рыба"),
        .init(image: Image(.strawberry), name: "Клубника"),
        .init(image: Image(.eggs), name: "Яйца"),
        .init(image: Image(.milk), name: "Молоко"),
    ]

}
