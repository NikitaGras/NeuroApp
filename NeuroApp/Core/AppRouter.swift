//
//  AppRouter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import UIKit

class AppRouter {
    static let shared = AppRouter()
    var window: UIWindow?
    
    private init() {}
    
    func openInitialModule() {
        let isLoggedIn = ProfileService.shared.isLoggedIn
        if isLoggedIn {
            open(module: .tabbar)
        } else {
            open(module: .login)
        }
    }
    
    func open(module: ModuleType) {
        let storyboard = UIStoryboard(name: module.name, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        window?.rootViewController = vc
//        UIView.transition(with: window!, duration: 0.3, options: [.transitionCrossDissolve]) {
//            window?.rootViewController = vc
//        }
    }

}

extension AppRouter {
    enum ModuleType {
        case tabbar
        case login
        case home
        
        var name: String {
            switch self {
            case .login:
                return "Login"
            case .home:
                return "Home"
            case .tabbar:
                return "Tabbar"
            }
        }
    }
}
