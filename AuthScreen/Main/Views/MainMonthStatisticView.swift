//
//  MainMonthStatisticView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.08.2024.
//

import SwiftUI

struct MainMonthStatisticView: View {
    
    @State private var statistic: Statistic
    @Binding private var monthSelected: Int
    
    init(statistic: State<Statistic>, monthSelected: Binding<Int>) {
        self._statistic = statistic
        self._monthSelected = monthSelected
    }
    
    var body: some View {
        let monthStatistic = statistic.getStatistics(for: monthSelected)
        let leftColumn = monthStatistic.indices.filter { $0 % 2 == 0 }.map { monthStatistic[$0] }
        let rightColumn = monthStatistic.indices.filter { $0 % 2 != 0 }.map { monthStatistic[$0] }

        Text("\(Constants.statisticTitleOfMonth) \(monthSelected.description) \(Constants.statisticMonth)")
            .font(Fonts.montserrat(ofSize: 16))
            .foregroundStyle(Colors.White)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 12, trailing: 20))
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(leftColumn) { dataSource in
                    MainCirclesChartView(
                        imageName: dataSource.imageName,
                        progress: dataSource.progress,
                        title: dataSource.title,
                        value: "\(dataSource.value)"
                    )
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(rightColumn) { dataSource in
                    MainCirclesChartView(
                        imageName: dataSource.imageName,
                        progress: dataSource.progress,
                        title: dataSource.title,
                        value: "\(dataSource.value)"
                    )
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    MainContentView()
}
