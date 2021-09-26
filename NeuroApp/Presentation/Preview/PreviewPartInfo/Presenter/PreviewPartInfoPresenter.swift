//
//  PreviewPartInfoPreviewPartInfoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewPartInfoPresenter: PreviewPartInfoModuleInput, PreviewPartInfoViewOutput, PreviewPartInfoInteractorOutput {

    weak var view: PreviewPartInfoViewInput!
    var interactor: PreviewPartInfoInteractorInput!
    var router: PreviewPartInfoRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        let state = interactor.getQuizState()
        view.update(with: state)
    }
    
    func next() {
        let state = interactor.getQuizState()
        if state == .partOneProceed {
            router.openPartOneQuiz()
        } else if state == .partTwoProceed {
            router.openPartTwoQuiz()
        } else if state == .partThreeProceed {
            router.openPartThreeQuiz()
        }
    }
}
