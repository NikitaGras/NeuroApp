//
//  ProfileProfilePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ProfilePresenter: ProfileModuleInput, ProfileViewOutput, ProfileInteractorOutput {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        interactor.registerObserver()
    }
    
    func fill(with user: User) {
        view.fill(with: user)
    }
    
    func eraseUser() {
        view.showWarning { _ in
            self.router.openLogin()
        }
    }
    
    func edit() {
        router.openEdit()
    }
}
