//
//  MonthStatisticProvider.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 08.08.2024.
//

import Foundation

protocol MonthStatisticProvider {
    func getStatistics(for month: Int) -> [MonthStatistic]
}
