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
    
    static var DarkPurple: Color {
        Color(r: 30, g: 5, b: 55)
    }
    
    static var PurpleFirstGradient: Color {
        Color(r: 29, g: 6, b: 40, o: 94)
    }
    
    static var PurpleSecondGradient: Color {
        Color(r: 15, g: 10, b: 35, o: 49)
    }
    
    static var GraphikPinkGradientFirstColor: Color {
        Color(r: 225, g: 46, b: 254, o: 100)
    }
    
    static var GraphikPinkGradientSecondColor: Color {
        Color(r: 143, g: 0, b: 255)
    }
    
    static var GraphikBlueGradientFirstColor: Color {
        Color(r: 44, g: 128, b: 254, o: 56)
    }
    
    static var GraphikBlueGradientSecondColor: Color {
        Color(r: 44, g: 65, b: 255)
    }
    
    static var GraphikGreenGradientColor: Color {
        Color(r: 5, g: 205, b: 153)
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
    
    static var Blue: Color {
        Color(r: 35, g: 70, b: 255)
    }
    
    static var Grey: Color {
        Color(r: 160, g: 174, b: 192)
    }
    
    static var DarkGrey: Color {
        Color(r: 86, g: 87, b: 122)
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
    
    init(r: Int, g: Int, b: Int, o: Double) {
        self.init(
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: o / 255.0
        )
    }
}
