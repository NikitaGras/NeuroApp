//
//  QuizPartOneQuizPartOneRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import ViperMcFlurry

class QuizPartOneRouter: QuizPartOneRouterInput {
    var transionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openNextPart() {
        _ = transionHandler.openModule?(usingSegue: "showPreviewPartInfo")
    }
}
