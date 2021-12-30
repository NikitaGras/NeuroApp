//
//  AvarageHistoryAvarageHistoryRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class AvarageHistoryRouter: AvarageHistoryRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func showPartOne(_ result: Result) {
        openModule(usingSegue: "ShowPartOneHistory", result)
    }
    
    func showPartTwo(_ result: Result) {
        
    }
    
    func showPartThree(_ result: Result) {
        
    }
    
    func openModule(usingSegue segue: String, _ result: Result) {
        let promise = transitionHandler.openModule?(usingSegue: segue)
        promise?.thenChain({ moduleInput in
            let input = moduleInput as? PartOneHistoryModuleInput
            input?.result = result
            return nil
        })
    }
}
