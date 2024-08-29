//
//  MainPointView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 28.08.2024.
//

import SwiftUI

struct MainPointView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Colors.Purple, lineWidth: 1)
                .foregroundStyle(Color.clear)
                .frame(width: 32, height: 32)
            Circle()
                .stroke(Colors.Purple, lineWidth: 4)
                .foregroundStyle(Colors.White)
                .frame(width: 20, height: 20)
        }
    }
}

#Preview {
    MainPointView()
}
