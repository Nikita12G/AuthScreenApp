//
//  AuthScreen.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 15.07.2024.
//

import SwiftUI

@main
struct AuthScreen: App {
    
    @State private var phoneNumber = ""
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
}

