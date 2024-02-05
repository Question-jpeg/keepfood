//
//  MainTabBar.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 29.01.2024.
//

import SwiftUI

enum Tab {
    case main, search, fridge, profile
}

struct MainTabBar: View {
    @State private var selectedTab = Tab.main
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Главная", systemImage: "house")
                        .environment(\.symbolVariants, selectedTab == .main ? .fill : .none)
                }
                .tag(Tab.main)
            
            SearchView()
                .tabItem {
                    Label("Поиск", systemImage: selectedTab == .search ? "sparkle.magnifyingglass" : "magnifyingglass")
                }
                .tag(Tab.search)
            
            FridgeView()
                .tabItem {
                    Label("Холодильник", systemImage: "refrigerator")
                        .environment(\.symbolVariants, selectedTab == .fridge ? .fill : .none)
                }
                .tag(Tab.fridge)
            
            ProfileView()
                .tabItem {                  
                    Label("Профиль", systemImage: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                }
                .tag(Tab.profile)
        }
        .tint(.accentOrange)
    }
}

#Preview {
    MainTabBar()
}
