//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by macbook on 01.03.2023.
//

import UIKit

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

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private let newsSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        
    }
}


