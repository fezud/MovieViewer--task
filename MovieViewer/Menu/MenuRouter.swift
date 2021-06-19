//
//  MenuRouter.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import UIKit

final class MenuRouter {
    weak var sourceViewController: UIViewController?
    
}

extension MenuRouter: MenuRouterInput {
    func showMovie(model: MovieViewModel) {
        let viewController = MovieInfoScreen(with: model)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        sourceViewController?.present(navigationController, animated: true, completion: nil)
    }
    
}
