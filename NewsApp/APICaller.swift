//
//  APICaller.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var s : Int { get set }
}

final class APICaller: APICallerProtocol {
    static var shared: APICallerProtocol = APICaller()
    
    var s = 10
    
    private init() {}
}
