//
//  ProfileProfileRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ProfileRouter: ProfileRouterInput {
    
    
    func openLogin() {
        let router = AppRouter.shared
        router.open(module: .login)
    }
    
    func openEdit() {
        // TODO: переход на экран Edit
        print("переход на экран Edit")
    }
}
