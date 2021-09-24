//
//  PreviewPartInfoPreviewPartInfoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewPartInfoPresenter: PreviewPartInfoModuleInput, PreviewPartInfoViewOutput, PreviewPartInfoInteractorOutput {

    weak var view: PreviewPartInfoViewInput!
    var interactor: PreviewPartInfoInteractorInput!
    var router: PreviewPartInfoRouterInput!

    func viewIsReady() {

    }
}
