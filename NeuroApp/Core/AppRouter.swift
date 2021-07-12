//
//  AppRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import UIKit

class AppRouter {
    
    private func openInitialModule() {
        let isLoggedIn = ProfileService.shared.isLoggedIn
        if isLoggedIn {
            open(module: .home)
        } else {
            open(module: .login)
        }
    }
    
    func open(module: ModuleType) {
        let storyboard = UIStoryboard(name: module.name, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        window?.rootViewController = vc
    }

}

extension AppRouter {
    enum ModuleType {
        case login
        case home
        
        var name: String {
            switch self {
            case .login:
                return "Login"
            case .home:
                return "Home"
            }
        }
    }
}
