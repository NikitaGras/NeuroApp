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
    
    var quiz: Quiz {
        return service.quiz
    }
    
    func save(_ answer: PartTwoAnswer) throws {
        try service.save(answer)
    }
    
    func getQuestions() -> [PartTwoQuestion] {
        return service.quiz.partTwoQuestions
    }
    
    func getAnswers() -> [PartTwoAnswer] {
        return service.quiz.partTwoAnswers
    }
    
    func getPartOneQuestionCount() -> Int {
        return service.quiz.partOneQuestions.count
    }
}
