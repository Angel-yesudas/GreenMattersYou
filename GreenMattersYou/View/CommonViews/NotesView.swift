//
//  NotesView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import Foundation
import SwiftUI

struct NotesView: View {
    @Binding var notes: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Enter your notes here...", text: $notes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Add Notes")
    }
}

