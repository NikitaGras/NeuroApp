//
//  EditInformationEditInformationInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol EditInformationInteractorInput {
    func registerObserver()
    func save(user: User) throws
}
