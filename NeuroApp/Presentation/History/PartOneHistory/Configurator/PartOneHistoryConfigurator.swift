//
//  PartOneHistoryPartOneHistoryConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PartOneHistoryModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PartOneHistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartOneHistoryViewController) {
        let router = PartOneHistoryRouter()

        let presenter = PartOneHistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartOneHistoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }
}
