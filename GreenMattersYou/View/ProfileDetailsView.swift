import SwiftUI

struct ProfileDetailsView: View {
    @State private var fullName: String = "John Doe"
    @State private var email: String = "john@example.com"
    @State private var phone: String = "+1 234 567 890"
    @State private var address: String = "123 Main Street, City, Country"
    @State private var dob: String = "Jan 1, 1995"
    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            // Profile Image Section
            ZStack {
                Image("logo") // Replace with actual image
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
                
                Button(action: {
                    print("Change profile picture tapped")
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: 40, y: 40)
                }
            }
            
            // Profile Information
            VStack(alignment: .leading, spacing: 12) {
                ProfileEditableRow(title: "Full Name", text: $fullName, isEditing: $isEditing)
                ProfileEditableRow(title: "Email", text: $email, isEditing: $isEditing)
                ProfileEditableRow(title: "Phone", text: $phone, isEditing: $isEditing)
                ProfileEditableRow(title: "Address", text: $address, isEditing: $isEditing)
                ProfileEditableRow(title: "Date of Birth", text: $dob, isEditing: $isEditing)
            }
            .padding()
            
            Spacer()
            
            // Edit / Save Profile Button
            Button(action: {
                isEditing.toggle()
                if !isEditing {
                    print("Profile saved: \(fullName), \(email), \(phone), \(address), \(dob)")
                }
            }) {
                Text(isEditing ? "Save Profile" : "Edit Profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isEditing ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Profile Details")
        .padding()
    }
}

// 📌 Editable Profile Row Component
struct ProfileEditableRow: View {
    var title: String
    @Binding var text: String
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
            if isEditing {
                TextField(title, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            } else {
                Text(text)
                    .font(.body)
            }
        }
        .padding(.vertical, 4)
    }
}

// 📌 Preview
#Preview {
    ProfileDetailsView()
}

