//
//  PreviewPartInfoPreviewPartInfoRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class PreviewPartInfoRouter: PreviewPartInfoRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPartOneQuiz() {
        _ = transitionHandler.openModule?(usingSegue: "showPartOneQuiz")
    }
    
    func openPartTwoQuiz() {
        _ = transitionHandler.openModule?(usingSegue: "showPartTwoQuiz")
    }
    
    func openPartThreeQuiz() {
        
    }
}
