//
//  GoalsStatistic.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.09.2024.
//

import Foundation

struct GoalsStatistic: Identifiable {
    let id = UUID()
    let startTime: Date
    let endTime: Date
    let goalValue: Int
}
