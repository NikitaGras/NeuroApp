//
//  HistoryMainHistoryMainPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HistoryMainPresenter: HistoryMainModuleInput, HistoryMainViewOutput, HistoryMainInteractorOutput {

    weak var view: HistoryMainViewInput!
    var interactor: HistoryMainInteractorInput!
    var router: HistoryMainRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        interactor.initialized()
    }
    
    func update(with history: [Session]) {
        history.isEmpty ? view.showEmptyHistory() : view.setup(with: history)
    }
    
    func show(result: Session) {
        router.openHistoryAverage(with: result)
    }
}
