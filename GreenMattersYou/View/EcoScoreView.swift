//
//  EcoScoreView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/03/25.
//

import SwiftUI

struct EcoScoreView: View {
    
        @State private var ecoScore = 75
        @State private var actionsCompleted = [
            ("Recycled Plastic Bottles", "+10 Points"),
            ("Composted Food Waste", "+15 Points"),
            ("Used Public Transport", "+20 Points")
        ]
        
        var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    // **Score Display**
                    VStack {
                        Text("Your Eco Score")
                            .font(.title.bold())
                        Text("\(ecoScore)")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.green)
                    }
                    
                    // **Progress Bar**
                    ProgressView(value: Double(ecoScore), total: 100)
                        .progressViewStyle(LinearProgressViewStyle(tint: .green))
                        .frame(width: 250)
                    
                    // **Recent Actions**
                    Text("Recent Actions")
                        .font(.title2.bold())
                    
                    List(actionsCompleted, id: \.0) { action in
                        HStack {
                            Text(action.0)
                            Spacer()
                            Text(action.1)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Eco Score")
            }
        }
    }

    

#Preview {
    EcoScoreView()
}
