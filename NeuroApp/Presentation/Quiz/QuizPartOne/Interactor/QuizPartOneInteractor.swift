//
//  QuizPartOneQuizPartOneInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartOneInteractor: QuizPartOneInteractorInput {
    weak var output: QuizPartOneInteractorOutput!
    var service: QuizServiceProtocol!
    
    var quiz: Quiz {
        return service.quiz
    }
    
    func getQuestions() -> [PartOneQuestion] {
        return service.quiz.partOneQuestions
    }
    
    func getAnswers() -> [PartOneAnswer] {
        return service.quiz.partOneAnswers
    }
    
    func save(_ answer: PartOneAnswer) throws {
        try service.save(answer)
    }
}
