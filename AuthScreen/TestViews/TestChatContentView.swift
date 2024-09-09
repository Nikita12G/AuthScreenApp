//
//  TestChatContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 08.08.2024.
//

import SwiftUI

struct TestChatContentView: View {
    var body: some View {
        Text("ChatContentView")
            .font(Fonts.montserrat(ofSize: 100))
            .foregroundStyle(Colors.White)
            .applyBackground()
    }
}

#Preview {
    TestChatContentView()
}