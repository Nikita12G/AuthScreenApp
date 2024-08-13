//
//  MainMonthStatisticView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.08.2024.
//

import SwiftUI

struct MainMonthStatisticView: View {
    
    private let monthStatistic: [MonthStatistic]
    
    init(monthStatistic: [MonthStatistic]) {
        self.monthStatistic = monthStatistic
    }
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(monthStatistic) { dataSource in
                MainChartView(imageName: dataSource.imageName, progress: dataSource.progress, title: dataSource.title, value: "\(dataSource.value)")
            }
        }.frame(maxWidth: 300)
    }
}

#Preview {
    MainContentView()
}
