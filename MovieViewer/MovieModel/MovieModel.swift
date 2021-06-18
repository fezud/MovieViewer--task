//
//  MovieModel.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//

import Foundation


struct MovieResponse: Decodable {
    
    let results: [Movie]
    
}

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
}
