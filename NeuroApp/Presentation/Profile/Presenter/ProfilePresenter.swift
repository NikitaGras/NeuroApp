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

    }
    
    func getUser() -> User {
        return User(with: "", 0, and: "")
    }
    
    func erase() {
        
    }
    
    func edit() {
        
    }
}
