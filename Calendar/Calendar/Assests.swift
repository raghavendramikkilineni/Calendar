//
//  Assests.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import Foundation
import SwiftUI

struct Assests {
    struct Color {
        
    }
}

extension Assests.Color {
    static var circleColor: Color { Color(#function) }
    static var defaultColor: Color { Color(#function) }
    static var monthTitle: Color { Color(#function) }
    static var invertedColor: Color { Color(#function) }
    static var high: Color { Color(#function) }
    static var medium: Color { Color(#function) }
    static var low: Color { Color(#function) }
    
   static func reminderColor(for priority: Priority) -> Color {
        switch priority {
        case .high:
            return Assests.Color.high
        case .medium:
            return Assests.Color.medium
        case .low:
            return Assests.Color.low
        }
    }
}


