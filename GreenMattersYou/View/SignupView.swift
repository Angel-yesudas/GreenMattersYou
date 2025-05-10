//
//  SignupView.swift
//  GreenMatters
//
//
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignupView: View {
    
    @State private var fullName = AppConstants.User.emptyString
    @State private var email = AppConstants.User.emptyString
    @State private var password = AppConstants.User.emptyString
    @State private var confirmPassword = AppConstants.User.emptyString
    
    @State private var fullNameError: String?
    @State private var emailError: String?
    @State private var passwordError: String?
    @State private var confirmPasswordError: String?
    @State private var profileImage: UIImage?
    @State private var isImagePickerPresented = false
    
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 30) {                    
                    Image(uiImage: (profileImage ?? UIImage(named: AppConstants.Images.profileImage)) ?? UIImage())
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.gray, lineWidth: 2))
                        .padding()
                        .onTapGesture { isImagePickerPresented.toggle() }
                    
                    VStack(spacing: 20) {
                        CustomTextFieldView(text: $fullName, placeholder:AppConstants.User.fullName, errorMessage: $fullNameError)
                        CustomTextFieldView(text: $email, placeholder: AppConstants.User.email, errorMessage: $emailError)
                        CustomTextFieldView(text: $password, placeholder: AppConstants.User.password, isSecure: true, errorMessage: $passwordError)
                        CustomTextFieldView(text: $confirmPassword, placeholder: AppConstants.User.confirmPassword, isSecure: true, errorMessage: $confirmPasswordError)
                    }
                    
                    CustomButtonView(title: AppConstants.User.signUp , action: {
                        if validateFields() {
                            register(email: email, password: password) { success, errorMessage in
                                if success {
                                    navigationManager.push(.home)
                                } else {
                                    print("Error details: \(errorMessage ?? "")")
                                }
                            }
                        }
                    })
                    
                    HStack {
                        Text(AppConstants.User.accountMessage)
                            .foregroundColor(.white.opacity(0.9))
                        Button(AppConstants.User.login) {
                            navigationManager.push(.login)
                        }
                        .foregroundColor(.appYellow)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .modifier(KeyboardAdaptive())
        .onTapGesture { hideKeyboard() }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $profileImage)
        }
        .navigationBarBackButtonHidden()
    }
    
    private func validateFields() -> Bool {
        fullNameError = fullName.isEmpty ? AppConstants.Messages.fullNameError : nil
        emailError = email.isValidEmail ? nil : AppConstants.Messages.emailError
        passwordError = password.isValidPassword ? nil : AppConstants.Messages.passwordCharactorsError
        confirmPasswordError = password == confirmPassword ? nil : AppConstants.Messages.passwordMatchError

        return fullNameError == nil && emailError == nil && passwordError == nil && confirmPasswordError == nil
    }
    
    //    MARK: -     Firebase Sign Up
    func register(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
    }
}
#Preview {
    SignupView()
}


/*
 if success {
     navigationManager.push(.login)
 } else {
     print("Registration failed: \(errorMessage ?? "Unknown error")")
 }
}
 */
