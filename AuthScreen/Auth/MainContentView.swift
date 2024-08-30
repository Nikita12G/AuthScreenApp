//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    @State private var statistic = Statistic()
    @State private var dataLastYear = SalesOfYear.lastYear()
    @State private var dataCurrentYear = SalesOfYear.currentYear()
    @State private var percentageChange = SalesOfYear.percentageChange()
    @State private var monthSelected = 1
    @State private var targetMonthForExternalTraffic = Date().month
    
    var body: some View {
        VStack {
            HStack {
                MainSideBarView()
                VStack {
                    MainChartDetailView(dataLastYear: dataLastYear, dataCurrentYear: dataCurrentYear, percentageChange: percentageChange)
                    HStack {
                        MainContactsListView(isDetailList: true)
                        MainExternalView()
                    }
                }
                VStack(alignment: .center) {
                    MainTrendsView(trends: statistic.getTrend(for: monthSelected))
                        .padding(EdgeInsets(top: 36, leading: 19, bottom: 20, trailing: 19))
                    MainMonthStatisticView(monthStatistic: statistic.getStatistics(for: monthSelected))
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 16, trailing: 0))
                    MainContactsListView(isDetailList: false)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 16, trailing: 0))
                    Spacer()
                }.background(AuthGradientView())
                    .clipShape(RoundedCorners(topLeft: 44, bottomLeft: 44))
            }
        }
        .background(Colors.DarkPurple)
        .ignoresSafeArea()
        
    }
}

#Preview {
    MainContentView()
}
