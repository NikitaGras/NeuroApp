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
    
    var questions: [PartOneQuestion] = []
    var index: Int = 0
    
    func viewIsReady() {
        view.setupInitialState()
        questions = interactor.getQuestions()
        index = interactor.getAnswers().count
        view.show(questions[index])
    }
    
    func save(_ answer: PartOneAnswer) {
        do {
            try interactor.save(answer)
            index += 1
            index >= questions.count ? router.openNextPart() : view.show(questions[index])
        } catch {
            view.show(error)
        }
    }
    
    func openNextPart() {
        router.openNextPart()
    }
}
