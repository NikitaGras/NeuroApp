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
    
    var user: User!

    func viewIsReady() {
        view.setupInitialState()
        do {
            user = try interactor.getUser()
            view.update(user)
        } catch {
            view.show(error) { _ in
                self.router.openLogin()
            }
            
        }
    }
    
    func erase() {
        router.openLogin()
    }
    
    func edit() {
        router.openEdit(with: user)
    }
}
