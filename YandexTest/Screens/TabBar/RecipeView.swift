//
//  RecipeView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct RecipeView: View {
    @State private var comment = ""
    @FocusState private var isFocused
    let compilation: Compilation
    
    var body: some View {
        ScrollView {
            VStack {
                compilation.image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .overlay {
                        LinearGradient(
                            gradient: .init(stops: [
                                .init(color: .clear, location: 0.5),
                                .init(color: .black.opacity(0.8), location: 1)
                            ]),
                            startPoint: .top, endPoint: .bottom)
                    }
                    .overlay(alignment: .bottom) {
                        VStack(spacing: 10) {
                            HStack {
                                ForEach(compilation.tags, id: \.self) { tag in
                                    Text("#" + tag)
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                        .font(.subheadline)
                                }
                            }
                            
                            Text(compilation.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 26))
                                .fontWeight(.bold)
                                .padding(.bottom)
                                .padding(.horizontal, 10)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                VStack(spacing: 30) {
                    Text(compilation.description)
                    
                    ForEach(0..<compilation.items.count, id: \.self) { i in
                        let item = compilation.items[i]
                        VStack(spacing: 10) {
                            Text((compilation.items.count > 1 ? "\(i+1).  " : "") + item.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(item.description)
                                .lineSpacing(5)
                        }
                    }
                }
                .padding()
                .font(.subheadline)
                
                HStack {
                    Text("18 просмотров")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Image(systemName: "message")
                        .font(.title)
                    
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundStyle(.accentOrange)
                }
                .foregroundStyle(Color(.systemGray4))
                .padding(.horizontal)
                .padding(.vertical, 30)
                .padding(.bottom, 80)
//
//                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            TextField("Написать комментарий", text: $comment)
                .focused($isFocused)
                .padding(.bottom, 20)
                .padding(.horizontal, 5)
                .fieldStyle()
                .offset(y: isFocused ? -320 : 0)
                .animation(.default, value: isFocused)
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
    }
}

#Preview {
    RecipeView(compilation: MockData.getMockCompilation())
}
