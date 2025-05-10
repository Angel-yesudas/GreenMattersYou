//
//  EcoTipsView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI

struct EcoTipsView: View {
    let tips = [
        "Use reusable bags instead of plastic.",
        "Turn off lights when not needed.",
        "Reduce food waste by planning meals.",
        "Carry a refillable water bottle.",
        "Switch to energy-efficient appliances."
    ]
    
    @State private var currentTipIndex = 0

    var body: some View {
    
                VStack {
                    Text("Eco-Friendly Tip")
                        .font(.title)
                        .bold()

                    Text(tips[currentTipIndex])
                        .font(.headline)
                        .padding()
                        .frame(width: 300, height: 100)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                        .padding()

                    Button("Next Tip") {
                        currentTipIndex = (currentTipIndex + 1) % tips.count
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .navigationTitle("Eco-Friendly Tips")
            }
        }

       
    


#Preview {
    EcoTipsView()
}
