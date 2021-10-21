//
//  QuizPartOneQuizPartOnePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartOnePresenter: QuizPartOneModuleInput, QuizPartOneViewOutput, QuizPartOneInteractorOutput {
    weak var view: QuizPartOneViewInput!
    var interactor: QuizPartOneInteractorInput!
    var router: QuizPartOneRouterInput!
    
    func viewIsReady() {
        view.setupInitialState()
        interactor.initialized()
    }
    
    func save(_ answer: PartOneAnswer) {
        interactor.save(answer)
    }
    
    func show(error: Error) {
        view.show(error)
    }
    
    func show(question: PartOneQuestion) {
        view.show(question)
    }
    
    func openNextPart() {
        router.openNextPart()
    }
    
}
