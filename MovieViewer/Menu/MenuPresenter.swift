//
//  MenuPresenter.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import Foundation
import UIKit

final class MenuPresenter {
	weak var view: MenuViewInput?
    weak var moduleOutput: MenuModuleOutput?

	private let router: MenuRouterInput
	private let interactor: MenuInteractorInput
    
    var items: [MovieViewModel] = []

    init(router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    private func viewModel(from model: MovieInfo) -> MovieViewModel {
        return MovieViewModel(id: model.movieId,
                              title: model.title,
                              posterPath: model.profilImage,
                              overview: model.overview,
                              voteAverage: model.vote_average,
                              voteCount: model.vote_count,
                              releaseDate: model.releaseDate)
    }
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func getItemById(id: Int) -> MovieViewModel {
        return items[id]
    }
    
    func countItems() -> Int {
        return items.count
    }
    
    func didLoadView() {
        interactor.observeItems()
    }
    
}

extension MenuPresenter: MenuInteractorOutput {

    
    func didLoad(movies: [MovieInfo]) {
        self.items = movies.map{ viewModel(from: $0) }
        
        self.view?.reloadData()
    }
    
    func didRecieve(error: Error) {
        debugPrint("Received an error")
    }
    
}
