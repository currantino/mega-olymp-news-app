//
//  ArticleViewModel.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import Foundation

class ArticleViewModel: ObservableObject {

    static var shared = ArticleViewModel()

    private let newsApi = NewsApi.shared

    @Published var articles: [Article] = []

    func loadArticles(category: Category = .General, query: String?) {
        Task.init {
            newsApi.fetchNews(
                category: category, query: query,
                completion: { apiResponse in
                    self.articles = apiResponse.articles ?? []
                })
            print("fetching news ")
        }
    }

}
