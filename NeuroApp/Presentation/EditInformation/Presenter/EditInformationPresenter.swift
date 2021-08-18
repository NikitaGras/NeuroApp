//
//  EditInformationEditInformationPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class EditInformationPresenter: NSObject, EditInformationModuleInput, EditInformationViewOutput, EditInformationInteractorOutput {

    weak var view: EditInformationViewInput!
    var interactor: EditInformationInteractorInput!
    var router: EditInformationRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        loadUser()
    }
    
    //TODO: naming
    func loadUser() {
        do {
            let user = try interactor.getUser()
            view.fill(with: user)
        } catch {
            view.show(error) { _ in
                self.router.openLogin()
            }
        }
    }
}
