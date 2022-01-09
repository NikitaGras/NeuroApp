//
//  PartTwoHistoryPartTwoHistoryPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 04/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//
import ViperMcFlurry

class PartTwoHistoryPresenter: NSObject, PartTwoHistoryModuleInput, PartTwoHistoryViewOutput, PartTwoHistoryInteractorOutput {
    weak var view: PartTwoHistoryViewInput!
    var interactor: PartTwoHistoryInteractorInput!
    var router: PartTwoHistoryRouterInput!
    
    var result: Result!

    func viewIsReady() {
        view.setupInitialState()
    }
}
