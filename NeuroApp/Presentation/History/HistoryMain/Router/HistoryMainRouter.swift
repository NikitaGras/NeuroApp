//
//  HistoryMainHistoryMainRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class HistoryMainRouter: HistoryMainRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openHistoryAverage(with result: Result) {
        let promise = transitionHandler.openModule?(usingSegue: "openAvarage")
        promise?.thenChain({ moduleInput in
            let input = moduleInput as? AvarageHistoryModuleInput
            input?.result = result
            return nil
        })
    }
}
