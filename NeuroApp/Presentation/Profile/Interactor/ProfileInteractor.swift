//
//  ProfileProfileInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ProfileInteractor: ProfileInteractorInput {
    var service: ProfileService!
    weak var output: ProfileInteractorOutput!

    func getUser() -> User {
        // TODO:
        return User(name: "", age: 0, email: "")
    }
}
