//
//  AvarageHistoryAvarageHistoryPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class AvarageHistoryPresenter: AvarageHistoryModuleInput, AvarageHistoryViewOutput, AvarageHistoryInteractorOutput {
    weak var view: AvarageHistoryViewInput!
    var interactor: AvarageHistoryInteractorInput!
    var router: AvarageHistoryRouterInput!

    func viewIsReady() {

    }
}
