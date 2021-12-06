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

    var questions: [PartTwoQuestion] = []
    var answers: [PartTwoAnswer] = []
    var index = 0
    
    var selectedOption: Option?
    var startTime: Date = .init()
    
    func viewIsReady() {
        view.setupInitialState()
        questions = interactor.getQuestions()
        answers = interactor.getAnswers()
        index = answers.count
        let partOneQuestionCount = interactor.getPartOneQuestionCount()
        view.setupProgressBar(viewsNumber: questions.count, currentIndex: index, startValue: partOneQuestionCount)
        view.setupProgressViewStack(with: interactor.quiz)
    }
    
    func viewDidLayout() {
        show(question: questions[index])
    }
    
    func save() {
        do {
            guard let selectedOption = selectedOption else {
                return
            }
            let runtime = getRuntime()
            
            let answer = PartTwoAnswer(questionText: questions[index].text, option: selectedOption, responseTime: runtime)
            try interactor.save(answer)
            view.moveProgressBar()
            index += 1
            index >= questions.count ? openNextPart() : show(question: questions[index])
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
        //TODO: писать подробнее
        startTime = .init()
    }
    
    func openNextPart() {
        router.openNextPart()
    }
    
    func getRuntime() -> TimeInterval {
        let finishTime: Date = .init()
        return finishTime.timeIntervalSince1970 - startTime.timeIntervalSince1970
    }
}
