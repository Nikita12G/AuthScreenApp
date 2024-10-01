//
//  TrendProvider.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 08.08.2024.
//

import Foundation

protocol TrendProvider {
    func getTrend(for month: Int) -> [TrendsWithTargets]
}
