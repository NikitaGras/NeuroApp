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

    var question: PartThreeQuestion {
        return interactor.getQuestion()
    }
    var previousPartQuestionsCount: Int {
        return interactor.getPriviousPartQuestionsNumber()
    }
    var userText: String = ""
    
    func viewIsReady() {
        view.setupInitialState()
        view.show(question: question)
        view.setupProgressBar()
    }

    func save(userText: String) {
        let maxCharNumber = 49
        guard userText.count >= maxCharNumber else {
            view.show(ValidationError.custom(String.ValidationError.shortAnswer))
            view.setupNextButon(isEnabler: true)
            return
        }
        interactor.save(userText: userText)
    }
    
    func denied(with error: Error) {
        view.show(error)
    }
    
    func showResultScreen() {
        view.fillProgressBar()
        router.showResultScreen()
    }
}
