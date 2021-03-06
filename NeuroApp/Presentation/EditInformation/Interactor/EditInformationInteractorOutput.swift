//
//  EditInformationEditInformationInteractorOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol EditInformationInteractorOutput: AnyObject {
    func fill(with user: User)
    func openLogin()
}
