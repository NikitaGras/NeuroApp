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
    
    var user: User? {
        return service.user
    }
    
    // TODO: перенести в сервис
    // Error: naming
    func getUser() throws -> User {
        guard let user = service.user else {
            throw SystemError.noName
        }
        return user
    }
}
