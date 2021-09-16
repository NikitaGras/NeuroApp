//
//  LoginLoginPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func saveUser(with name: String, _ age: Int, _ email: String) {
        do {
            let user = try User(with: name, age, email)
            try interactor.save(user)
            router.openHomeModule()
        } catch {
            view.show(error)
        }
    }
}

