//
//  NavigationManager.swift
//  GreenMatters
//
//  
//

import SwiftUI

enum AppRoute: Hashable {
    case splash
    case onboarding
    case login
    case signup
    case home
}

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func resetToHome() {
        path = NavigationPath()
        path.append(AppRoute.home)
    }
}
