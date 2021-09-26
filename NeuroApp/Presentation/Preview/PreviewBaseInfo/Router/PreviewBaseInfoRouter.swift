//
//  PreviewBaseInfoPreviewBaseInfoRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class PreviewBaseInfoRouter: PreviewBaseInfoRouterInput {
    var transionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func openPreviewPartInfo() {
        _ = transionHandler.openModule?(usingSegue: "showPreviewPartInfo")
    }
}
