//
//  Item.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 08/12/2023.
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
