//
//  HomeHomeViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol HomeViewInput: AnyObject {
    func setupInitialState()
    func update(with quiz: Quiz)
    func update(with user: User)
}
