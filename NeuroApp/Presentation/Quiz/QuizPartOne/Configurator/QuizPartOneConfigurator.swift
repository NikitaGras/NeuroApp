//
//  QuizPartOneQuizPartOneConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartOneModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? QuizPartOneViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuizPartOneViewController) {

        let router = QuizPartOneRouter()

        let presenter = QuizPartOnePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuizPartOneInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
