//
//  LoginLoginRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import UIKit

class LoginRouter: LoginRouterInput {

    func openHomeModule() {
        let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        scene?.open(module: .home)
    }
}
