//
//  APICaller.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants : ConstantsProtocol { get }
    
    func getTopStories(completion: @escaping (Result<[Article ], Error>) -> Void)
}

protocol ConstantsProtocol {
    var topHeadlinesURL: URL? { get }
}

final class Constants: ConstantsProtocol {
    let topHeadlinesURL: URL?
    
    init(apiKey: String) {
        self.topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(apiKey)")
    }
}

final class APICaller: APICallerProtocol {
    static let shared: APICallerProtocol = APICaller()
    let constants: ConstantsProtocol = Constants(apiKey: "b505953bf7614254a430c1a8bdea8e6a")
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = constants.topHeadlinesURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    print(result.articles.count)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
            
            
        }.resume()
    
    }
    
}

// Models

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
