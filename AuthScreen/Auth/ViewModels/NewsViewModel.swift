//
//  NewsViewModel.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.09.2024.
//

import Foundation
import OpenAPIClient

class NewsViewModel: ObservableObject {
    @Published var topicsForNews = [ "iOS 18", "Meta", "Russia", "Marvel", "Paris"]
    @Published var articleList: ArticleList?
    @Published var errorMassage: String?
    @Published var isLoading: Bool = false
    @Published var progressValue: CGFloat?
    private let newsService = NewsNetworkServices()
    
    func fetchArticles(targetTopic: String) {
        isLoading = true
        newsService.loadNews(page: 1, topic: targetTopic, year: "2024") { [weak self] articleList, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMassage = error.localizedDescription
                } else if let articleList = articleList {
                    self?.articleList = articleList
                    self?.progressValue = (CGFloat(articleList.articles?.count ?? 1) * 10 / CGFloat(articleList.totalResults ?? 1))
                }
            }
        }
    }
}
