//
//  ScoreScreenScoreScreenPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ScoreScreenPresenter: ScoreScreenModuleInput, ScoreScreenViewOutput, ScoreScreenInteractorOutput {
    weak var view: ScoreScreenViewInput!
    var interactor: ScoreScreenInteractorInput!
    var router: ScoreScreenRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        getResult()
    }
    
    func getResult() {
        do {
            let result = try interactor.getResult()
            view.setup(with: result)
        } catch {
            view.show(error)
        }
    }
    
    func goHome() {
        router.goHome()
    }
}
