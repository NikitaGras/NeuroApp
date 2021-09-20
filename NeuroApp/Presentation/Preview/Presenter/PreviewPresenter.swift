//
//  PreviewPreviewPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewPresenter: PreviewModuleInput, PreviewViewOutput, PreviewInteractorOutput {
    weak var view: PreviewViewInput!
    var interactor: PreviewInteractorInput!
    var router: PreviewRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        interactor.registerObserver()
    }
    
    func update(with quiz: Quiz) {
        if quiz.state == .begin {
            view.showStartScreen(quiz)
        } else if isPartProcced(quiz: quiz) {
            view.showPart(quiz)
        }
    }
    
    func begin() {
        let quiz = interactor.quiz
        if quiz.state == .begin {
            interactor.changeQuiz(with: .partOneProceed)
            router.openPartPreview()
        } else if isPartProcced(quiz: quiz) {
            router.openQuiz()
        }
        
    }
    
    func isPartProcced(quiz: Quiz) -> Bool {
        let state = quiz.state
        if state == .partOneProceed || state == .partTwoProceed || state == .partThreeProceed {
            return true
        } else {
            return false
        }
    }
}
