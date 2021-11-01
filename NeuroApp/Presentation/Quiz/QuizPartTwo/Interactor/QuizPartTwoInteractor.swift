//
//  QuizPartTwoQuizPartTwoInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartTwoInteractor: QuizPartTwoInteractorInput {
    weak var output: QuizPartTwoInteractorOutput!
    var service: QuizServiceProtocol!
    
    func save(_ answer: PartTwoAnswer) throws {
        try service.save(answer)
    }
    
    func getQuestions() -> [PartTwoQuestion] {
        return service.getPartTwoQuestions()
    }
    
    func getAnswers() -> [PartTwoAnswer] {
        return service.getPartTwoAnswers()
    }
    
    func changeQuiz(to state: Quiz.State) {
        service.changeQuiz(to: .partThreeProceed)
    }
}
