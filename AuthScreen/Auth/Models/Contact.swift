//
//  Contact.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.08.2024.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    
    let firstName: String
    let middleName: String
    let mobileOperator: String
    let avatar: String
}

extension Contact {
    var fullName: String {
        "\(firstName) \(middleName)"
    }
}
