//
//  PartThreeHistoryPartThreeHistoryConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class PartThreeHistoryModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PartThreeHistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PartThreeHistoryViewController) {
        let router = PartThreeHistoryRouter()

        let presenter = PartThreeHistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PartThreeHistoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }
}
