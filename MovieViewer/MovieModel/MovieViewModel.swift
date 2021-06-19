//
//  MovieModel.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//

import Foundation
import UIKit

struct MovieViewModel {
    
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let releaseDate: String
    let image: UIImage

    
}

struct MovieInfos: Codable {
    let results: [MovieInfo]
}

struct MovieInfo: Codable {
    var movieId: Int
    var title: String
    var profilImage: String
    var releaseDate: String
    var vote_average: Double
    var vote_count: Int
    var overview: String

    enum keys: String , CodingKey {
        case movieId = "id"
        case title
        case profilImage = "poster_path"
        case releaseDate = "release_date"
        case vote_average
        case vote_count
        case overview
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: keys.self)

        self.movieId = try valueContainer.decode(Int.self, forKey: keys.movieId)
        self.title = try valueContainer.decode(String.self, forKey: keys.title)
        self.profilImage = try valueContainer.decode(String.self, forKey: keys.profilImage)
        self.releaseDate = try valueContainer.decode(String.self, forKey: keys.releaseDate)
        self.vote_average = try valueContainer.decode(Double.self, forKey: keys.vote_average)
        self.vote_count = try valueContainer.decode(Int.self, forKey: keys.vote_count)
        self.overview = try valueContainer.decode(String.self, forKey: keys.overview)
    }



}

