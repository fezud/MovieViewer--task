//
//  MenuProtocols.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import Foundation
import UIKit

protocol MenuModuleInput {
	var moduleOutput: MenuModuleOutput? { get }
}

protocol MenuModuleOutput: class {
}

protocol MenuViewInput: class {
    func reloadData()
}

protocol MenuViewOutput: class {
    func didLoadView()
    func countItems() -> Int
    func getItemById(id: Int) -> MovieViewModel
}

protocol MenuInteractorInput: class {
    func observeItems()
}

protocol MenuInteractorOutput: class {
    func didLoad(movies: [MovieInfo])
    func didRecieve(error: Error)
}

protocol MenuRouterInput: class {
}
