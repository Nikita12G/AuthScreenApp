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
    } else {
        return true
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
