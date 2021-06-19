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
}

protocol MenuInteractorInput: AnyObject {
    func observeItems()
}

protocol MenuInteractorOutput: AnyObject {
    func didLoad(movies: [MovieViewModel])
    func didRecieve(error: Error)
}

protocol MenuRouterInput: AnyObject {
}
