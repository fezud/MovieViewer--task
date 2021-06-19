//
//  File.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//

import Foundation
import UIKit

final class MovieViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let ratingLabel = UILabel()
    private let imageLogoView = UIImageView()
    private let yearLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin
                    .horizontally(12)
                    .vertically(18)
        
        imageLogoView.pin
                        .width(150)
                        .vertically(5)
                        .left(10)
        
        imageLogoView.contentMode = .scaleAspectFit
        
        titleLabel.pin
                    .top(30)
                    .right(10)
                    .width(200)
            .sizeToFit(.width)
        
        ratingLabel.pin
                    .below(of: titleLabel)
                    .right(10)
                    .marginTop(10)
                    .height(20)
                    .sizeToFit(.height)
        yearLabel.pin
                    .bottom(5)
                    .right(10)
                    .height(100)
            .sizeToFit(.height)

    }
    
    private func setup() {
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.textAlignment = .right
        
        ratingLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        yearLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        yearLabel.numberOfLines = 0
        yearLabel.textAlignment = .right
        
        
        
        
        backgroundColor = UIColor.lightGray
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        [titleLabel, ratingLabel, yearLabel, imageLogoView].forEach { contentView.addSubview($0) }
    }
    
    func configure(with model: MovieViewModel) {
        titleLabel.text = "\(model.title)"
        
        ratingLabel.text = "Rating: \(model.voteAverage)/10"
        
        yearLabel.text = "Release date:\n" + model.releaseDate
        
        imageLogoView.image = model.image

        
        
    }
    
    
}
