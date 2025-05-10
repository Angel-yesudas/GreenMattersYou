//
//  LoginView.swift
//  GreenMatters
//
// 
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var userName = AppConstants.User.emptyString
    @State private var password = AppConstants.User.emptyString
    @State private var userError: String?
    @State private var passwordError: String?
    @State private var isLoading = false

    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10) {
                    Image(uiImage: .appLogo)
                        .resizable()
                        .frame(width: 280, height: 200)
                    
                    VStack(spacing: 20) {
                        CustomTextFieldView(text: $userName, placeholder: AppConstants.User.email, errorMessage: $userError)
                        CustomTextFieldView(text: $password, placeholder: AppConstants.User.password, isSecure: true, errorMessage: $passwordError)
                    }
                    
                    VStack(spacing: -10) {
                        CustomButtonView(title: AppConstants.User.login, action: {
                            if validateFields() {
                                signIn(email: userName, password: password) { success, errorMessage in
                                    if success {
                                       navigationManager.resetToHome()
                                       // navigationManager.push(.home)
                                    } else {
                                        print("Error details: \(errorMessage ?? "")")
                                    }
                                }
                            }
                        })
                        
                        HStack {
                            Spacer()
                            Text(AppConstants.User.forgotPassword)
                                .foregroundColor(.white.opacity(0.9))
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    
                    HStack {
                        Text(AppConstants.User.noAccount)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button(action: {
                            
                        }) {
                            Text(AppConstants.User.signUp)
                                .foregroundColor(.appYellow)
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                }
            }
            if isLoading {
                CustomLoaderView()
            }
        }
        .modifier(KeyboardAdaptive())
        .onTapGesture { hideKeyboard() }
        .navigationBarBackButtonHidden()
    }
    
    private func validateFields() -> Bool {
        userError = userName.isEmpty ? AppConstants.Messages.emailError : nil
        passwordError = password.isEmpty ? AppConstants.Messages.passwordError : nil
        return userError == nil && passwordError == nil
    }
    
//    MARK: -     Firebase Sign In
    private func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        isLoading = true
        Auth.auth().signIn(withEmail: userName, password: password) { result, error in
            isLoading = false
            if let error = error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription)
            } else {
                navigationManager.resetToHome()
                completion(true, nil)
            }
        }
    }
}

#Preview {
    LoginView()
       // .environmentObject(NavigationManager())
}

