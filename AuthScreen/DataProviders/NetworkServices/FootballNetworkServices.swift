//
//  FootballNetworkServices.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 05.09.2024.
//

import Foundation

import Foundation

class FootballNetworkServices {
    let apiKey = "0742e7b700b52b24b496c8f2d88db235"
    let baseURL = "https://v3.football.api-sports.io"

    func fetchTeamStatistics(season: Int, teamId: Int, leagueId: Int, completion: @escaping (Result<TeamStatistics, Error>) -> Void) {
        let urlString = "\(baseURL)/teams/statistics?season=\(season)&team=\(teamId)&league=\(leagueId)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error during request: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received.")
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            // Логирование полученных данных
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON: \(jsonString)")
            }
            
            do {
                let teamStatistics = try JSONDecoder().decode(TeamStatistics.self, from: data)
                print("Decoded TeamStatistics: \(teamStatistics)")
                completion(.success(teamStatistics))
            } catch let decodingError {
                // Логирование ошибки декодирования
                print("Decoding error: \(decodingError)")
                completion(.failure(decodingError))
            }
        }

        task.resume()
    }
}


struct TeamStatistics: Codable {
    let league: League?
    let team: Team?
    let form: String?
    let fixtures: Fixtures?
    let goals: Goals?
    let biggest: Biggest?
    let cleanSheet: CleanSheet?
    let failedToScore: FailedToScore?
    let penalty: Penalty?
    let lineups: [Lineup]?
    let cards: Cards?
}

struct League: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct Fixtures: Codable {
    let played, wins, draws, loses: FixtureStat
}

struct FixtureStat: Codable {
    let home, away, total: Int
}

struct Goals: Codable {
    let `for`, against: GoalStat
}

struct GoalStat: Codable {
    let total: GoalTotal
    let average: GoalAverage
}

struct GoalTotal: Codable {
    let home, away, total: Int
}

struct GoalAverage: Codable {
    let home, away, total: String
}

struct Biggest: Codable {
    let streak: Streak
    let wins, loses: HomeAwayScore
    let goals: BiggestGoals
}

struct Streak: Codable {
    let wins, draws, loses: Int
}

struct HomeAwayScore: Codable {
    let home, away: String
}

struct BiggestGoals: Codable {
    let `for`, against: HomeAwayGoals
}

struct HomeAwayGoals: Codable {
    let home, away: Int
}

struct CleanSheet: Codable {
    let home, away, total: Int
}

struct FailedToScore: Codable {
    let home, away, total: Int
}

struct Penalty: Codable {
    let scored, missed: PenaltyStat
    let total: Int
}

struct PenaltyStat: Codable {
    let total: Int
    let percentage: String
}

struct Lineup: Codable {
    let formation: String
    let played: Int
}

struct Cards: Codable {
    let yellow, red: CardStat
}

struct CardStat: Codable {
    let minute_0_15, minute_16_30, minute_31_45, minute_46_60, minute_61_75, minute_76_90: CardDetail
}

struct CardDetail: Codable {
    let total: Int?
    let percentage: String?
}
