//
//  MainTrendsView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 01.08.2024.
//

import SwiftUI

struct MainTrendsView: View {
    private let dataSours = [
        Trends(month: "01", trendsValue: 0.5, isTarget: false),
        Trends(month: "02", trendsValue: 0.3, isTarget: false),
        Trends(month: "03", trendsValue: 0.5, isTarget: false),
        Trends(month: "04", trendsValue: 0.7, isTarget: false),
        Trends(month: "05", trendsValue: 0.6, isTarget: false),
        Trends(month: "06", trendsValue: 0.2, isTarget: false),
        Trends(month: "07", trendsValue: 0.3, isTarget: false),
        Trends(month: "08", trendsValue: 0.9, isTarget: false),
        Trends(month: "09", trendsValue: 0.8, isTarget: true),
        Trends(month: "10", trendsValue: 0.1, isTarget: false),
        Trends(month: "11", trendsValue: 0.4, isTarget: false),
        Trends(month: "12", trendsValue: 0.8, isTarget: false)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Constants.mainMovingTendTitle)
                .font(Fonts.montserrat(ofSize: 18))
                .foregroundStyle(Colors.White)
            HStack(alignment: .bottom, spacing: 10.5) {
                ForEach(dataSours) { dataSours in
                    MainTrendProgressView(progress: dataSours.trendsValue, isTarget: dataSours.isTarget, monthValue: dataSours.month)
                }
            }
        }.applyBackground()
    }
}


#Preview {
    MainTrendsView()
}
