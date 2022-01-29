//
//  PartThreeHistoryPartThreeHistoryPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 10/01/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//
import Foundation

class PartThreeHistoryPresenter: NSObject, PartThreeHistoryModuleInput, PartThreeHistoryViewOutput, PartThreeHistoryInteractorOutput {
    weak var view: PartThreeHistoryViewInput!
    var interactor: PartThreeHistoryInteractorInput!
    var router: PartThreeHistoryRouterInput!
    
    var result: Session!

    func viewIsReady() {
        view.setupInitialState()
    }
}
