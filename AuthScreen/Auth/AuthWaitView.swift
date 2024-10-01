//
//  AuthWaitView.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 08.07.2024.
//

import SwiftUI

struct AuthWaitView: View {
    var body: some View {
        ZStack {
            AuthGradientView()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
        .cornerRadius(28)
        .padding(10)
        .frame(width: 400, height: 429)
    }
}

#Preview {
    AuthWaitView()
}
