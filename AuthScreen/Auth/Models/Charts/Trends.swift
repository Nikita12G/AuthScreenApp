//
//  Trends.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 01.08.2024.
//

import Foundation

struct Trend: Identifiable {
    var id = UUID()
    
    let month: Int
    let trendsValue: Double
    
    init(month: Int, trendsValue: Double) {
        self.month = month
        self.trendsValue = trendsValue
    }
}

struct TrendsWithTargets: Identifiable {
    var id = UUID()

    let trend: Trend
    let isTarget: Bool
    
    init(trend: Trend, isTarget: Bool) {
        self.trend = trend
        self.isTarget = isTarget
    }
}
