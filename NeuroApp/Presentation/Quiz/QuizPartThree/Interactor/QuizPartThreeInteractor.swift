//
//  QuizPartThreeQuizPartThreeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Alamofire

class QuizPartThreeInteractor: QuizPartThreeInteractorInput {
    weak var output: QuizPartThreeInteractorOutput!
    
    var quizService: QuizServiceProtocol!
    var ganningFogService: GanningFogSeviceProtocol!
    
    var quiz: Quiz {
        return quizService.quiz
    }
    
    func getQuestion() -> PartThreeQuestion {
        return quizService.quiz.partThreeQuestion
    }
    
    func save(userText: String) {
        ganningFogService.getGunningFogIndex(for: userText) { gunningFogIndex, error in
            if let gunningFogIndex = gunningFogIndex {
                let answer = PartThreeAnswer(question: self.quiz.partThreeQuestion,
                                             userText: userText,
                                             value: gunningFogIndex)
                self.save(answer: answer)
            }
            if let error = error {
                self.output.denied(with: error)
            }
        }
    }
    
    func save(answer: PartThreeAnswer) {
        do {
            try self.quizService.save(answer)
            self.output.showResultScreen()
        } catch {
            self.output.denied(with: error)
        }
    }
    
    func getPriviousPartQuestionsNumber() -> Int {
        let partOneQuestionNumber = quizService.quiz.partOneQuestions.count
        let partTwoQuestionNumber = quizService.quiz.partTwoQuestions.count
        return partOneQuestionNumber + partTwoQuestionNumber
    }
}
