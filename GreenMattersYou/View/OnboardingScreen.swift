//
//  OnboardingScreen.swift
//  GreenMatters
//
//  Created by Abin Berly on 27/03/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var currentIndex = 0
    let images = AppConstants.Onboarding.images
    let titles = AppConstants.Onboarding.titles
    let descriptions = AppConstants.Onboarding.descriptions
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \ .self) { index in
                    VStack {
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .tag(index)
                        
                        Text(titles[index])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        
                        Text(descriptions[index])
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HStack(spacing: 8) {
                ForEach(0..<images.count, id: \ .self) { index in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(index == currentIndex ? .appPrimary : .gray.opacity(0.5))
                        .onTapGesture {
                            currentIndex = index
                        }
                }
            }
            .padding(.top, 10)
            
            Spacer()
            
            Button(action: {
                if currentIndex < images.count - 1 {
                    currentIndex += 1
                } else {
                    navigationManager.path = NavigationPath()
                    navigationManager.push(.login)
                }
            }) {
                Text(currentIndex == images.count - 1 ? AppConstants.User.login : AppConstants.Onboarding.nextButton)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.appPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Button(action: {
                navigationManager.path = NavigationPath()
                navigationManager.push(.signup)
            }) {
                Text(AppConstants.Onboarding.createAccountButton)
                    .foregroundColor(.appPrimary)
                    .padding(.top, 5)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.ignoresSafeArea())
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingView()
}
