//
//  EditInformationEditInformationConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class EditInformationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EditInformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EditInformationViewController) {

        let router = EditInformationRouter()

        let presenter = EditInformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EditInformationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
