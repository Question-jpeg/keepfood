//
//  CompilationsView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct CompilationsView: View {
    var body: some View {
        VStack {
            Text("Подборки")
                .titleStyle()
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(MockData.compilations) { compilation in
                        NavigationLink {
                            RecipeView(compilation: compilation)
                        } label: {
                            compilation.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 230, height: 300)
                                .overlay {
                                    LinearGradient(
                                        gradient: .init(stops: [
                                            .init(color: .clear, location: 0.6),
                                            .init(color: .black, location: 1)
                                        ]),
                                        startPoint: .top, endPoint: .bottom)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .overlay(alignment: .bottomLeading) {
                                    Text(compilation.title)
                                        .foregroundStyle(.white)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                }
                                .overlay(alignment: .topLeading) {
                                    Text("подборка")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .background(.accentOrange)
                                        .clipShape(Capsule())
                                        .padding()
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    CompilationsView()
}
