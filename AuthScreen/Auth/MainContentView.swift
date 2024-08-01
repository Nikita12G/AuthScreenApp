//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        HStack {
            MainLeftBarView()
        }.applyBackground()
    }
}

#Preview {
    MainContentView()
}
