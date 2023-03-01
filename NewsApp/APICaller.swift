//
//  APICaller.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants : ConstantsProtocol { get }
    
    func getTopStories(completion: @escaping (Result<[String], Error>) -> Void)
}

protocol ConstantsProtocol {
    var topHeadlinesURL: URL? { get }
}

final class Constants: ConstantsProtocol {
    let topHeadlinesURL: URL?
    
    init(apiKey: String) {
        self.topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=\(apiKey)")
    }
}

final class APICaller: APICallerProtocol {
    static let shared: APICallerProtocol = APICaller()
    let constants: ConstantsProtocol = Constants(apiKey: "b505953bf7614254a430c1a8bdea8e6a")
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = constants.topHeadlinesURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: data)
                } catch {
                    completion(.failure(error))
                }
            }
            
            
        }.resume()
    
    }
    
}

// Models

