//
//  MenuInteractor.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import Foundation
import UIKit

final class MenuInteractor {
	weak var output: MenuInteractorOutput?
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
}

extension MenuInteractor: MenuInteractorInput {
    func observeItems() {
        networkManager.movies { [weak self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let movies):
                self?.output?.didLoad(movies: movies)
            case .failure(let error):
                self?.output?.didRecieve(error: error)
            }
            }
        }
    }
    
    
}
