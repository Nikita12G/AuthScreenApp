//
//  SalesOfYear.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 23.08.2024.
//

import Foundation

struct SalesOfYear: Identifiable {
    let id = UUID()
    let date: Date
    let sailValue: Int
    
    static func currentYear() -> [SalesOfYear] {
        
        return [
            .init(date: Date(year: 2024, month: 01), sailValue: 155),
            .init(date: Date(year: 2024, month: 02), sailValue: 210),
            .init(date: Date(year: 2024, month: 03), sailValue: 300),
            .init(date: Date(year: 2024, month: 04), sailValue: 338),
            .init(date: Date(year: 2024, month: 05), sailValue: 444),
            .init(date: Date(year: 2024, month: 06), sailValue: 504),
            .init(date: Date(year: 2024, month: 07), sailValue: 600),
            .init(date: Date(year: 2024, month: 08), sailValue: 659),
            .init(date: Date(year: 2024, month: 09), sailValue: 600),
            .init(date: Date(year: 2024, month: 10), sailValue: 550),
            .init(date: Date(year: 2024, month: 11), sailValue: 500),
            .init(date: Date(year: 2024, month: 12), sailValue: 450)
        ]
    }
    
    static func lastYear() -> [SalesOfYear] {
        
        return [
            .init(date: Date(year: 2023, month: 01), sailValue: 456),
            .init(date: Date(year: 2023, month: 02), sailValue: 335),
            .init(date: Date(year: 2023, month: 03), sailValue: 260),
            .init(date: Date(year: 2023, month: 04), sailValue: 200),
            .init(date: Date(year: 2023, month: 05), sailValue: 399),
            .init(date: Date(year: 2023, month: 06), sailValue: 450),
            .init(date: Date(year: 2023, month: 07), sailValue: 540),
            .init(date: Date(year: 2023, month: 08), sailValue: 600),
            .init(date: Date(year: 2023, month: 09), sailValue: 990),
            .init(date: Date(year: 2023, month: 10), sailValue: 743),
            .init(date: Date(year: 2023, month: 11), sailValue: 689),
            .init(date: Date(year: 2023, month: 12), sailValue: 600)
        ]
    }
    
    static func percentageChange() -> Int {
        let totalCurrentYearSales = currentYear().reduce(0) { $0 + $1.sailValue }
        
        let totalLastYearSales = lastYear().reduce(0) { $0 + $1.sailValue }
        
        if totalLastYearSales > 0 {
            let percentageChange = Int(((Double(totalCurrentYearSales) - Double(totalLastYearSales)) / Double(totalLastYearSales)) * 100)
            return percentageChange
        } else {
            return 0
        }
    }
}
