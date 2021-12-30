//
//  PartOneHistoryPartOneHistoryPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class PartOneHistoryPresenter: NSObject, PartOneHistoryModuleInput, PartOneHistoryViewOutput, PartOneHistoryInteractorOutput {
    weak var view: PartOneHistoryViewInput!
    var interactor: PartOneHistoryInteractorInput!
    var router: PartOneHistoryRouterInput!
    
    var result: Result!

    func viewIsReady() {
        view.setupInitialState()
    }
}
