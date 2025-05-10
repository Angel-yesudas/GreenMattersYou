//
//  ProgressTrackerView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI
import Charts
struct ProgressTrackerView: View {
    let wasteData = [
        (day: "Mon", amount: 1.0),
        (day: "Tue", amount: 3.5),
        (day: "Wed", amount: 1.8),
        (day: "Thu", amount: 4.2),
        (day: "Fri", amount: 3.0),
        (day: "Sat", amount: 5.0),
        (day: "Sun", amount: 2.5)
    ]
    var body: some View {
                VStack(spacing: 20) {
                    Text("Your Waste Management Progress")
                        .font(.title)
                        .bold()
                        .padding(.top)

                    // ✅ Weekly Waste Collection Chart
                    Chart {
                        ForEach(wasteData, id: \.day) { data in
                            BarMark(
                                x: .value("Day", data.day),
                                y: .value("Waste (kg)", data.amount)
                            )
                            .foregroundStyle(Color.green)
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)

                    // ✅ Recycling Progress
                    VStack {
                        Text("Recycling Rate: 75%")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        ProgressView(value: 0.75)
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(width: 200)
                    }
                    .padding()

                    Spacer()
                }
                .padding()
                .navigationTitle("Progress Tracker")
            }
        }

        
    


#Preview {
    ProgressTrackerView()
}
