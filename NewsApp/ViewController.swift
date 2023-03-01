//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import UIKit
// API key = b505953bf7614254a430c1a8bdea8e6a
// url = https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b505953bf7614254a430c1a8bdea8e6a

class ViewController: UIViewController {
    private var apiCaller: APICallerProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        
        apiCaller.getTopStories { result in
            
        }
    }
    
    init(with serviceManager: APICallerProtocol) {
        self.apiCaller = serviceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.apiCaller = APICaller.shared
        super.init(coder: coder)
    }
    

}

