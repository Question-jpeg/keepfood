//
//  SkillLevelFormView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct SkillLevelFormView: View {
    
    @Binding var selectedSkillLevel: SkillLevel?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Как вы оцениваете свои кулинарные способности")
                .titleStyle()
                .padding(.bottom, 10)
            
            ForEach(SkillLevel.allCases, id: \.self) { skillLevel in
                let isSelected = skillLevel == selectedSkillLevel
                
                Button {
                    selectedSkillLevel = skillLevel
                } label: {
                    Text(skillLevel.text)
                        .selectableStyle(
                            foregroundColor: isSelected ? .white : .black,
                            backgroundColor: isSelected ? .accentOrange : Color(.systemGray6)
                        )
                }
            }
        }
    }
}

#Preview {
    SkillLevelFormView(selectedSkillLevel: .constant(.medium))
}
