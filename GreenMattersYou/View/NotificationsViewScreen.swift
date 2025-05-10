import SwiftUI
import Firebase
import FirebaseFirestore



struct NotificationsViewScreen: View {
    
    @ObservedObject private var viewModel = NotificationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.notifications) { notification in
                    VStack(alignment: .leading) {
                        Text(notification.title).font(.headline)
                        Text(notification.message).font(.subheadline)
                        Text(notification.timestamp, style: .time)
                        Text(notification.timestamp, style: .date)

                    }
                }
                .navigationBarTitle("Notifications", displayMode: .inline)
                .onAppear {
                    self.viewModel.fetchData()
                }
            }
        }
    }
}

#Preview {
    NotificationsViewScreen()
}
