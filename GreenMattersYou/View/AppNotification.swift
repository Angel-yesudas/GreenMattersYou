//
//  AppNotification.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 16/04/25.
//


import Foundation

struct AppNotification: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    var timestamp: Date
}

