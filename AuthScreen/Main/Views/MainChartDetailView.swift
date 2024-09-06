//
//  MainChartDetailView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 23.08.2024.
//

import SwiftUI
import Charts

struct MainChartDetailView: View {
    
    private var scoredGoals: [GoalsStatistic]
    private var missedGoals: [GoalsStatistic]
    private var goalsDifference: Int
    
    init(scoredGoals: [GoalsStatistic], missedGoals: [GoalsStatistic], goalsDifference: Int) {
        self.scoredGoals = scoredGoals
        self.missedGoals = missedGoals
        self.goalsDifference = goalsDifference
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.footballGoalCount)
                .font(Fonts.montserrat(ofSize: 18))
                .fontWeight(.bold)
                .foregroundStyle(Colors.White)
            HStack {
                Text(Constants.footballResult)
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(Colors.Grey)
                Text("\(goalsDifference > 0 ? "+" : "-")\(goalsDifference)")
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(goalsDifference > 0 ? Colors.Green : Colors.Red)
            }
            .padding(EdgeInsets(top: 6, leading: 0, bottom: 24, trailing: 0))
            MainChartView(scoredGoals: scoredGoals, missedGoals: missedGoals)
        }
        .padding(24)
        .background(AuthGradientView())
        .cornerRadius(28)
    }
}


#Preview {
    MainContentView()
}
