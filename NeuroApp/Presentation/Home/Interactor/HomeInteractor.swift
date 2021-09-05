//
//  HomeHomeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HomeInteractor: HomeInteractorInput, QuizObserver {
    weak var output: HomeInteractorOutput!
    var service: QuizService!
    
    var quizState: QuestionnaireState {
        return service.quiz.state
    }
    
    func update(with quiz: Quiz) {
        output.update(with: quiz)
    }
    
    func registerObserver() {
        service.register(self)
    }
}
