//
//  WasteSelectionTypeView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import Foundation
import SwiftUI
struct WasteTypeSelectionView: View {
    @Binding var selectedWasteType: String?
    @Environment(\.presentationMode) var presentationMode

    let wasteTypes = [
        "Liquid Waste", "Solid Waste", "Organic Waste",
        "Recyclable Waste", "Hazardous Waste", "Industrial Waste"
    ]

    var body: some View {
        List(wasteTypes, id: \.self) { type in
            Button(action: {
                selectedWasteType = type
                presentationMode.wrappedValue.dismiss() // Dismiss after selection
            }) {
                HStack {
                    Text(type)
                    Spacer()
                    if selectedWasteType == type {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0) )
                    }
                }
            }
        }
        .navigationTitle("Select Waste Type")
    }
}
