//
//  FormView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

enum CoffeeTea {
    case coffee, tea
}

enum FormScreen {
    case finance, skill, foodTime, breakfast, lunch, dinner, snack, allergic, choice
}

struct FormView: View {
    @State private var currentStep = 1
    
    @State private var selectedSkillLevel: SkillLevel?
    @State private var selectedFoodTimes = [FoodTime]()
    
    @State private var selectedBreakfastFood = [Food]()
    @State private var selectedLunchFood = [Food]()
    @State private var selectedDinnerFood = [Food]()
    @State private var selectedSnackFood = [Food]()
    @State private var selectedAllergicFood = [Food]()
    
    @State private var coffeeTea = [CoffeeTea]()
    
    @State private var formScreens: [FormScreen] = [.finance, .skill, .foodTime]
    
    var stepsCount: Int {
        5 + selectedFoodTimes.count
    }
    
    var isValid: Bool {
        switch formScreens[currentStep-1] {
        case .skill:
            return selectedSkillLevel != nil
        case .foodTime:
            return selectedFoodTimes.count > 0
        case .breakfast:
            return selectedBreakfastFood.count > 0
        case .lunch:
            return selectedLunchFood.count > 0
        case .dinner:
            return selectedDinnerFood.count > 0
        case .snack:
            return selectedSnackFood.count > 0
        default:
            return true
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geo in
                    let width = geo.size.width
                    Rectangle()
                        .fill(.accentOrange)
                        .offset(x: width/Double(stepsCount)*Double(currentStep - stepsCount))
                        .mask {
                            HStack {
                                ForEach(0..<(stepsCount), id: \.self) { index in
                                    Rectangle()
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .background {
                            HStack {
                                ForEach(0..<(stepsCount), id: \.self) { index in
                                    Rectangle()
                                        .fill(Color(.systemGray6))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                }
                .frame(height: 10)
                .padding(.vertical, 40)
                
                switch formScreens[currentStep-1] {
                case .finance:
                    FinancialPossibilitiesFormView()
                case .skill:
                    SkillLevelFormView(selectedSkillLevel: $selectedSkillLevel)
                case .foodTime:
                    FoodTimeFormView(selectedFoodTimes: $selectedFoodTimes)
                case .breakfast:
                    FoodSelectionView(foodTime: .breakfast, selectedFood: $selectedBreakfastFood)
                case .lunch:
                    FoodSelectionView(foodTime: .lunch, selectedFood: $selectedLunchFood)
                case .dinner:
                    FoodSelectionView(foodTime: .dinner, selectedFood: $selectedDinnerFood)
                case .snack:
                    FoodSelectionView(foodTime: .snack, selectedFood: $selectedSnackFood)
                case .allergic:
                    AllergicFoodFormView(selectedFood: $selectedAllergicFood)
                case .choice:
                    ChoiceFormView(coffeeTea: $coffeeTea)
                }
                
                Spacer()
                
                if currentStep == stepsCount {
                    NavigationLink {
                        MainTabBar()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Завершить")
                            .buttonStyle(foregroundColor: .white, backgroundColor: .accentOrange)
                    }
                    
                } else {
                    Button {
                        if currentStep == 3 {
                            selectedFoodTimes = selectedFoodTimes.sorted(by: { $0.rawValue < $1.rawValue })
                            formScreens.append(contentsOf: selectedFoodTimes.map { $0.formScreen })
                            formScreens.append(contentsOf: [.allergic, .choice])
                        }
                        currentStep += 1
                    } label: {
                        Text("Далее")
                            .buttonStyle(foregroundColor: .white, backgroundColor: .accentOrange)
                    }
                    .disabled(!isValid)
                    .opacity(isValid ? 1 : 0.5)
                }
            }
            .padding(.horizontal)
            .animation(.default, value: currentStep)
            .animation(.default, value: selectedFoodTimes)
            .animation(.default, value: selectedSkillLevel)
        }
    }
}

#Preview {
//    FoodCell(food: MockData.breakfastFood[0])
//    BreakfastView()
//    AllergicFoodView(selectedFood: .constant([MockData.breakfastFood[0]]))
//        .padding(.horizontal)
    FormView()
//    ChoiceView()
//        .padding(.horizontal)
}
