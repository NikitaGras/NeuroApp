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
        interactor.initialized()
    }
    
    func update(with quiz: Quiz) {
        view.update(with: quiz)
    }
    
    func update(with user: User) {
        view.update(with: user)
    }
    
    func openQuiz() {
        if interactor.quiz.state == .begin {
            router.openPreviewBaseInfo()
        }
        if interactor.quiz.isProceed {
            router.openPreviewPartInfo()
        }
    }
    
    func openLogin() {
        router.openLogin()
    }
}
