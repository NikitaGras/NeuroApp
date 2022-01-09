//
//  PartTwoHistoryPartTwoHistoryConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartTwoHistoryModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PartTwoHistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartTwoHistoryViewController) {
        let router = PartTwoHistoryRouter()

        let presenter = PartTwoHistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartTwoHistoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }
}
