//
//  AboutView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
                VStack {
                    Image("logo") // Replace with actual app logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Haritha Keralam - Waste Management App")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                    
                    Text("Version 1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    Text("This application is designed to help manage waste collection and promote sustainable waste disposal in Kerala.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("About")
            }
        }

        

#Preview {
    AboutView()
}
