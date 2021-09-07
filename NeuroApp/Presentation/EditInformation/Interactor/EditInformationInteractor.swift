//
//  EditInformationEditInformationInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class EditInformationInteractor: EditInformationInteractorInput, ProfileObserver {
    weak var output: EditInformationInteractorOutput!
    var service: ProfileServiceProtocol!
    
    func save(user: User) throws {
        try service.save(user)
    }
    
    func attach() {
        service.register(self)
    }
    
    func update(_ user: User?) {
        guard let user = user else {
            output.denied()
            return
        }
        output.fill(with: user)
    }
}
