//
//  NewsNetworkServices.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.09.2024.
//
import Foundation
import OpenAPIClient
import Combine

class NewsNetworkServices {
    func loadNewsPublisher(page: Int, topic: String, year: String) -> Future<ArticleList, Error> {
        return Future { promise in
            ArticlesAPI.everythingGet(
                q: topic,
                from: year,
                sortBy: "publishedAt",
                language: "en",
                apiKey: Constants.newsApiKey,
                page: page
            ) { data, error in
                if let error = error {
                    print("Error fetching news: \(error)")
                    promise(.failure(error))
                } else {
                    if let articles = data {
                        promise(.success(articles))
                        print("Successfully fetched \(String(describing: articles.articles?.count)) articles.")
                    } else {
                        print("No articles found.")
                    }
                }
            }
        }
    }
}
