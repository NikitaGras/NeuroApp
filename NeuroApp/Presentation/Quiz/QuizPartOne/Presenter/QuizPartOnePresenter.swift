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
    
    var questions: [PartOneQuestion] {
        return interactor.getQuestions()
    }
    var currentQuestionIndex: Int = 0
    
    func viewIsReady() {
        view.setupInitialState()
        currentQuestionIndex = interactor.getAnswers().count
        view.show(questions[currentQuestionIndex])
        view.setupProgressBar()
    }
    
    func save(_ answer: PartOneAnswer) {
        do {
            try interactor.save(answer)
            view.fillProgressbar()
            currentQuestionIndex += 1
            currentQuestionIndex >= questions.count ?
            openNextPart() : view.show(questions[currentQuestionIndex])
        } catch {
            view.show(error)
        }
    }
    
    func openNextPart() {
        router.openNextPart()
    }
}
