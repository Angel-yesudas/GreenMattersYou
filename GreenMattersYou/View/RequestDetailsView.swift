//
//  RequestDetailsView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct RequestDetailsView: View {
    let request: Request
    var body: some View {
       
            
            
            
                VStack(alignment: .leading, spacing: 16) {
                    Text("Request ID: \(request.id)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Date: \(request.date)")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Status:")
                            .font(.headline)
                        StatusBadge(status: request.status)
                    }
                    
                    Divider()
                    
                    Text("Collection Details")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("🗑 Waste Type: Organic Waste")
                    Text("🚛 Assigned Vehicle: KL-07-1234")
                    Text("👤 Assigned Worker: Arjun M.")
                    Text("📍 Location: 123 Green Street, Kerala")
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Request Details")
            }
        }

        // 📌 Preview
        #Preview {
            RequestDetailsView(request: Request(id: "REQ5678", date: "Feb 25, 2025", status: .pending))
        }

