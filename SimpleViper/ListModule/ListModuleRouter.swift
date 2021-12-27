//
//  ListModuleRouter.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//  
//

import UIKit

final class ListModuleRouter {
    var viewController: UIViewController?
}

extension ListModuleRouter: ListModuleRouterInput {
    func showAddCity(completion: @escaping (String) -> Void) {
           let alertController = UIAlertController(title: "Add city", message: nil, preferredStyle: .alert)
           alertController.addTextField()
           alertController.addAction(UIAlertAction(title: "Add", style: .default) { action in
               guard let text = alertController.textFields?.first?.text else {
                   fatalError("something wrong")
               }
               completion(text)
           })

           viewController?.present(alertController, animated: true)
       }
}
