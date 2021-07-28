//
//  EditInformationEditInformationModuleInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

protocol EditInformationModuleInput: NSObject, RamblerViperModuleInput {
    var user: User! { get set }
}
