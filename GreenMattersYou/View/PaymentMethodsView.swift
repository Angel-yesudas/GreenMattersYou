//
//  PaymentMethodsView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct PaymentMethodsView: View {
    @State private var paymentMethods = [
        PaymentMethod(type: "Credit Card", lastFour: "1234", icon: "creditcard.fill"),
        PaymentMethod(type: "PayPal", lastFour: "john@example.com", icon: "dollarsign.circle.fill"),
        PaymentMethod(type: "UPI", lastFour: "john@upi", icon: "arrow.triangle.2.circlepath")
    ]
    
    var body: some View {
        

        
           
            
                VStack {
                    List {
                        ForEach(paymentMethods, id: \.id) { method in
                            HStack {
                                Image(systemName: method.icon)
                                    .foregroundColor(.blue)
                                    .frame(width: 30, height: 30)

                                VStack(alignment: .leading) {
                                    Text(method.type)
                                        .font(.headline)
                                    Text("•••• \(method.lastFour)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Button(action: {
                                    print("Edit \(method.type)")
                                }) {
                                    Image(systemName: "pencil.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                        
                        // Add Payment Method Button
                        Button(action: {
                            print("Add new payment method")
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                Text("Add Payment Method")
                                    .font(.headline)
                                    .foregroundColor(.green)
                            }
                            .padding()
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Payment Methods")
                .padding()
            }
        }

        // 📌 Payment Method Model
        struct PaymentMethod: Identifiable {
            let id = UUID()
            let type: String
            let lastFour: String
            let icon: String
        }

      
        


#Preview {
    PaymentMethodsView()
}
