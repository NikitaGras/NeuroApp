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
    
    func getQuestion() -> PartThreeQuestion {
        return quizService.quiz.partThreeQuestion
    }
    
    func save(userText: String) {
        ganningFogService.getGunningFogIndex(for: userText) { gunningFogIndex, error in
            if let gunningFogIndex = gunningFogIndex {
                let value = self.calculateIntoPercent(gunningFogIndex)
                let answer = PartThreeAnswer(userText: userText, value: value)
                self.save(answer: answer)
            }
            if let error = error {
                self.output.denied(with: error)
            }
        }
    }

    func calculateIntoPercent(_ gunningFogIndex: Double) -> Double {
        return atan(gunningFogIndex) * 100.0 / (Double.pi / 2)
    }
    
    func save(answer: PartThreeAnswer) {
        do {
            try self.quizService.save(answer)
            self.output.showResultScreen()
        } catch {
            self.output.denied(with: error)
        }
    }
}
