//
//  ListModuleInteractor.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//  
//

import Foundation

final class ListModuleInteractor {
	weak var output: ListModuleInteractorOutput?
    
    private var cities: [City] = [
           City(name: "Moscow"),
           City(name: "Paris"),
           City(name: "Novosibirsk"),
           City(name: "New-York")
       ]
}

extension ListModuleInteractor: ListModuleInteractorInput {
    func fetchCities() {
        self.output?.didLoad(cities: self.cities)
    }

    func add(cityName: String) {
        self.cities.append(City(name: cityName))
        self.output?.didLoad(cities: self.cities)
    }
}
