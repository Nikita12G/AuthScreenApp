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
    @Published var topicsForNews = [ "iOS 18", "Meta", "Russia", "Marvel", "Paris"]
    @Published var articleList: ArticleList?
    @Published var error: Error?
    @Published var isLoading: Bool = false
    @Published var progressValue: CGFloat?
    private let newsService = NewsService()
    
    func fetchArticles(targetTopic: String) {
        isLoading = true
        newsService.loadNews(page: 1, topic: targetTopic, year: "2024") { [weak self] articleList, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.error = error
                } else if let articleList = articleList {
                    self?.articleList = articleList
                    self?.progressValue = (CGFloat(articleList.articles?.count ?? 1) / CGFloat(articleList.totalResults ?? 1)) * 10
                }
            }
        }
    }
}
