//
//  Article.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import Foundation
import SwiftData

struct Article: Identifiable, Codable, Equatable {
    var id: String { url }
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String

    init(
        source: Source, author: String, title: String,
        description: String? = nil, url: String, urlToImage: String,
        publishedAt: String, content: String
    ) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }

    //    {
    //        "source": {
    //            "id": "cbs-news",
    //            "name": "CBS News"
    //        },
    //        "author": "Kendall Little",
    //        "title": "What are today's mortgage and mortgage refinance interest rates?",
    //        "description": "Knowing today's mortgage rates can help new homebuyers and homeowners looking to lock in a good deal.",
    //        "url": "https://www.cbsnews.com/news/what-are-todays-mortgage-and-mortgage-refinance-interest-rates/",
    //        "urlToImage": "https://assets1.cbsnewsstatic.com/hub/i/r/2023/06/15/86afcceb-cd5d-42f1-a29b-e0341f72cbff/thumbnail/1200x630/d720c277e86d8d44aa034b80f29f8f4e/gettyimages-839311524.jpg?v=765ef194a4bf4701e45ec9d5712af42f",
    //        "publishedAt": "2025-03-20T14:45:24+00:00",
    //        "content": "To qualify for the best mortgage rates, make sure your credit is in good standing before you apply.\r\nGetty Images/iStockphoto\r\nIf you're in the market for a new home, or you're thinking about refinan… [+4595 chars]"
    //    },
}

struct Source: Identifiable, Codable, Equatable {
    var id: String?
    var name: String
}

struct NewsApiResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}

extension Article {
    static var previewData: [Article] {

        let fileUrl = Bundle.main.url(
            forResource: "news", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileUrl)

        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .iso8601

        let apiResponse = try! jsonDecoder.decode(
            NewsApiResponse.self, from: jsonData)
        return apiResponse.articles!
    }
}
