//
//  MainChartDetailView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 23.08.2024.
//

import SwiftUI
import Charts

struct MainChartDetailView: View {
    @StateObject private var footballViewModel = FootballViewModel()
    
    var body: some View {
        if footballViewModel.isLoading {
            VStack(spacing: 20) {
                ProgressView()
                    .frame(height: 50)
                    .tint(Colors.White)
                    .scaleEffect(2)
                Text("Loading...")
                    .font(Fonts.montserrat(ofSize: 22))
                    .foregroundStyle(Colors.White)
            }
        } else if let errorMessage = footballViewModel.errorMessage {
            Text(errorMessage)
                .font(Fonts.montserrat(ofSize: 18))
                .foregroundStyle(Colors.White)
        }
        VStack(alignment: .leading) {
            Text("\(footballViewModel.teamStatistics?.response?.team?.name ?? "") \(Constants.footballGoalCount)")
                .font(Fonts.montserrat(ofSize: 18))
                .fontWeight(.bold)
                .foregroundStyle(Colors.White)
                .hidden(footballViewModel.isLoading || footballViewModel.errorMessage != nil)
            
            HStack {
                Text(Constants.footballResult)
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(Colors.Grey)
                Text("\(footballViewModel.getTotalGoalDifference() > 0 ? "+" : "-")\(footballViewModel.getTotalGoalDifference())")
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(footballViewModel.getTotalGoalDifference() > 0 ? Colors.Green : Colors.Red)
            }
            .padding(EdgeInsets(top: 6, leading: 0, bottom: 24, trailing: 0))
            .hidden(footballViewModel.isLoading || footballViewModel.errorMessage != nil)
            MainChartView(scoredGoals: footballViewModel.getScoredGoalsForMinutes(), missedGoals: footballViewModel.getMissedGoalsForMinutes())
        }
        .padding(24)
        .background(AuthGradientView())
        .cornerRadius(28)
        .hidden(footballViewModel.isLoading || footballViewModel.errorMessage != nil)
        .onAppear {
            footballViewModel.fetchTeamStatistics(season: 2020, teamId: 33, leagueId: 39)
        }
    }
}


#Preview {
    MainContentView()
}
