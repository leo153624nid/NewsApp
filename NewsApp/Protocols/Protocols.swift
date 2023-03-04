//
//  Protocols.swift
//  NewsApp
//
//  Created by macbook on 04.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants: ConstantsProtocol { get }
    
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void)
}

protocol ConstantsProtocol {
    var topHeadlinesURL: URL? { get }
}
