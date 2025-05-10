//
//  SplashScreenView.swift
//  GreenMatters
//
//  

import SwiftUI

struct SplashScreenView: View {
    @State private var scaleEffect: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    @State private var gradientOffset: CGFloat = -1.0
    @State var isBackgroundVisible: Bool = false
    @EnvironmentObject var navigationManager: NavigationManager
  
    var body: some View {
        ZStack {
            Color(isBackgroundVisible ? .appPrimary : .appFont)
                .ignoresSafeArea()
                .frame(maxWidth: isBackgroundVisible ? .infinity : .zero, maxHeight: isBackgroundVisible ? .infinity : .zero)
                .opacity(0.9)
                .animation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: true), value: gradientOffset)
            
            VStack {
                Image(AppConstants.Images.appLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 380)
                    .scaleEffect(scaleEffect)
                    .opacity(isBackgroundVisible ? opacity : .zero )
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.2)) {
                            opacity = 1.0
                        }
                        withAnimation(.interpolatingSpring(stiffness: 100, damping: 8)) {
                            scaleEffect =  1.0
                        }
                    }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                isBackgroundVisible = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        if navigationManager.path.isEmpty {
                            navigationManager.push(.onboarding)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
