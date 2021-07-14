//
//  ProfileProfileViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol ProfileViewInput: AnyObject {
    func setupInitialState()
    func update(_ user: User)
}
