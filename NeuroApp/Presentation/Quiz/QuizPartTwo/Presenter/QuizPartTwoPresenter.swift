//
//  QuizPartTwoQuizPartTwoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartTwoPresenter: QuizPartTwoModuleInput, QuizPartTwoViewOutput, QuizPartTwoInteractorOutput {
    weak var view: QuizPartTwoViewInput!
    var interactor: QuizPartTwoInteractorInput!
    var router: QuizPartTwoRouterInput!

    var questions: [PartTwoQuestion] = []
    var answers: [PartTwoAnswer] = []
    var index = 0
    
    var selectedOptionIndex: Int?
    
    func viewIsReady() {
        view.setupInitialState()
        questions = interactor.getQuestions()
        answers = interactor.getAnswers()
        index = answers.count
        show(qusetion: questions[index])
    }
    
    func save() {
        do {
            guard let selectedOptionIndex = selectedOptionIndex else {
                return
            }
            let answer = PartTwoAnswer(questionText: questions[index].text, option: questions[index].options[selectedOptionIndex], responseTime: 0)
            try interactor.save(answer)
            index += 1
            index >= questions.count ? openNextPart() : view.show(question: questions[index])
        } catch {
            view.show(error)
        }
    }
    
    func show(qusetion: PartTwoQuestion) {
        view.show(question: qusetion)
        if let options = qusetion.options as? [ImageOption] {
            view.show(imageOptions: options)
        }
        if let options = qusetion.options as? [StringOption] {
            view.show(stringOptions: options)
        }
    }
    
    func openNextPart() {
        interactor.changeQuiz(to: .partThreeProceed)
        router.openNextPart()
    }
}
