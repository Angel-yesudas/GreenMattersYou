//
//  InviteFriendsView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct InviteFriendsView: View {
    let friends = [
        "Rahul Kumar", "Anjali Sharma", "Vishnu Mohan", "Aisha Begum", "Arjun Nair"
    ]
    var body: some View {
       
                VStack {
                    List {
                        ForEach(friends, id: \.self) { friend in
                            HStack {
                                Text(friend)
                                    .font(.body)
                                
                                Spacer()
                                
                                Button(action: {
                                    print("\(friend) invited")
                                }) {
                                    Text("Invite")
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                .navigationTitle("Invite Friends")
            }
        }

        

#Preview {
    InviteFriendsView()
}
