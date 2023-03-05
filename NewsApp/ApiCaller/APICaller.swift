//
//  APICaller.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import Foundation

final class UrlInfo: UrlInfoProtocol {
    var currentURL: URL?
    var pageSize = 8
    var page = 1
    var apiKey: String
    
    init(apiKey: String) {
        self.currentURL = URL(string: "https://newsapi.org/v2/everything?q=Apple&pageSize=\(pageSize)&page=\(page)&apiKey=\(apiKey)")
        self.apiKey = apiKey
    }
    
    func getNextPageURL() -> URL? {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&pageSize=\(pageSize)&page=\(page)&apiKey=\(apiKey)") else { return nil }
        self.currentURL = url
        self.page += 1
        return self.currentURL
    }
}

final class APICaller: APICallerProtocol {
    static let shared: APICallerProtocol = APICaller()
    let urlInfo: UrlInfoProtocol = UrlInfo(apiKey: "b505953bf7614254a430c1a8bdea8e6a")
    
    private init() {}
    
    public func getTopStories(pagination: Bool = false,
                              completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = urlInfo.getNextPageURL() else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }                        
}
