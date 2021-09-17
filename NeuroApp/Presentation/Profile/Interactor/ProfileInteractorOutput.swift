//
//  ProfileProfileInteractorOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol ProfileInteractorOutput: AnyObject {
    func fill(with user: User)
    func eraseUser()
}
