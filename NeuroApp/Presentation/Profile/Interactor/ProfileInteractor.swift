//
//  ProfileProfileInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ProfileInteractor: ProfileInteractorInput, Observer {
    var service: ProfileServiceProtocol!
    weak var output: ProfileInteractorOutput!
    
    // MARK: - ProfileObserver
    func registerObserver() {
        service.register(self)
    }

    func update(with data: Any) {
        guard let user = data as? User else {
            return output.eraseUser()
        }
        output.fill(with: user)
    }
}
