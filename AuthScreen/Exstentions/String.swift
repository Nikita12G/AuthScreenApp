//
//  String.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 09.09.2024.
//

import SwiftUI

extension String {
    func formatPhoneNumber() -> String {
        var cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = Constants.authorisationPhoneFormat
        
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
