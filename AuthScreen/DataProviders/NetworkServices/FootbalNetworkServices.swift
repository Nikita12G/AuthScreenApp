//
//  FootballNetworkServices.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 05.09.2024.
//

import Foundation

import Combine

class FootballNetworkServices {
    let baseURL = "https://v3.football.api-sports.io"
    
    func fetchTeamStatisticsPublisher(season: Int, teamId: Int, leagueId: Int) -> Future<TeamStatistics, Error> {
        return Future { promise in
            let urlString = "\(self.baseURL)/teams/statistics?season=\(season)&team=\(teamId)&league=\(leagueId)"
            guard let url = URL(string: urlString) else {
                promise(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
            request.addValue(Constants.footballApiKey, forHTTPHeaderField: "x-rapidapi-key")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error during request: \(error)")
                    promise(.failure(error))
                    return
                }
                
                guard let data = data else {
                    print("No data received.")
                    promise(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                    return
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(jsonString)")
                }
                
                do {
                    let teamStatistics = try JSONDecoder().decode(TeamStatistics.self, from: data)
                    print("Decoded TeamStatistics: \(teamStatistics)")
                    promise(.success(teamStatistics))
                } catch let decodingError {
                    print("Decoding error: \(decodingError)")
                    promise(.failure(decodingError))
                }
            }
            
            task.resume()
        }
    }
}
