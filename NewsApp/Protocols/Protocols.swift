//
//  Protocols.swift
//  NewsApp
//
//  Created by macbook on 04.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var urlInfo: UrlInfoProtocol { get }
    
    func getTopStories(pagination: Bool, completion: @escaping (Result<[Article], Error>) -> Void)
}

protocol UrlInfoProtocol {
    var currentURL: URL? { get set }
    var pageSize: Int { get set }
    var page: Int { get set }
    var apiKey: String { get set }
    
    func getNextPageURL() -> URL?
}
