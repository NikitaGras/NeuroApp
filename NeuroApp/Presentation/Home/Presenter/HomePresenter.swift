//
//  HomeHomePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
    var state: QuestionnaireState = .begin {
        didSet {
            view.updateQuestionnaireButton(with: state)
        }
    }
    
    var status: UserStatus = .none {
        didSet {
            view.updateStatus(with: status)
        }
    }

    func viewIsReady() {
        view.setupInitialState()
        state = interactor.getState()
        status = interactor.getStatus()
    }
    
    func openQuestionanaire() {
        router.openQuestionnaire()
    }
}
