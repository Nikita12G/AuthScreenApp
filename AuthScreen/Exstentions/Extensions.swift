//
//  Extensions.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
    
    func placeholder<Content: View>(alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder()
            self
        }
    }
    
    func applyBackground() -> some View {
        self.modifier(AuthBackgroundImageModifier())
    }
}

extension String {
    func formatPhoneNumber() -> String {
        var cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "+X (XXX) XXX-XX-XX"
        
        let cleanNumberWithoutFirstCharacter = cleanNumber.dropFirst()
        if let firstCharacter = cleanNumber.first, String(firstCharacter) != "7" {
            cleanNumber = "7" + String(cleanNumberWithoutFirstCharacter)
        }
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }
}
