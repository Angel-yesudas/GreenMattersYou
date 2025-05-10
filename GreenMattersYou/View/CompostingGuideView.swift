//
//  CompostingGuideView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/03/25.
//

import SwiftUI

struct CompostingGuideView: View {
    
        let compostingSteps = [
            ("Step 1", "Collect organic waste like fruit peels, vegetable scraps, and coffee grounds."),
            ("Step 2", "Create layers of green (wet) and brown (dry) waste for proper decomposition."),
            ("Step 3", "Keep the compost moist but not too wet."),
            ("Step 4", "Turn the compost regularly to speed up decomposition."),
            ("Step 5", "After a few weeks, you'll have nutrient-rich compost for gardening!")
        ]
        
        let faqs = [
            ("What can I compost?", "You can compost vegetable scraps, eggshells, coffee grounds, and dry leaves."),
            ("What should I avoid?", "Avoid dairy, meat, and oily food scraps as they attract pests."),
            ("How long does composting take?", "It usually takes 4-6 weeks, depending on conditions.")
        ]
        
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Learn How to Compost at Home")
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        // **Composting Steps**
                        ForEach(compostingSteps, id: \.0) { step in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(step.0)
                                    .font(.headline)
                                Text(step.1)
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        
                        // **FAQs**
                        Text("Frequently Asked Questions")
                            .font(.title2.bold())
                            .padding(.horizontal)
                        
                        ForEach(faqs, id: \.0) { faq in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(faq.0)
                                    .font(.headline)
                                Text(faq.1)
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Composting Guide")
            }
        }
    }


#Preview {
    CompostingGuideView()
}
