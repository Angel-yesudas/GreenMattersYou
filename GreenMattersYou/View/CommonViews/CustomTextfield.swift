//
//  CustomTextfield.swift
//  GreenMatters
//
//  
//

import SwiftUI
import Foundation

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    @Binding var errorMessage: String?
    
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack {
                Text(placeholder)
                    .font(.caption)
                    .foregroundStyle(.appFont)
                
            }
            
            HStack {
                Group {
                    if isSecure && !isPasswordVisible {
                        SecureField(placeholder, text: $text)
                            .autocorrectionDisabled()
                            .textContentType(.oneTimeCode)
                    } else {
                        TextField(placeholder, text: $text)
                            .autocorrectionDisabled()
                            .textContentType(.none)
                    }
                }
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .foregroundColor(.white.opacity(0.9))
                .onChange(of: text) { _, newValue in
                    if !newValue.isEmpty { errorMessage = nil }
                }
                
                if isSecure {
                    Button(action: { isPasswordVisible.toggle() }) {
                        Image(systemName: isPasswordVisible ? AppConstants.Images.passwordshow : AppConstants.Images.passwordHide)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .background(.appTextFieldGreen)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            
            if let error = errorMessage, !error.isEmpty {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
            }
        }
        .padding(.horizontal)
    }
}
