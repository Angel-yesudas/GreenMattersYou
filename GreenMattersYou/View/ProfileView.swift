//
//  ProfileView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        // Profile Image & Name
                        VStack {
                            ZStack {
                                Image("logo") // Replace with actual image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.white, lineWidth: 4)
                                    )
                                
                                Button(action: {
                                    print("Edit Profile Picture")
                                }) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0))
                                        .clipShape(Circle())
                                }
                                .offset(x: 35, y: 35)
                            }
                            
                            Text("John Doe")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top, 8)
                        }
                        .padding(.top, 20)
                        
                        // Profile Options List
                        List {
                            NavigationLink(destination:ProfileDetailsView()){
                                ProfileRow(icon: "person.fill" , title: "Your Profile")}
                            NavigationLink(destination:PaymentMethodsView()){
                                ProfileRow(icon: "creditcard.fill", title: "Payment Methods")}
                            NavigationLink(destination:MyRequestView()){
                                ProfileRow(icon: "cart.fill", title: "My Requests")}
                            NavigationLink(destination:SettingsView()){
                                ProfileRow(icon: "gearshape.fill", title: "Settings")}
                            NavigationLink(destination:HelpCenterView()){
                                ProfileRow(icon: "questionmark.circle.fill", title: "Help Center")}
                            NavigationLink(destination:PrivacyPolicyView()){
                                ProfileRow(icon: "lock.fill", title: "Privacy Policy")}
                            NavigationLink(destination:InviteFriendsView()){
                                ProfileRow(icon: "person.badge.plus", title: "Invite Friends")}
                            NavigationLink(destination:LogOutView()){
                                ProfileRow(icon: "arrow.right.circle.fill", title: "Log Out", color: .red)}
                        }
                        .listStyle(.plain)
                        
                        // Bottom Navigation Bar
                        Spacer()
                        //BottomNavBar()
                    }
                    .navigationBarTitle("Profile", displayMode: .inline)
                    .padding(.top, 10)
                }
            }
        }

        // 📌 Profile Row Component
        struct ProfileRow: View {
            let icon: String
            let title: String
            var color: Color = Color(.sRGB,red: 0.023,green: 0.251,blue: 0.169,opacity: 1.0)
            
            var body: some View {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(color)
                        .frame(width: 30, height: 30)
                    
                    Text(title)
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
        }

        // 📌 Bottom Navigation Bar
        struct BottomNavBar: View {
            var body: some View {
                HStack {
                    Spacer()
                    NavBarItem(icon: "house.fill")
                    Spacer()
                    NavBarItem(icon: "cart.fill")
                    Spacer()
                    NavBarItem(icon: "heart.fill")
                    Spacer()
                    NavBarItem(icon: "message.fill")
                    Spacer()
                    NavBarItem(icon: "person.fill", isSelected: true)
                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.9))
                .cornerRadius(20)
            }
        }

        // 📌 Bottom Navigation Item
        struct NavBarItem: View {
            let icon: String
            var isSelected: Bool = false
            
            var body: some View {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0) : .white)
                    .padding(10)
                    .background(isSelected ? Color.white : Color.clear)
                    .clipShape(Circle())
            }
        }

       
    


#Preview {
    ProfileView()
}
