//
//  ScoreScreenScoreScreenRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import ViperMcFlurry

class ScoreScreenRouter: ScoreScreenRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    var viewController: UIViewController!
    
    func goHome() {
        _ = transitionHandler.openModule?(usingSegue: "ShowHomeViewController")
    }
}
