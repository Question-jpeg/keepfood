//
//  ChoiceFormView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct ChoiceFormView: View {
    @Binding var coffeeTea: [CoffeeTea]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Что бы Вы выбрали?")
                .titleStyle()
                .padding(.bottom)
            
            Group {
                let isSelected = coffeeTea.contains(.coffee)
                
                Button {
                    if isSelected {
                        coffeeTea.removeAll(where: { $0 == .coffee })
                    } else {
                        coffeeTea.append(.coffee)
                    }
                } label: {
                    VStack(spacing: 10) {
                        Image(.coffee)
                            .overlay {
                                if isSelected {
                                    Color.black
                                        .opacity(0.5)
                                    
                                    Image(systemName: "checkmark")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text("Кофе")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
            }
            
            Group {
                let isSelected = coffeeTea.contains(.tea)
                
                Button {
                    if isSelected {
                        coffeeTea.removeAll(where: { $0 == .tea })
                    } else {
                        coffeeTea.append(.tea)
                    }
                } label: {
                    VStack(spacing: 10) {
                        Image(.tea)
                            .overlay {
                                if isSelected {
                                    Color.black
                                        .opacity(0.5)
                                    
                                    Image(systemName: "checkmark")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text("Чай")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ChoiceFormView(coffeeTea: .constant([]))
}
