//
//  ProfileProfileRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class ProfileRouter: ProfileRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openLogin() {
        let router = AppRouter.shared
        router.open(module: .login)
    }
    
    func openEdit() {
        transitionHandler.openModule?(usingSegue: "editInformation")
    }
}
