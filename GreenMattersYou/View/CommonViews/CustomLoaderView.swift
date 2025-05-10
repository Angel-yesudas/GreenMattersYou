//
//  CustomLoaderView.swift
//  GreenMatters
//
//  
//

import SwiftUI

struct CustomLoaderView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background Blur
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                // Rotating Circular Stroke
                Circle()
                    .trim(from: 0, to: 0.8) // 80% of the circle
                    .stroke(
                        AngularGradient(gradient: Gradient(colors: [.green, .blue]), center: .center),
                        style: StrokeStyle(lineWidth: 6, lineCap: .round)
                    )
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false), value: isAnimating)
                
                // App Icon in the Center
                Image("AppIcon") // Replace with your app icon name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    CustomLoaderView()
}

