//
//  QuizPartThreeQuizPartThreePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class QuizPartThreePresenter: QuizPartThreeModuleInput, QuizPartThreeViewOutput, QuizPartThreeInteractorOutput {
    weak var view: QuizPartThreeViewInput!
    var interactor: QuizPartThreeInteractorInput!
    var router: QuizPartThreeRouterInput!

    var userText: String = ""
    
    func viewIsReady() {
        view.setupInitialState()
        let question = interactor.getQuestion()
        view.show(question: question)
    }

    func save(userText: String) {
        let maxCharNumber = 49
        guard userText.count >= maxCharNumber else {
            return view.show(ValidationError.custom(String.ValidationError.shortAnswer))
        }
        interactor.save(userText: userText)
    }
    
    func denied(with error: Error) {
        view.show(error)
    }
    
    func showResultScreen() {
        router.showResultScreen()
    }
}
