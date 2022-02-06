//
//  InformationInformationConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class InformationModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? InformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: InformationViewController) {
        let router = InformationRouter()

        let presenter = InformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InformationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
