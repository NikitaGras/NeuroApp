//
//  QuizPartTwoQuizPartTwoConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartTwoModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? QuizPartTwoViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuizPartTwoViewController) {
        let router = QuizPartTwoRouter()
        router.transitionHandler = viewController

        let presenter = QuizPartTwoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuizPartTwoInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
