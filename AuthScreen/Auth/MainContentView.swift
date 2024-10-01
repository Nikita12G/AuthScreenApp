//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var statistic = Statistic()
    @State private var monthSelected = 1
    
    var body: some View {
        VStack {
            HStack {
                MainSideBarView()
                Spacer()
                Picker(Constants.monthTitle, selection: $monthSelected) {
                    ForEach((1...12), id: \.self) { selectedMonth in
                        Text("\(Constants.monthTitle) \(selectedMonth)").tag(selectedMonth)
                    }
                }
                Spacer()
                VStack(alignment: .center) {
                    MainTrendsView(trends: statistic.getTrend(for: monthSelected))
                        .padding(EdgeInsets(top: 36, leading: 19, bottom: 20, trailing: 19))
                    MainMonthStatisticView(monthStatistic: statistic.getStatistics(for: monthSelected))
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 16, trailing: 0))
                    MainContactsListView()
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 16, trailing: 0))
                }.background(AuthGradientView())
                    .clipShape(RoundedCorners(topLeft: 44, bottomLeft: 44))
            }
        }.background(Colors.DarkPurple)
            .ignoresSafeArea()
    }
}

#Preview {
    MainContentView()
}
