//
//  Contact.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.08.2024.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    
    let avatar: String
    let firstName: String
    let middleName: String
    let jobTitle: String
    let mobileOperator: String
    let allSailsValue: Int
    let sailValue: Int
    let gradeValue: Double
}

extension Contact {
    var fullName: String {
        "\(firstName) \(middleName)"
    }
    
    var sailsProgressStr: String {
        "\(sailValue.description) / \(allSailsValue.description)"
    }
    
    var sailsProgres: Double {
        (Double(sailValue) / Double(allSailsValue))
    }
    
    var sailsProgresProcent: String {
        String(format: "%.0f", (sailsProgres * 100)) + "%"
    }
}
