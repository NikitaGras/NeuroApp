//
//  InformationInformationPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

class InformationPresenter: InformationModuleInput, InformationViewOutput, InformationInteractorOutput {
    weak var view: InformationViewInput!
    var interactor: InformationInteractorInput!
    var router: InformationRouterInput!

    func viewIsReady() {

    }
}
