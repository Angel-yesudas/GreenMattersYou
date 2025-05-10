//
//  GreenMattersYouApp.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 05/04/25.
//

import SwiftUI
import Firebase

@main
struct GreenMattersYouApp: App {

    @StateObject private var navigationManager = NavigationManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                ContentView()
                    .environmentObject(navigationManager)
            }
        }
    }
}
