//
//  NewsNetworkServices.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.09.2024.
//
import Foundation
import OpenAPIClient

class NewsService {
    func loadNews(page: Int, topic: String, year: String, completion: @escaping (ArticleList?, Error?) -> Void) {
        print("Fetching news with parameters:")
        print("Topic: \(topic)")
        print("Year: \(year)")
        print("Page: \(page)")

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
                completion(nil, error)
            } else {
                if let articles = data?.articles {
                    print("Successfully fetched \(articles.count) articles.")
                } else {
                    print("No articles found.")
                }
                completion(data, nil)
            }
        }
    }
}
