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
        fill()
    }
    
    func fill() {
        do {
            let user = try interactor.getUser()
            view.fill(with: user)
        } catch {
            erase()
        }
    }
    
    func erase() {
        router.openLogin()
    }
    
    func edit() {
        router.openEdit()
    }
}
