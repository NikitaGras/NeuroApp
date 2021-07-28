//
//  EditInformationEditInformationPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class EditInformationPresenter: NSObject, EditInformationModuleInput, EditInformationViewOutput, EditInformationInteractorOutput {
    
    var user: User!
    

    weak var view: EditInformationViewInput!
    var interactor: EditInformationInteractorInput!
    var router: EditInformationRouterInput!

    func viewIsReady() {

    }
}
