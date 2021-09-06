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
    }
    
    func update(with quiz: Quiz) {
        switch quiz.state {
        case .begin:
            view.showStartScreen()
        default:
            view.showPart(quiz)
        }
    }
    
    func begin() {
        switch interactor.quizState {
        case .begin:
            router.openPartPreview()
        default:
            router.openQuiz()
        }
    }
}
