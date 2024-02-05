//
//  YandexTestApp.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 19.01.2024.
//

import SwiftUI

@main
struct YandexTestApp: App {
    
    @StateObject var authModel = AuthViewModel()
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14, weight: .light)], for: [])
        UITabBarItem.appearance().titlePositionAdjustment = .init(horizontal: 0, vertical: 5)
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray4
        UIPageControl.appearance().currentPageIndicatorTintColor = .accentOrange
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()     
                .preferredColorScheme(.light)
                .environmentObject(authModel)
        }
    }
}
