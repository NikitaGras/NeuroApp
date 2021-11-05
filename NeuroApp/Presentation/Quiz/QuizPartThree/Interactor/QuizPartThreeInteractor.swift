//
//  QuizPartThreeQuizPartThreeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartThreeInteractor: QuizPartThreeInteractorInput {
    weak var output: QuizPartThreeInteractorOutput!
    var quizService: QuizServiceProtocol!
    var ganningFogService: GanningFogSeviceProtocol!
    
    var question: PartThreeQuestion {
        return quizService.getPartThreeQuestion()
    }
    
    func getQuestion() -> PartThreeQuestion {
        return quizService.getPartThreeQuestion()
    }
    
    func getGunningFoqIndex(for text: String) throws -> Int {
        let ganningFogIndex = try ganningFogService.getGunninhFogIndex(for: text)
        return ganningFogIndex
    }
    
    func save(answer: PartThreeAnswer) throws {
        try quizService.save(answer)
    }
}
