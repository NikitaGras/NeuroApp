//
//  LoginLoginInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput!
    let service = DatabaseService.shared

    func save(_ user: User) throws {
        try service.save(user)
    }
}
