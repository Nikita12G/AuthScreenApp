//
//  ExternalTraffic.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 29.08.2024.
//

import Foundation

struct ExternalTraffic: Identifiable {
    let id = UUID()
    
    let year: Int
    let month: Int
    let externalTrafficPercent: Double
    let newClientValue: Int
    let allClientValue: Int
}

extension ExternalTraffic {
    static func generateData(forMonth month: Int) -> ExternalTraffic {
        let month = month
        let currentYear = Calendar.current.component(.year, from: Date())
        let currentMonth = Calendar.current.component(.month, from: Date())
        
        guard month >= 1 && month <= 12 else {
            assertionFailure("Error Month not valid")
            return ExternalTraffic(year: currentYear,
                                   month: currentMonth,
                                   externalTrafficPercent: 0,
                                   newClientValue: 0,
                                   allClientValue: 0)
        }

        let externalTrafficPercent = Double.random(in: 0.1...0.99)
        let newClientValue = Int.random(in: 0...500)
        let allClientValue = Int.random(in: 500...1000)
        
        return ExternalTraffic(
            year: currentYear,
            month: month,
            externalTrafficPercent: externalTrafficPercent,
            newClientValue: newClientValue,
            allClientValue: allClientValue
        )
    }
}
