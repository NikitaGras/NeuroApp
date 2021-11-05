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

    func viewIsReady() {
        view.setupInitialState()
        showQuestion()
    }
    
    func save(userText: String) {
        do {
            let ganningFoqIndex = try interactor.getGunningFoqIndex(for: userText)
            let answer = PartThreeAnswer(userText: userText, value: ganningFoqIndex)
            try interactor.save(answer: answer)
        } catch {
            view.show(error)
        }
    }
    
    func showQuestion() {
        let question = interactor.getQuestion()
        view.show(question: question)
    }
}
