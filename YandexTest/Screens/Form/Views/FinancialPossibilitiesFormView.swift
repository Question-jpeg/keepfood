//
//  FinancialPossibilitesFormView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct FinancialPossibilitiesFormView: View {
    @State private var firPos = 0.25
    @State private var firPosTranslation = 0.0
    @State private var secPos = 0.75
    @State private var secPosTranslation = 0.0
    
    var startValue: Double {
        min(firOffset, secOffset)
    }
    
    var endValue: Double {
        max(firOffset, secOffset)
    }
    
    var firOffset: Double {
        firPos + firPosTranslation
    }
    
    var secOffset: Double {
        secPos + secPosTranslation
    }
    
    var startPrice: Int {
        Int(startValue*(2000-150)+150)/10*10
    }
    
    var endPrice: Int {
        Int(endValue*(2000-150)+150)/10*10
    }
    
    var body: some View {
        VStack {
            Text("Укажите ваши финансовые возможности на приготовление одного блюда")
                .titleStyle()
            
            HStack {
                Text("Стоимость блюда")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(startPrice)₽ - \(endPrice)₽")
                    .foregroundStyle(.accentOrange)
            }
            .padding(.top, 100)
            
            Rectangle()
                .fill(Color(.systemGray6))
                .frame(height: 10)
                .clipShape(Capsule())
                .padding(.vertical, 10)
                .overlay(alignment: .leading) {
                    GeometryReader { geo in
                        let height = geo.size.height
                        let width = geo.size.width - 20
                        
                        Rectangle()
                            .fill(.accentOrange)
                            .frame(width: (endValue-startValue)*width, height: 10)
                            .clipShape(Capsule())
                            .offset(x: startValue*width, y: height/2-5)
                        
                        Circle()
                            .stroke(.accentOrange, lineWidth: 7)
                            .frame(height: 20)
                            .background(.white)
                            .offset(x: firOffset*width, y: height / 2 - 10)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        let translation = value.translation.width / width
                                        firPosTranslation = min(1-firPos, max(0-firPos, translation))
                                    }
                                    .onEnded { value in
                                        firPos += firPosTranslation
                                        firPosTranslation = 0
                                    }
                            )
                        
                        Circle()
                            .stroke(.accentOrange, lineWidth: 7)
                            .frame(height: 20)
                            .background(.white)
                            .offset(x: secOffset*width, y: height / 2 - 10)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        let translation = value.translation.width / width
                                        secPosTranslation = max(0-secPos, min(1-secPos, translation))
                                    }
                                    .onEnded { value in
                                        secPos += secPosTranslation
                                        secPosTranslation = 0
                                    }
                            )
                    }
                }
            
            HStack {
                Text("150₽")
                
                Spacer()
                
                Text("2000₽")
            }
        }
    }
}

#Preview {
    FinancialPossibilitiesFormView()
}
