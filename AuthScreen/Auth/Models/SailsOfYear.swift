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
            .init(date: Date(year: 2024, month: 01), sailValue: 222),
            .init(date: Date(year: 2024, month: 02), sailValue: 335),
            .init(date: Date(year: 2024, month: 03), sailValue: 844),
            .init(date: Date(year: 2024, month: 04), sailValue: 338),
            .init(date: Date(year: 2024, month: 05), sailValue: 444),
            .init(date: Date(year: 2024, month: 06), sailValue: 888),
            .init(date: Date(year: 2024, month: 07), sailValue: 457),
            .init(date: Date(year: 2024, month: 08), sailValue: 887),
            .init(date: Date(year: 2024, month: 09), sailValue: 567),
            .init(date: Date(year: 2024, month: 10), sailValue: 867),
            .init(date: Date(year: 2024, month: 11), sailValue: 456),
            .init(date: Date(year: 2024, month: 12), sailValue: 299)
        ]
    }
    
    static func lastYear() -> [SalesOfYear] {
        
        return [
            .init(date: Date(year: 2023, month: 01), sailValue: 456),
            .init(date: Date(year: 2023, month: 02), sailValue: 335),
            .init(date: Date(year: 2023, month: 03), sailValue: 338),
            .init(date: Date(year: 2023, month: 04), sailValue: 335),
            .init(date: Date(year: 2023, month: 05), sailValue: 444),
            .init(date: Date(year: 2023, month: 06), sailValue: 335),
            .init(date: Date(year: 2023, month: 07), sailValue: 457),
            .init(date: Date(year: 2023, month: 08), sailValue: 335),
            .init(date: Date(year: 2023, month: 09), sailValue: 456),
            .init(date: Date(year: 2023, month: 10), sailValue: 999),
            .init(date: Date(year: 2023, month: 11), sailValue: 456),
            .init(date: Date(year: 2023, month: 12), sailValue: 567)
        ]
    }
}
