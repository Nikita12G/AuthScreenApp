//
//  NewsViewModel.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.09.2024.
//

import SwiftUI
import Combine
import OpenAPIClient

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var error: Error?
    @Published var isLoading: Bool = false
    @Published var currentMonthData: [NewsOfDay] = []
    @Published var previousMonthData: [NewsOfDay] = []
    @Published var articleDifference: Int = 0

    private let newsService = NewsService()

    func fetchArticles(page: Int, topic: String, year: String) {
        isLoading = true
        newsService.loadNews(page: page, topic: topic, year: year) { [weak self] articles, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.error = error
                } else if let articles = articles {
                    self?.articles = articles
                    self?.calculateStatistics(from: articles)
                }
            }
        }
    }

    private func calculateStatistics(from articles: [Article]) {
        var currentMonthStats: [Date: Int] = [:]
        var previousMonthStats: [Date: Int] = [:]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentYear = calendar.component(.year, from: currentDate)
        
        var previousMonth = currentMonth - 1
        var previousMonthYear = currentYear
        
        if previousMonth == 0 {
            previousMonth = 12
            previousMonthYear -= 1
        }

        for article in articles {
            if let dateString = article.publishedAt, let date = dateFormatter.date(from: dateString) {
                let articleMonth = calendar.component(.month, from: date)
                let articleYear = calendar.component(.year, from: date)
                
                if articleMonth == currentMonth && articleYear == currentYear {
                    currentMonthStats[date, default: 0] += 1
                } else if articleMonth == previousMonth && articleYear == previousMonthYear {
                    previousMonthStats[date, default: 0] += 1
                }
            }
        }

        self.currentMonthData = currentMonthStats.map { NewsOfDay(date: $0.key, sailValue: $0.value) }
        self.previousMonthData = previousMonthStats.map { NewsOfDay(date: $0.key, sailValue: $0.value) }
        
        self.currentMonthData.sort { $0.date < $1.date }
        self.previousMonthData.sort { $0.date < $1.date }
        
        let currentMonthTotal = self.currentMonthData.reduce(0) { $0 + $1.sailValue }
        let previousMonthTotal = self.previousMonthData.reduce(0) { $0 + $1.sailValue }
        self.articleDifference = currentMonthTotal - previousMonthTotal
    }
}
