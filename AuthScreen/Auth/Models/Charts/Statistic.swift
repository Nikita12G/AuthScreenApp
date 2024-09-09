//
//  Statistic.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 07.08.2024.
//

import Foundation

struct Statistic: Identifiable, MonthStatisticProvider, TrendProvider {
    
    var id = UUID()
    
    var trends = [
        Trend(month: 1, trendsValue: 0.5),
        Trend(month: 2, trendsValue: 0.3),
        Trend(month: 3, trendsValue: 0.5),
        Trend(month: 4, trendsValue: 0.7),
        Trend(month: 5, trendsValue: 0.6),
        Trend(month: 6, trendsValue: 0.2),
        Trend(month: 7, trendsValue: 0.3),
        Trend(month: 8, trendsValue: 0.9),
        Trend(month: 9, trendsValue: 0.8),
        Trend(month: 10, trendsValue: 0.8),
        Trend(month: 11, trendsValue: 0.9),
        Trend(month: 12, trendsValue: 0.5)
    ]

    let statistics = [
        1: [
            MonthStatistic(title: Constants.price, value: 869, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 24, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 22300, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 1.2, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        2: [
            MonthStatistic(title: Constants.price, value: 69, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 4, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 200, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 12, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        3: [
            MonthStatistic(title: Constants.price, value: 19, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 54, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 25300, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 13, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        4: [
            MonthStatistic(title: Constants.price, value: 839, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 94, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 11300, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 99, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        5: [
            MonthStatistic(title: Constants.price, value: 999, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 4, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 300, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 19, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        6: [
            MonthStatistic(title: Constants.price, value: 333, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 33, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 33333, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 33, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        7: [
            MonthStatistic(title: Constants.price, value: 11, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 11, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 1100, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 11, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        8: [
            MonthStatistic(title: Constants.price, value: 555, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 55, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 55500, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 52, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        9: [
            MonthStatistic(title: Constants.price, value: 565, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 54, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 2555, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 55, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        10: [
            MonthStatistic(title: Constants.price, value: 99, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 99, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 9900, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 90, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        11: [
            MonthStatistic(title: Constants.price, value: 85, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 66, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 22388, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 19, totalValue: 100, valueType: "%", imageName: "wrench")
        ],
        12: [
            MonthStatistic(title: Constants.price, value: 444, totalValue: 1000, valueType: "$", imageName: "wallet"),
            MonthStatistic(title: Constants.usersClick, value: 29, totalValue: 100, valueType: "%", imageName: "roket"),
            MonthStatistic(title: Constants.buy, value: 28800, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
            MonthStatistic(title: Constants.price, value: 18, totalValue: 100, valueType: "%", imageName: "wrench")
        ]
    ]
    
    func getStatistics(for month: Int) -> [MonthStatistic] {
        return statistics[month] ?? []
    }
    
    func getTrend(for month: Int) -> [TrendsWithTargets] {
        let trends = trends
        var result = [TrendsWithTargets]()
        for trend in trends {
            result.append(TrendsWithTargets(trend: trend, isTarget: trend.month == month))
        }
        return result
    }
}
