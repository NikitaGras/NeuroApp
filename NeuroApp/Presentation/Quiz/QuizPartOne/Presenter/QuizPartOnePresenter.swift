//
//  QuizPartOneQuizPartOnePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartOnePresenter: QuizPartOneModuleInput, QuizPartOneViewOutput, QuizPartOneInteractorOutput {

    weak var view: QuizPartOneViewInput!
    var interactor: QuizPartOneInteractorInput!
    var router: QuizPartOneRouterInput!

    func viewIsReady() {

    }
}
