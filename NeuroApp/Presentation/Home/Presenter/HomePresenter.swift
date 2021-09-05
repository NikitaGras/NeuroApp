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

    func viewIsReady() {
        view.setupInitialState()
        interactor.registerObserver()
    }
    
    func update(with quiz: Quiz) {
        view.update(with: quiz)
    }
    
    func openQuiz() {
        interactor.quizState == .begin ? router.beginQuestionnaire() : router.progressQuestionaire()
    }
}
