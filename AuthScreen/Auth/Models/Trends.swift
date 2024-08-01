//
//  Trends.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 01.08.2024.
//

import Foundation

struct Trends: Identifiable {
    var id = UUID()
    
    let month: String
    let trendsValue: Double
    let isTarget: Bool
    
    init(month: String, trendsValue: Double, isTarget: Bool) {
        self.month = month
        self.trendsValue = trendsValue
        self.isTarget = isTarget
    }
}
