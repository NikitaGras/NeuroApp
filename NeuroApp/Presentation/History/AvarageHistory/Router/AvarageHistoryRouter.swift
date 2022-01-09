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
        let promise = transitionHandler.openModule?(usingSegue: "ShowPartOneHistory")
        promise?.thenChain({ moduleInput in
            let input = moduleInput as? PartOneHistoryModuleInput
            input?.result = result
            return nil
        })
    }
    
    func showPartTwo(_ result: Result) {
        let promise = transitionHandler.openModule?(usingSegue: "ShowPartTwoHistory")
        promise?.thenChain({ moduleInput in
            let input = moduleInput as? PartTwoHistoryModuleInput
            input?.result = result
            return nil
        })
    }
    
    func showPartThree(_ result: Result) {
        
    }
    
    //TODO: подумать как унифицировать в одну функцию, передавать в качестве параметра тип данных.
    func openModule(usingSegue segue: String, _ result: Result) {

    }
}
