//
//  LoginLoginInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {
    weak var output: LoginInteractorOutput!
    var service: ProfileServiceProtocol!

    func save(_ user: User) throws {
        try service.save(user)
    }
}
