//
//  ListModuleProtocols.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//  
//

import Foundation

protocol ListModuleModuleInput {
	var moduleOutput: ListModuleModuleOutput? { get }
}

protocol ListModuleModuleOutput: AnyObject {
}

protocol ListModuleViewInput: AnyObject {
    func set(viewModels: [CityViewModel])
}

protocol ListModuleViewOutput: AnyObject {
    func viewDidLoad()
    func didTapAddCityButton()
}

protocol ListModuleInteractorInput: AnyObject {
    func fetchCities()
    func add(cityName: String)
}

protocol ListModuleInteractorOutput: AnyObject {
    func didLoad(cities: [City])
}

protocol ListModuleRouterInput: AnyObject {
    func showAddCity(completion: @escaping (String) -> Void)
}
