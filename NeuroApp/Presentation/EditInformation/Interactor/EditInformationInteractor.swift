//
//  EditInformationEditInformationInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class EditInformationInteractor: EditInformationInteractorInput, Observer {
    weak var output: EditInformationInteractorOutput!
    var service: ProfileServiceProtocol!
    
    func save(user: User) throws {
        try service.save(user)
    }
    
    func registerObserver() {
        service.register(self)
    }
    
    func update(with data: Any) {
        guard let user = data as? User else {
            return output.openLogin()
        }
        output.fill(with: user)
    }
}
