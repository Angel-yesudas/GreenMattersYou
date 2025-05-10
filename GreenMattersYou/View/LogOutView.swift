//
//  LogOutView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct LogOutView: View {
    @State private var showAlert = false
    var body: some View {
       
            
            
           
                VStack {
                    Image(systemName: "person.crop.circle.badge.xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                    
                    Text("Are you sure you want to log out?")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Log Out")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Log Out")
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Confirm Logout"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .destructive(Text("Log Out")) {
                            print("User logged out")
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }

        

#Preview {
    LogOutView()
}
