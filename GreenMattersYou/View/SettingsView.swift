//
//  SettingsView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    @State private var selectedLanguage = "English"
    
    let languages = ["English", "Malayalam", "Hindi"]
    
    var body: some View {
       
            
            
                VStack {
                    List {
                        // 🔹 Profile Settings
//                        Section(header: Text("Profile Settings")) {
//                            NavigationLink(destination: EditProfileView()) {
//                                SettingsRow(icon: "person.crop.circle", title: "Edit Profile")
//                            }
//                        }
                        
                        // 🔹 Preferences
                        Section(header: Text("Preferences")) {
                            Toggle(isOn: $notificationsEnabled) {
                                SettingsRow(icon: "bell.fill", title: "Enable Notifications")
                            }
                            
                            Toggle(isOn: $isDarkMode) {
                                SettingsRow(icon: "moon.fill", title: "Dark Mode")
                            }
                            
                            Picker(selection: $selectedLanguage, label: SettingsRow(icon: "globe", title: "Language")) {
                                ForEach(languages, id: \.self) { language in
                                    Text(language).tag(language)
                                }
                            }
                        }
                        
                        // 🔹 Support & Info
                        Section(header: Text("Support & Information")) {
                            NavigationLink(destination: HelpCenterView()) {
                                SettingsRow(icon: "questionmark.circle.fill", title: "Help Center")
                            }
                            
                            NavigationLink(destination: PrivacyPolicyView()) {
                                SettingsRow(icon: "lock.fill", title: "Privacy Policy")
                            }
                            
                            NavigationLink(destination: AboutView()) {
                                SettingsRow(icon: "info.circle.fill", title: "About")
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
                .navigationTitle("Settings")
            }
        }

        // 📌 Reusable Settings Row
        struct SettingsRow: View {
            var icon: String
            var title: String
            
            var body: some View {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                    
                    Text(title)
                        .font(.body)
                    
                    Spacer()
                }
                .padding(.vertical, 5)
            }
        }

        

#Preview {
    SettingsView()
}
