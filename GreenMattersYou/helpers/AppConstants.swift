//
//  AppConstants.swift
//  GreenMatters
//
//  

import Foundation

struct AppConstants {
    
    struct Images {
        static let appLogo = "app.logo"
        static let passwordshow = "eye.slash"
        static let passwordHide = "eye"
        static let profileImage = "user"
    }
    
    struct User {
        static let emptyString: String = ""
        static let userName: String = "User name"
        static let fullName: String = "Full Name"
        static let password: String = "Password"
        static let email: String = "Email"
        static let login: String = "Login"
        static let googleSignIn: String = "Sign in with Google"
        static let signUp: String = "Sign Up"
        static let confirmPassword: String = "Confirm Password"
        static let forgotPassword: String = "Forgot passsword?"
        static let accountMessage: String = "Already have an account?"
        static let noAccount: String = "Don't have an account?"
       
    }
    
    struct Messages {
        static let userError: String = "Username cannot be empty."
        static let passwordError: String = "Password cannot be empty."
        static let errorMessage: String = "Something went wrong. Please try again."
        static let successMessage: String = "Operation completed successfully."
        static let fullNameError: String = "Full Name is required."
        static let emailError: String = "Invalid email format"
        static let passwordCharactorsError: String = "Password must be at least 6 characters"
        static let passwordMatchError: String = "Passwords do not match"
        
    }
    
    struct Onboarding {
        static let images = ["onboarding.one", "onboarding.two", "onboarding.three", "onboarding.four"]
        static let titles = [
            "Reduce Waste, Save the Planet",
            "Recycle More, Waste Less",
            "Smart Waste Management",
            "Join Us in Making a Difference"
        ]
        static let descriptions = [
            "Learn how small changes can make a big impact on reducing waste and protecting the environment.",
            "Discover easy ways to recycle and keep our surroundings clean.",
            "Use our smart tracking system to manage waste disposal efficiently.",
            "Be a part of our mission to create a cleaner, greener future."
        ]
        static let nextButton = "Next"
        static let createAccountButton = "Create an account"
    }
    
    struct ResetPassword{
        
        
        
    }
    
    struct API {

    }
    struct Event{
        
    }
    

    
}

