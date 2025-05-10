//
//  CustomButtonView.swift
//  GreenMatters
//
//

import SwiftUI

struct CustomButtonView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
        }
        .buttonStyle(CustomButtonStyle())
        .padding()
    }
}
