//
//  Item.swift
//  FlashCards
//
//  Created by Richard on 13.09.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date, term:String) {
        self.timestamp = timestamp
    }
}

