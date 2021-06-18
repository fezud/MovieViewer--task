//
//  NetworkManager.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//

import Foundation
import UIKit

protocol NetworkManagerDescription: AnyObject {
    func movies(completion: @escaping (Result<[MovieInfo], Error>) -> Void)
    func image(posterPath: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}


final class NetworkManager: NetworkManagerDescription {
    enum NetworkManagerError: Error {
        case noData
        case incorrectURL
    }
    
    
    static let shared: NetworkManagerDescription = NetworkManager()
    
    private init() {
        
    }
    
    func image(posterPath: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else {
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
            guard let image = UIImage(data: data) else {
                completion(.failure(NetworkManagerError.noData))
                return
            }
            completion(.success(image))
        }.resume()
    }
    
    
    
    func movies(completion: @escaping (Result<[MovieInfo], Error>) -> Void) {
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
                let items = movieInfos.results
                completion(.success(items))
            }
            catch let error {
                completion(.failure(error))
            }
            
            
        }.resume()
        
    }
}
    
