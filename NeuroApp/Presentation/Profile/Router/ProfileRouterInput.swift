//
//  ProfileProfileRouterInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol ProfileRouterInput {
    func openLogin()
    func openEdit(with user: User)
}
