//
//  PreviewBaseInfoPreviewBaseInfoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewBaseInfoPresenter: PreviewBaseInfoModuleInput, PreviewBaseInfoViewOutput, PreviewBaseInfoInteractorOutput {

    weak var view: PreviewBaseInfoViewInput!
    var interactor: PreviewBaseInfoInteractorInput!
    var router: PreviewBaseInfoRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        let state = interactor.getQuizState()
        view.update(with: state)
    }
    
    func next() {
        interactor.changeQuizStateToProceed()
        router.openPreviewPartInfo()
    }
}
