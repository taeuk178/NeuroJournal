//
//  Item.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    
    @Attribute(.unique) var id = UUID()
    var text: String
    var timestamp: Date
    
    init(text: String, timestamp: Date) {
        self.text = text
        self.timestamp = timestamp
    }
}
