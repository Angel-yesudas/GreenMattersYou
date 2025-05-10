//
//  CommunityView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct CommunityView: View {
    
    @ObservedObject private var viewModel = CommunityViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.events) { event in
                    VStack(alignment: .leading) {
                        Image(systemName:event.icon)
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                        
                                    
                        Text(event.title).font(.headline)
                        Text("📍 Location: \(event.location)")
                        Text(event.message).font(.subheadline)
                        Text(event.timestamp, style: .time)
                        Text(event.timestamp, style: .date)

                    }
                }
                .navigationBarTitle("Community initiatives", displayMode: .inline)
                .onAppear {
                    self.viewModel.fetchData()
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CommunityView()
}

