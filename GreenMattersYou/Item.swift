//
//  Item.swift
//  GreenMattersYou
//
//  Created by macbook air m1 on 05/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
