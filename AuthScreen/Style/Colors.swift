//
//  Colors.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import UIKit
import SwiftUI

enum Colors {
    static var Purple: Color {
        Color(r: 132, g: 0, b: 255)
    }
    
    static var PurpleFirstGradient: Color {
        Color(r: 29, g: 6, b: 40)
    }
    
    static var PurpleSecondGradient: Color {
        Color(r: 15, g: 10, b: 35)
    }
    
    static var White: Color {
        Color(r: 255, g: 255, b: 255)
    }
    
    static var Red: Color {
        Color(r: 236, g: 0, b: 0)
    }
    
    static var Green: Color {
        Color(r: 1, g: 181, b: 116)
    }
    
}

extension Color {
    init(r: Int, g: Int, b: Int) {
        self.init(
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0
        )
    }
}
