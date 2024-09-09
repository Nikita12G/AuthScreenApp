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
    private var isLoading: Bool
    private var errorMessage: String?
    
    init(scoredGoals: [GoalsStatistic], missedGoals: [GoalsStatistic], goalsDifference: Int, isLoading: Bool, errorMessage: String?) {
        self.scoredGoals = scoredGoals
        self.missedGoals = missedGoals
        self.goalsDifference = goalsDifference
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        if isLoading {
            VStack(spacing: 20) {
                ProgressView()
                    .frame(height: 50)
                    .tint(Colors.White)
                    .scaleEffect(2)
                Text("Loading...")
                    .font(Fonts.montserrat(ofSize: 22))
                    .foregroundStyle(Colors.White)
            }
        } else if let errorMessage = errorMessage {
            Text(errorMessage)
                .font(Fonts.montserrat(ofSize: 18))
                .foregroundStyle(Colors.White)
        }
            VStack(alignment: .leading) {
                Text(Constants.footballGoalCount)
                    .font(Fonts.montserrat(ofSize: 18))
                    .fontWeight(.bold)
                    .foregroundStyle(Colors.White)
                    .hidden(isLoading || errorMessage != nil)

                HStack {
                    Text(Constants.footballResult)
                        .font(Fonts.montserrat(ofSize: 14))
                        .foregroundStyle(Colors.Grey)
                    Text("\(goalsDifference > 0 ? "+" : "-")\(goalsDifference)")
                        .font(Fonts.montserrat(ofSize: 14))
                        .foregroundStyle(goalsDifference > 0 ? Colors.Green : Colors.Red)
                }
                .padding(EdgeInsets(top: 6, leading: 0, bottom: 24, trailing: 0))
                .hidden(isLoading || errorMessage != nil)
                MainChartView(scoredGoals: scoredGoals, missedGoals: missedGoals)
            }
            .padding(24)
            .background(AuthGradientView())
            .cornerRadius(28)
            .hidden(isLoading || errorMessage != nil)
    }
}


#Preview {
    MainContentView()
}
