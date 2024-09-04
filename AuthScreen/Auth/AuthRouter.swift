//
//  AuthRouter.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 08.07.2024.
//

import SwiftUI

enum Route: Hashable {
    case inputPhone
    case inputCode
    case mainScreen
}

class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = NavigationPath()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func backToRoot() {
        path.removeLast(path.count)
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
