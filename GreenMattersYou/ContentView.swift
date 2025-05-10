//
//  ContentView.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            SplashScreenView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splash:
                        SplashScreenView()
                    case .onboarding:
                        OnboardingView()
                            .environmentObject(navigationManager)
                    case .login:
                        LoginView()
                            .environmentObject(navigationManager)
                    case .signup:
                        SignupView()
                            .environmentObject(navigationManager)
                    case .home:
                        HomeScreenView()
                            .environmentObject(navigationManager)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
