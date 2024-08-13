//
//  MainTrendsView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 01.08.2024.
//

import SwiftUI

struct MainTrendsView: View {
    
    private var trends: [TrendsWithTargets]
    
    init(trends: [TrendsWithTargets]) {
        self.trends = trends
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Constants.mainMovingTendTitle)
                .font(Fonts.montserrat(ofSize: 18))
                .foregroundStyle(Colors.White)
            HStack(alignment: .bottom, spacing: 10.5) {
                ForEach(trends) { dataSours in
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(dataSours.isTarget ? Colors.Blue : Colors.White)
                            .frame(width: 9 , height: 80 * dataSours.trend.trendsValue)
                        Text(String(dataSours.trend.month))
                            .font(Fonts.montserrat(ofSize: 12))
                            .foregroundStyle(dataSours.isTarget ? Colors.White : Colors.Grey)
                    }
                }
            }
        }
    }
}


#Preview {
    MainContentView()
}
