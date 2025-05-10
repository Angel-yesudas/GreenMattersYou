//
//  CommunityViewModel.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 16/04/25.
//

import Foundation
import FirebaseFirestore

class CommunityViewModel: ObservableObject {
    @Published var events: [AppEvent] = []
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("events").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.events = documents.compactMap { doc in
                let data = doc.data()
                let icon = data["icon"]as? String ?? ""
                let title = data["title"] as? String ?? ""
                let message = data["message"] as? String ?? ""
                let timestamp = (data["timestamp"] as? Timestamp)?.dateValue() ?? Date()
                let location = data["location"] as? String ?? ""
                return AppEvent(icon: icon,title: title, message: message, timestamp: timestamp,location: location)
            }
        }
    }
}


