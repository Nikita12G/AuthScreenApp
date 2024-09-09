//
//  Helpers.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import Foundation
import SwiftUI

func phoneIsValid(phone: String) -> Bool {
    let phoneNumber = phone.filter { $0.isNumber }

    if phoneNumber.count < 11 {
        return false
    }

    let regex = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$"

    do {
        let regex = try NSRegularExpression(pattern: regex)
        let range = NSRange(location: 0, length: phone.count)

        if regex.firstMatch(in: phone, options: [], range: range) != nil {
            return true
        } else {
            return false
        }
    } catch {
        print("Invalid regex: \(error.localizedDescription)")
        return false
    }
}

func codeIsValid(code: String) -> Bool {
    return code.count >= 4 && code.allSatisfy { $0.isNumber }
}

struct AuthBackgroundImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            content
        }
    }
}
