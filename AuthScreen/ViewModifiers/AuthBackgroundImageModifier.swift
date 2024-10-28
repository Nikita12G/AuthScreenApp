//
//  AuthBackgroundImageModifier.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 09.09.2024.
//

import SwiftUI

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
