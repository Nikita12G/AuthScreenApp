//
//  NewsViewModel.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.09.2024.
//

import Foundation
import OpenAPIClient
import Combine

class NewsViewModel: ObservableObject {
    @Published var topicsForNews = [ "iOS 18", "Meta", "Russia", "Tesla", "Paris"]
    @Published var articleList: ArticleList?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var progressValue: CGFloat?
    
    private let newsService = NewsNetworkServices()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchArticles(targetTopic: String) {
        isLoading = true
        errorMessage = nil
        progressValue = nil
        
        newsService.loadNewsPublisher(page: 1, topic: targetTopic, year: "2024")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] articleList in
                self?.articleList = articleList
                let articleCount = CGFloat(articleList.articles?.count ?? 0)
                let totalResults = CGFloat(articleList.totalResults ?? 1)
                self?.progressValue = (articleCount * 10) / totalResults
            })
            .store(in: &cancellables)
    }
}
