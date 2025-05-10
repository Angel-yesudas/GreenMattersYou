import Foundation
import FirebaseFirestore

class NotificationViewModel: ObservableObject {
    @Published var notifications: [AppNotification] = []
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("notifications").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.notifications = documents.compactMap { doc in
                let data = doc.data()
                let title = data["title"] as? String ?? ""
                let message = data["message"] as? String ?? ""
                let timestamp = (data["timestamp"] as? Timestamp)?.dateValue() ?? Date()
                
                return AppNotification(title: title, message: message, timestamp: timestamp)
            }
        }
    }
}

