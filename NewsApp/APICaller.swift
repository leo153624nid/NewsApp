//
//  APICaller.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants : ConstantsProtocol { get }
}

protocol ConstantsProtocol {
    var apiKey: String { get }
    var topHeadlinesURL: String { get }
}

final class Constants: ConstantsProtocol {
    let apiKey : String
    let topHeadlinesURL : String
    
    init(apiKey: String) {
        self.apiKey = apiKey
        self.topHeadlinesURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=\(apiKey)"
    }
}

final class APICaller: APICallerProtocol {
    static var shared: APICallerProtocol = APICaller()
    
    lazy var constants: ConstantsProtocol = Constants(apiKey: "b505953bf7614254a430c1a8bdea8e6a")
    
    private init() {}
}
