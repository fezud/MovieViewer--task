//
//  MenuProtocols.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import Foundation

protocol MenuModuleInput {
	var moduleOutput: MenuModuleOutput? { get }
}

protocol MenuModuleOutput: AnyObject {
}

protocol MenuViewInput: AnyObject {
    func reloadData()
}

protocol MenuViewOutput: AnyObject {
    func didLoadView()
    func countItems() -> Int
    func getItemById(id: Int) -> MovieViewModel
    func didPullRefesh()
    func didSelectMovie(at id: Int)
}

protocol MenuInteractorInput: AnyObject {
    func observeItems()
}

protocol MenuInteractorOutput: AnyObject {
    func didLoad(movies: [MovieViewModel])
    func didRecieve(error: Error)
}

protocol MenuRouterInput: AnyObject {
    func showMovie(model: MovieViewModel)
}
