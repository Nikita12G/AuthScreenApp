//
//  UserContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 08.08.2024.
//

import SwiftUI

struct UserContentView: View {
    var body: some View {
        Text("UserContentView")
            .font(Fonts.montserrat(ofSize: 100))
            .foregroundStyle(Colors.White)
            .applyBackground()
    }
}

#Preview {
    UserContentView()
}
