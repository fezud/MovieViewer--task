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

}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func didSelectMovie(at id: Int) {
        router.showMovie(model: items[id])
    }
    

    
    func didPullRefesh() {
        interactor.observeItems()
    }
    
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

    
    func didLoad(movies: [MovieViewModel]) {
        self.items = movies
        self.view?.reloadData()
    }
    
    func didRecieve(error: Error) {
        debugPrint("Received an error")
    }
    
}
