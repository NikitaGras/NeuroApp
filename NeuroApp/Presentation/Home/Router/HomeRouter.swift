//
//  HomeHomeRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class HomeRouter: HomeRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func beginQuiz() {
        let _ = transitionHandler.openModule?(usingSegue: "beginQuiz")
    }
    
    func openLogin() {
        let router = AppRouter.shared
        router.open(module: .login)
    }
}
