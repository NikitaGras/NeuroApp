//
//  ScoreScreenScoreScreenInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class ScoreScreenInteractor: ScoreScreenInteractorInput {
    weak var output: ScoreScreenInteractorOutput!
    var service: QuizServiceProtocol!

    func getResult()throws -> Session {
        guard let result = service.history.last else {
            throw SystemError.default
        }
        return result
    }
    
    func changeQuize(to state: Quiz.State) {
//        service.changeQuiz(to: state)
    }
}
