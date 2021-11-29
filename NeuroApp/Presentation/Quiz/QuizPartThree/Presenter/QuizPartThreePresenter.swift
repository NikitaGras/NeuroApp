//
//  QuizPartThreeQuizPartThreePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartThreePresenter: QuizPartThreeModuleInput, QuizPartThreeViewOutput, QuizPartThreeInteractorOutput {

    weak var view: QuizPartThreeViewInput!
    var interactor: QuizPartThreeInteractorInput!
    var router: QuizPartThreeRouterInput!

    var userText: String = ""
    
    func viewIsReady() {
        view.setupInitialState()
        showQuestion()
    }
    
    func check(userText: String) {
        self.userText = userText
        if userText.count <= 49 {
            let error = ValidationError.custom(String.ValidationError.shortAnswer)
            view.show(error)
        } else {
            interactor.getGunningFoqIndex(for: userText)
        }
    }
    
    func save(with gunningFog: Double) {
        do {
            let answer = PartThreeAnswer(userText: userText, value: gunningFog)
            try interactor.save(answer: answer)
            router.showResultScreen()
        } catch {
            view.show(error)
        }
    }
    
    func denied(with error: Error) {
        view.show(error)
    }
    
    func showQuestion() {
        let question = interactor.getQuestion()
        view.show(question: question)
    }
}
