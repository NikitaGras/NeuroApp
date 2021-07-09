//
//  LoginLoginViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol LoginViewInput: AnyObject {
    func setupInitialState()
    func show(_ error: Error)
}
