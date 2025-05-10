//
//  DatePickerView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import Foundation
import SwiftUI
struct DatePickerView: View {
    @Binding var selectedDate: Date?
    @Environment(\.presentationMode) var presentationMode

    @State private var tempDate = Date()

    var body: some View {
        VStack {
            DatePicker("Select Pickup Date", selection: $tempDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            Button("Confirm") {
                selectedDate = tempDate
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
        }
        .padding()
        .navigationTitle("Pick a Date")
    }
}


