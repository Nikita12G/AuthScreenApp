//
//  MonthStatistic.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.08.2024.
//

import Foundation

struct MonthStatistic: Identifiable {
    var id = UUID()
    
    let title: String
    let value: Double
    let totalValue: Double
    let valueType: String?
    let imageName: String
}

extension MonthStatistic {
    var valueStr: String {
        "\(value)\(valueType ?? "")"
    }
    
    var progress: Double {
        value / totalValue
    }
}
