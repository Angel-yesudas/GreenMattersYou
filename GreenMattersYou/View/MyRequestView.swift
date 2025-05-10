//
//  MyRequestView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct MyRequestView: View {
    @State private var requests = [
        Request(id: "REQ1234", date: "Feb 20, 2025", status: .completed),
        Request(id: "REQ5678", date: "Feb 25, 2025", status: .pending),
        Request(id: "REQ9012", date: "Feb 15, 2025", status: .completed)
    ]
    var body: some View {
        
            
            
           
                VStack {
                    List {
                        ForEach(requests) { request in
                            NavigationLink(destination: RequestDetailsView(request: request)) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Request ID: \(request.id)")
                                            .font(.headline)
                                        Text("Date: \(request.date)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    StatusBadge(status: request.status)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("My Requests")
                .padding()
            }
        }

        // 📌 Request Model
        struct Request: Identifiable {
            let id: String
            let date: String
            let status: RequestStatus
        }

        enum RequestStatus {
            case pending, completed
        }

        // 📌 Status Badge Component
        struct StatusBadge: View {
            let status: RequestStatus
            
            var body: some View {
                Text(status == .completed ? "✅ Completed" : "⏳ Pending")
                    .font(.caption)
                    .foregroundColor(status == .completed ? .green : .orange)
                    .padding(6)
                    .background(status == .completed ? Color.green.opacity(0.2) : Color.orange.opacity(0.2))
                    .cornerRadius(8)
            }
        }

        


#Preview {
    MyRequestView()
}
