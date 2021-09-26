//
//  PreviewPartInfoPreviewPartInfoConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewPartInfoModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PreviewPartInfoViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PreviewPartInfoViewController) {
        let router = PreviewPartInfoRouter()
        router.transitionHandler = viewController

        let presenter = PreviewPartInfoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PreviewPartInfoInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
