//
//  ListModuleContainer.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//  
//

import UIKit

final class ListModuleContainer {
    let input: ListModuleModuleInput
	let viewController: UIViewController
	private(set) weak var router: ListModuleRouterInput!

	static func assemble(with context: ListModuleContext) -> ListModuleContainer {
        let router = ListModuleRouter()
        let interactor = ListModuleInteractor()
        let presenter = ListModulePresenter(router: router, interactor: interactor)
		let viewController = ListModuleViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        router.viewController = viewController
        
        return ListModuleContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ListModuleModuleInput, router: ListModuleRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ListModuleContext {
	weak var moduleOutput: ListModuleModuleOutput?
}
