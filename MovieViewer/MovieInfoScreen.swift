//
//  MovieScreen.swift
//  MovieViewer
//
//  Created by Fred Fred on 19.06.2021.
//

import Foundation
import UIKit

final class MovieInfoScreen: UIViewController {
    
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let ratingLabel = UILabel()
    private let voteCountLabel = UILabel()
    private let releaseDateLabel = UILabel()
    
    
    init(with model: MovieViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        imageView.image = model.image
        titleLabel.text = model.title
        overviewLabel.text = model.overview
        ratingLabel.text = "Rating: \(model.voteAverage)/10"
        voteCountLabel.text = "Votes: \(model.voteCount)"
        releaseDateLabel.text = "Release date: \(model.releaseDate)"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

        titleLabel.pin
                    .top()
                    .marginTop(20)
                    .hCenter()
                    .width(300)
                    .sizeToFit(.width)
        
        imageView.pin
                    .below(of: titleLabel, aligned: .center)
                    .marginTop(20)
                    .height(500)
                    .sizeToFit(.height)
        imageView.contentMode = .scaleAspectFit
        
        ratingLabel.pin
                    .below(of: imageView)
                    .marginTop(10)
                    .left(40)
                    .height(20)
                    .sizeToFit(.height)
        
        voteCountLabel.pin
                    .after(of: ratingLabel, aligned: .bottom)
                    .marginLeft(20)
                    .height(20)
                    .sizeToFit(.height)
        
        releaseDateLabel.pin
                    .below(of: ratingLabel, aligned: .left)
                    .marginTop(10)
                    .height(20)
                    .sizeToFit(.height)
        
        overviewLabel.pin
                    .below(of: releaseDateLabel)
                    .marginTop(10)
                    .horizontally(40)
                    .sizeToFit(.width)
    }
    
    private func setup() {
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        titleLabel.numberOfLines = 3
        
        ratingLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        voteCountLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        releaseDateLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            
        overviewLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        overviewLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        overviewLabel.numberOfLines = 0
        
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        
        view.addSubview(scrollView)
        
        [imageView,
         titleLabel,
         overviewLabel,
         ratingLabel,
         voteCountLabel,
         releaseDateLabel].forEach { scrollView.addSubview($0) }
    }
}
