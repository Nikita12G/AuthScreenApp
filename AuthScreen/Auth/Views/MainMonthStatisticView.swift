//
//  MainMonthStatisticView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.08.2024.
//

import SwiftUI

struct MainMonthStatisticView: View {
    
    let dataSource = [
        MonthStatistic(title: "Цена", value: 869, totalValue: 1000, valueType: "$", imageName: "wallet"),
        MonthStatistic(title: "Клик", value: 24, totalValue: 100, valueType: "%", imageName: "roket"),
        MonthStatistic(title: "Покупки", value: 22300, totalValue: 100000, valueType: nil, imageName: "shoppingBag"),
        MonthStatistic(title: "Цена", value: 1.2, totalValue: 100, valueType: "%", imageName: "wrench")
    ]
    
    var body: some View {
        let columns = [
            GridItem(.fixed(150)),
            GridItem(.fixed(150))
        ]
        
        LazyVGrid(columns: columns) {
            ForEach(dataSource) { dataSource in
                    MainChartView(imageName: dataSource.imageName, progress: dataSource.progress, title: dataSource.title, value: "\(dataSource.value)")
            }
        }.applyBackground()
    }
}

#Preview {
    MainMonthStatisticView()
}
