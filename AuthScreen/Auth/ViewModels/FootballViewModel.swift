//
//  FootballViewModel.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 05.09.2024.
//

import Foundation
import Combine
import SwiftUI

class FootballViewModel: ObservableObject {
    @Published var teamStatistics: TeamStatistics?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let timeRanges = ["0-15", "16-30", "31-45", "46-60", "61-75", "76-90", "91-105"]
    private var networkService = FootballNetworkServices()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchTeamStatistics(season: Int, teamId: Int, leagueId: Int) {
        self.isLoading = true
        self.errorMessage = nil
        
        networkService.fetchTeamStatisticsPublisher(season: season, teamId: teamId, leagueId: leagueId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] statistics in
                self?.teamStatistics = statistics
            })
            .store(in: &cancellables)
    }
    
    func getScoredGoalsForMinutes() -> [GoalsStatistic] {
        guard let minuteStats = teamStatistics?.response?.goals?.goalsFor?.minute else {
            return []
        }
        
        return timeRanges.compactMap { timeRange in
            if let dates = convertTimeRangeToDates(timeRange: timeRange),
               let goalValue = minuteStats[timeRange]?.total {
                return GoalsStatistic(startTime: dates.start, endTime: dates.end, goalValue: goalValue)
            }
            return nil
        }
    }

    func getMissedGoalsForMinutes() -> [GoalsStatistic] {
        guard let minuteStats = teamStatistics?.response?.goals?.against?.minute else {
            return []
        }
        
        return timeRanges.compactMap { timeRange in
            if let dates = convertTimeRangeToDates(timeRange: timeRange),
               let goalValue = minuteStats[timeRange]?.total {
                return GoalsStatistic(startTime: dates.start, endTime: dates.end, goalValue: goalValue)
            }
            return nil
        }
    }
    
    func getTotalGoalDifference() -> Int {
        guard let goalsFor = teamStatistics?.response?.goals?.goalsFor?.minute,
              let goalsAgainst = teamStatistics?.response?.goals?.against?.minute else {
            return 0
        }
        
        let totalScoredGoals = goalsFor.values.reduce(0) { $0 + ($1.total ?? 0) }
        let totalMissedGoals = goalsAgainst.values.reduce(0) { $0 + ($1.total ?? 0) }
        
        return totalScoredGoals - totalMissedGoals
    }
    
    private func convertTimeRangeToDates(timeRange: String) -> (start: Date, end: Date)? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let components = timeRange.split(separator: "-")
        guard components.count == 2,
              let startMinutes = Int(components[0]),
              let endMinutes = Int(components[1]) else {
            return nil
        }
        
        var startDateComponents = DateComponents()
        startDateComponents.hour = 0
        startDateComponents.minute = startMinutes
        
        var endDateComponents = DateComponents()
        endDateComponents.hour = 0
        endDateComponents.minute = endMinutes
        
        let calendar = Calendar.current
        if let startDate = calendar.date(from: startDateComponents),
           let endDate = calendar.date(from: endDateComponents) {
            return (startDate, endDate)
        }
        return nil
    }
}
