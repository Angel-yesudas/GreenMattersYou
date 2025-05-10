//
//  CustomGoogleSignInButton.swift
//  GreenMatters
//
//  
//

import SwiftUI

struct CustomGoogleSignInButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Image("google_logo")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(AppConstants.User.googleSignIn)
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
        }
        .buttonStyle(CustomButtonStyle())
        .padding()
    }
}

