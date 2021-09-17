//
//  HomeHomeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HomeInteractor: HomeInteractorInput, QuizObserver, ProfileObserver {
    weak var output: HomeInteractorOutput!
    var QuizService: QuizService!
    var ProfileService: ProfileService!
    
    var quiz: Quiz {
        return QuizService.quiz
    }
    
    func update(with quiz: Quiz) {
        output.update(with: quiz)
    }
    
    func update(_ user: User?) {
        guard let user = user else {
            return output.openlogin()
        }
        output.update(with: user)
    }
    
    func registerObserver() {
        QuizService.register(self)
    }
}
