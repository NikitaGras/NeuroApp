//
//  ExportExportConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class ExportModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? ExportViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ExportViewController) {
        let router = ExportRouter()

        let presenter = ExportPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ExportInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
