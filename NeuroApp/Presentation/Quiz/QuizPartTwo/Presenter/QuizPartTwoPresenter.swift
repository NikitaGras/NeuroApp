//
//  QuizPartTwoQuizPartTwoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

class QuizPartTwoPresenter: QuizPartTwoModuleInput, QuizPartTwoViewOutput, QuizPartTwoInteractorOutput {
    weak var view: QuizPartTwoViewInput!
    var interactor: QuizPartTwoInteractorInput!
    var router: QuizPartTwoRouterInput!

    var questions: [PartTwoQuestion] {
        return interactor.getQuestions()
    }
    var previousPartQuestionsCount: Int {
        interactor.getPartOneQuestionCount()
    }
    var currentQuestionIndex: Int = 0
    
    var selectedOption: Option?
    var startTime: Date = Date.init()
    
    func viewIsReady() {
        view.setupInitialState()
        currentQuestionIndex = interactor.getAnswers().count
        view.setupProgressBar()
    }
    
    func viewDidLayout() {
        show(question: questions[currentQuestionIndex])
    }
    
    func save() {
        do {
            guard let selectedOption = selectedOption else {
                return
            }
            let runtime = getRuntime()
            let answer = PartTwoAnswer(questionText: questions[currentQuestionIndex].text,
                                       option: selectedOption, responseTime: runtime)
            try interactor.save(answer)
            view.fillProgressBar()
            currentQuestionIndex += 1
            currentQuestionIndex >= questions.count ?
            openNextPart() : show(question: questions[currentQuestionIndex])
        } catch {
            view.show(error)
        }
    }
    
    func show(question: PartTwoQuestion) {
        view.show(question: question)
        if let options = question.options as? [ImageOption] {
            view.show(imageOptions: options)
        }
        if let options = question.options as? [StringOption] {
            view.show(stringOptions: options)
        }
        startTime = Date.init()
    }
    
    func openNextPart() {
        router.openNextPart()
    }
    
    func getRuntime() -> TimeInterval {
        let finishTime = Date.init()
        return finishTime.timeIntervalSince1970 - startTime.timeIntervalSince1970
    }
}
