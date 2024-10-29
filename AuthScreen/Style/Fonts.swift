//
//  Fonts.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

enum Fonts {
    
    // MARK: Fonts
    
    static func montserrat(ofSize size: CGFloat) -> Font {
        return getFont(name: montserrat, size: size)
    }
    
    // MARK: Private
    
    private static let montserrat = Constants.fontsMontserrat
    
    private static func getFont(name: String, size: CGFloat) -> Font {
        Font.custom(name, size: size) 
    }
}
