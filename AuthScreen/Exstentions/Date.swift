//
//  Date.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 09.09.2024.
//

import SwiftUI

extension Date {
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    static func formattedString(year: Int, month: Int) -> String {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        
        let calendar = Calendar.current
        if let date = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    init(year: Int, month: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        
        let calendar = Calendar.current
        if let date = calendar.date(from: dateComponents) {
            self = date
        } else {
            self = Date()
        }
    }
}
