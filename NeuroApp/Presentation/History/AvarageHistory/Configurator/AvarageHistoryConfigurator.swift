//
//  AvarageHistoryAvarageHistoryConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class AvarageHistoryModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AvarageHistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AvarageHistoryViewController) {
        let router = AvarageHistoryRouter()

        let presenter = AvarageHistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AvarageHistoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
