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

protocol MenuModuleOutput: class {
}

protocol MenuViewInput: class {
}

protocol MenuViewOutput: class {
}

protocol MenuInteractorInput: class {
}

protocol MenuInteractorOutput: class {
}

protocol MenuRouterInput: class {
}
