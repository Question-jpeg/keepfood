//
//  HomeView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFoodTime = FoodTime.breakfast
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Рецепт на ближайший приём пищи:")
                    .titleStyle()
                    .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(FoodTime.allCases, id: \.self) { foodTime in
                            Button {
                                selectedFoodTime = foodTime
                            } label: {
                                Text(foodTime.text.lowercased())
                                    .font(.system(size: 28))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(foodTime == selectedFoodTime ? .accentOrange : Color(.systemGray4))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .zIndex(1)
                
                TabView {
                    ForEach(MockData.recipes) { recipe in
                        NavigationLink {
                            RecipeView(compilation: recipe.getCompilation())
                        } label: {
                            RecipeCell(recipe: recipe)
                        }
                        .overlay(alignment: .topTrailing) {
                            HStack {
                                Group {
                                    Text("\(recipe.time) мин")
                                        .padding()
                                        .background(.ultraThinMaterial.opacity(0.9))
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "heart")
                                            .padding()
                                            .background(.ultraThinMaterial.opacity(0.9))
                                    }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                            }
                            .padding()
                            .padding()
                        }
                    }
                }
                .tabViewStyle(.page)
                .tint(.accentOrange)
                .frame(height: 520, alignment: .top)
                .padding(.top, -30)
                
                CompilationsView()
            }
            .padding(.vertical)
            .padding(.top)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}

struct RecipeCell: View {
    let recipe: Recipe
    
    var body: some View {
        recipe.image
            .resizable()
            .scaledToFit()
            .overlay {
                LinearGradient(
                    gradient: .init(stops: [
                        .init(color: .black.opacity(0.5), location: 0),
                        .init(color: .clear, location: 0.25),
                        .init(color: .clear, location: 0.3),
                        .init(color: .black.opacity(1), location: 1),
                    ]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 1)
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .overlay(alignment: .bottom) {
                VStack(spacing: 20) {
                    Text(recipe.title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                    
                    Text(recipe.composition.uppercased())
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                    
                    HStack {
                        ForEach(RecipeInfo.allCases, id: \.self) { option in
                            Spacer()
                            VStack(spacing: 5) {
                                Text(option.title)
                                Text(option.getNumber(forRecipe: recipe).formatted())
                                    .font(.title3)
                                    .fontWeight(.black)
                                Text(option.measureUnit)
                                    .foregroundStyle(Color(.systemGray4))
                            }
                            .font(.footnote)
                        }
                        
                        Spacer()
                    }
                }
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.bottom, 20)
            }
            .padding()
    }
}
