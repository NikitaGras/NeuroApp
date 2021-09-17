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
        interactor.registerObserver()
    }
    
    func safeUser() {
        do {
            let user = try view.createUser()
            try interactor.save(user: user)
            router.goBack()
        } catch {
            view.show(error)
        }
    }
    
    func fill(with user: User) {
        view.fill(with: user)
    }
    
    func openLogin() {
        router.openLogin()
    }
}
