//
//  LoginLoginViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol LoginViewOutput {
    func viewIsReady()
    func saveUser(with name: String, _ age: Int, _ email: String)
}
