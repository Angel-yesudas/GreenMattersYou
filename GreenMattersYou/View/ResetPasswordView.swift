//
//  ResetPasswordView.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 11/04/25.
//

import SwiftUI
import FirebaseAuth

struct ResetPasswordView: View {
    @State private var email = ""
    @State private var message = ""
    @State private var error = ""
    var body: some View {
       

       
        VStack(spacing: 20) {
                    Text("Reset Password").font(.largeTitle).bold()

                    TextField("Enter your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)

                    Button("Send Reset Link") {
                        Auth.auth().sendPasswordReset(withEmail: email) { err in
                            if let err = err {
                                error = err.localizedDescription
                                message = ""
                            } else {
                                message = "Reset email sent to \(email)"
                                error = ""
                            }
                        }
                    }

                    if !message.isEmpty {
                        Text(message).foregroundColor(.green)
                    }

                    if !error.isEmpty {
                        Text(error).foregroundColor(.red)
                    }
                }
                .padding()
            }
        }

   

#Preview {
    ResetPasswordView()
}
