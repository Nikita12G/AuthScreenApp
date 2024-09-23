//
//  MainRightSideBar.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 30.08.2024.
//

import SwiftUI

struct MainRightSideBar: View {
    
    @State private var statistic = Statistic()
    @Binding private var monthSelected: Int

    init(monthSelected: Binding<Int>) {
        self._monthSelected = monthSelected
    }
    
    var body: some View {
        VStack(alignment: .center) {
            MainTrendsView(trends: statistic.getTrend(for: monthSelected))
                .padding(EdgeInsets(top: 36, leading: 20, bottom: 20, trailing: 20))
            MainMonthStatisticView(statistic: _statistic, monthSelected: $monthSelected)
            MainContactsListView(isDetailList: false)
            Spacer()
        }.background(AuthGradientView())
            .clipShape(RoundedCorners(topLeft: 44, bottomLeft: 44))
    }
}

#Preview {
    MainContentView()
}
