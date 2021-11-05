//
//  QuizPartThreeQuizPartThreeConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class QuizPartThreeModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? QuizPartThreeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuizPartThreeViewController) {
        let router = QuizPartThreeRouter()
        router.transitionHandler = viewController

        let presenter = QuizPartThreePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuizPartThreeInteractor()
        interactor.output = presenter
        interactor.quizService = QuizService.shared
        interactor.ganningFogService = GanningFogService()

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
