//
//  WasteScheduleView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI

struct WasteScheduleView: View {
    var body: some View {
            let scheduleItems = [
                "Monday - Plastic & Paper",
                "Tuesday - Organic Waste",
                "Wednesday - E-Waste",
                "Thursday - Metal & Glass",
                "Friday - General Waste"
            ]
            
         //   var body: some View {
                VStack {
                    Text("Waste Collection Schedule")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    List(scheduleItems, id: \.self) { item in
                        HStack {
                            Image(systemName: "trash")
                                .foregroundColor(Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0) )
                            Text(item)
                                .font(.body)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .navigationTitle("Collection Schedule")
            }
        }

       


#Preview {
    WasteScheduleView()
}
