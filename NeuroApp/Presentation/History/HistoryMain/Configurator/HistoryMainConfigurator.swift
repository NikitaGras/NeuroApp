//
//  HistoryMainHistoryMainConfigurator.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class HistoryMainModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HistoryMainViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HistoryMainViewController) {
        let router = HistoryMainRouter()
        router.tarnsitionHandler = viewController

        let presenter = HistoryMainPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HistoryMainInteractor()
        interactor.output = presenter
        interactor.service = QuizService.shared

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
