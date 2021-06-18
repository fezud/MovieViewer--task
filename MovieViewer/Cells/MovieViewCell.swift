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
                        .width(100)
                        .vertically(10)
                        .left(10)
                        .vCenter()
        imageLogoView.contentMode = .scaleAspectFit
        
        titleLabel.pin
                    .top(40)
                    .right(5)
                    .height(20)
                    .sizeToFit(.height)
        ratingLabel.pin
                    .below(of: titleLabel)
                    .right(5)
                    .marginTop(2)
                    .height(20)
                    .sizeToFit(.height)
        yearLabel.pin
                    .bottom(10)
                    .right(5)
                    .height(20)
                    .sizeToFit(.height)
    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "NotoSansOriya-Bold", size: 20)
        ratingLabel.font = UIFont(name: "NotoSansOriya", size: 20)
        yearLabel.font = UIFont(name: "NotoSansOriya", size: 20)
        imageLogoView.image = UIImage(systemName: "doc.circle.fill")
        imageLogoView.tintColor = .blue
        
        
        backgroundColor = UIColor.white
        
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
        yearLabel.text = "Released on: " + model.releaseDate
        
        
    }
    
    
}
