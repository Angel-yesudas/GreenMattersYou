//
//  AppEvent.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 16/04/25.
//

import Foundation

struct AppEvent: Identifiable {
    var id = UUID()
    var icon:String
    var title: String
    var message: String
    var timestamp: Date
    var location: String
}

