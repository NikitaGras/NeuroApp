//
//  ScoreScreenScoreScreenConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ScoreScreenModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? ScoreScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ScoreScreenViewController) {
        let router = ScoreScreenRouter()
        router.transitionHandler = viewController

        let presenter = ScoreScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ScoreScreenInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
