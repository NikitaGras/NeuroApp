//
//  PreviewPreviewConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PreviewViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PreviewViewController) {
        let router = PreviewRouter()

        let presenter = PreviewPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PreviewInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
