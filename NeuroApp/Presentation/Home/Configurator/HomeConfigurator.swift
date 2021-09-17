//
//  HomeHomeConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class HomeModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HomeViewController) {

        let router = HomeRouter()
        router.transitionHandler = viewController

        let presenter = HomePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HomeInteractor()
        interactor.output = presenter
        interactor.QuizService = QuizService.shared
        interactor.ProfileService = ProfileService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
