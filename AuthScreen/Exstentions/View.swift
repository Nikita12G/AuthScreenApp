//
//  View.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 09.09.2024.
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
