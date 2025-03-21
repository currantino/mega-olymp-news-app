//
//  NewsApi.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import Foundation

class NewsApi {
    static var shared = NewsApi()
    private static let apiKey = "f5479cacfe94414ebc077bf2afd07ebe"
    let baseUrl = "https://newsapi.org/v2/top-headlines?apiKey=\(apiKey)"

    func fetchNews(
        category: Category = .General, query: String?,
        completion: @escaping (NewsApiResponse) -> Void
    )
    {
        let url = buildUrl(category: category, query: query)
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                print("bad response code")
                return
            }
            guard let asString = String(data: data!, encoding: .utf8) else {
                print("Could not convert to string")
                return
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            do {
                let apiResponse = try jsonDecoder.decode(
                    NewsApiResponse.self, from: data!)
                DispatchQueue.main.async {
                    completion(apiResponse)
                }
            
            } catch {
                print("decoding error")
                print(error)
                print(error.localizedDescription)
            }

        }.resume()
    }

    func buildUrl(category: Category, query: String?) -> URL {
        var urlString = baseUrl
        urlString += "&category=\(category)"
        if query != nil && !query!.isEmpty {
            urlString += "&q=\(query!)"
        }
        print(urlString)
        return URL(string: urlString)!
    }

}
