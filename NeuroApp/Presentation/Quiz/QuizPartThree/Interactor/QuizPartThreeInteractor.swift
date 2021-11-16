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
    
//    var question: PartThreeQuestion {
//        return quizService.getPartThreeQuestion()
//    }
    
    func getQuestion() -> PartThreeQuestion {
        return quizService.getPartThreeQuestion()
    }
    
    func getGunningFoqIndex(for text: String) {
        ganningFogService.getGunninhFogIndex(for: text) { gunningFog, error in
            if let gunningFog = gunningFog {
                self.output.save(with: gunningFog)
            }
            if let error = error {
                self.output.denied(with: error)
            }
        }
    }
    
    func save(answer: PartThreeAnswer) throws {
        try quizService.save(answer)
    }
}
