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
    
    var questions: [PartOneQuestion] = []
    var iterator: Int = 0
    
    func initialized() {
        questions = service.getPartOneQuestions()
        iterator = service.getPartOneAnswers().count
        
        iterator >= questions.count ? output.openNextPart() : output.show(question: questions[iterator])
    }
    
    func save(_ answer: PartOneAnswer) {
        do {
            try service.save(answer)
            iterator += 1
            iterator >= questions.count ? output.openNextPart() : output.show(question: questions[iterator])
        } catch {
            output.show(error: error)
        }
    }
}
