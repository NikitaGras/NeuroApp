//
//  QuizPartTwoQuizPartTwoRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class QuizPartTwoRouter: QuizPartTwoRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openNextPart() {
        _ = transitionHandler.openModule?(usingSegue: "ShowPreviewViewController")
    }
}
