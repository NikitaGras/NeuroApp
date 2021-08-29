//
//  EditInformationEditInformationRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import ViperMcFlurry

class EditInformationRouter: EditInformationRouterInput {
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openLogin() {
        let router = AppRouter.shared
        router.open(module: .login)
    }
    
    func goBack() {
        // TODO: popViewController
        transitionHandler.closeCurrentModule?(true)
    }
}
