//
//  EditInformationEditInformationViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol EditInformationViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func fill(with user: User)
    func createUser() throws -> User
}
