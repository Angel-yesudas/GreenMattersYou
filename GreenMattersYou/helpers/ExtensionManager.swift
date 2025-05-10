//
//  ExtensionManager.swift
//  GreenMatters
//
//  

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: ()->Content) -> some View {
            ZStack(alignment: alignment) {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            }
        }
}

extension String {
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        return self.count >= 6
    }
}


// ✅ Helper Function for Date Formatting
func formattedDate(_ date: Date) -> String {
let formatter = DateFormatter()
formatter.dateStyle = .medium
return formatter.string(from: date)
}
