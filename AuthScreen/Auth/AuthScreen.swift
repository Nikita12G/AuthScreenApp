//
//  AuthScreen.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

@main
struct AuthScreen: App {
    
    @State private var phoneNumber = ""
    @ObservedObject private var router = Router.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                AuthInputCodeContentView(phoneNumber: $phoneNumber).applyBackground()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .inputCode:
                            AuthInputCodeContentView(phoneNumber: $phoneNumber).applyBackground()
                            // TODO: - Only for tests !!!
                        case .mainScreen:
                            AuthWaitView().applyBackground()
                        }
                    }
            }
        }
    }
}

