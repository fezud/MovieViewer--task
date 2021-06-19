//
//  NetworkManager.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//

import Foundation
import UIKit

protocol NetworkManagerDescription: AnyObject {
    func movies(completion: @escaping (Result<[MovieViewModel], Error>) -> Void)
}


final class NetworkManager: NetworkManagerDescription {
    enum NetworkManagerError: Error {
        case noData
        case incorrectURL
    }
    
    
    static let shared: NetworkManagerDescription = NetworkManager()
    
    private init() {
        
    }


    func movies(completion: @escaping (Result<[MovieViewModel], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=996f6dffc52a2180d2fb1e5be9bea242") else {
            completion(.failure(NetworkManagerError.incorrectURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkManagerError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let movieInfos = try decoder.decode(MovieInfos.self, from: data)
                let items = MovieConverter.moviesWithImages(from: movieInfos.results) { (result) in
                    switch result {
                    case .success(let items):
                        completion(.success(items))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                    
            }
            catch let error {
                completion(.failure(error))
            }
            
            
        }.resume()
        
    }
}
    
final class MovieConverter {
    enum NetworkManagerError: Error {
        case noData
        case incorrectURL
        case imageCorrupted
    }
    
    static func moviesWithImages(from documents: [MovieInfo], completion: @escaping (Result<[MovieViewModel],Error>) -> Void) {
        var movies: [MovieViewModel] = []
        //DispatchQueue.main.sync {
            for document in documents {
                guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(document.profilImage)")
                    else {
                    completion(.failure(NetworkManagerError.incorrectURL))
                    return
                    }
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    movies.append(MovieViewModel(id: document.movieId,
                                                 title: document.title,
                                                 posterPath: document.profilImage,
                                                 overview: document.overview,
                                                 voteAverage: document.vote_average,
                                                 voteCount: document.vote_count,
                                                 releaseDate: document.releaseDate,
                                                 image: image!))
                }
                catch let error {
                    debugPrint("\(document.title)")
                }
            }
        completion(.success(movies))

}
}
