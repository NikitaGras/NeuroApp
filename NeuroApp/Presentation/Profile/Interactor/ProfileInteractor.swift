//
//  ProfileProfileInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ProfileInteractor: ProfileInteractorInput, ProfileObserver {
    var service: ProfileServiceProtocol!
    weak var output: ProfileInteractorOutput!
    
    // MARK: - ProfileObserver
    func attach() {
        service.attach(self)
    }

    func update(_ user: User?) {
        guard let user = user else {
            return output.denied()
        }
        output.fill(with: user)
    }
}
