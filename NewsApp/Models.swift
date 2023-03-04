//
//  Models.swift
//  NewsApp
//
//  Created by macbook on 04.03.2023.
//

import Foundation

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

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String?
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String,
         subtitle: String?,
         imageURL: URL?
    ) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}
