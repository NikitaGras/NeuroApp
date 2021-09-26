//
//  PreviewBaseInfoPreviewBaseInfoConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class PreviewBaseInfoModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PreviewBaseInfoViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PreviewBaseInfoViewController) {
        let router = PreviewBaseInfoRouter()
        router.transionHandler = viewController

        let presenter = PreviewBaseInfoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PreviewBaseInfoInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
