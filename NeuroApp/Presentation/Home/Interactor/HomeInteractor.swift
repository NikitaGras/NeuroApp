//
//  HomeHomeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HomeInteractor: HomeInteractorInput, Observer {
    weak var output: HomeInteractorOutput!
    var quizService: QuizService!
    var profileService: ProfileService!
    
    var quiz: Quiz {
        return quizService.quiz
    }
    
    func initialized() {
        registerObserver()
    }
    
    deinit {
        quizService.remove(self)
        profileService.remove(self)
    }
    
    func update(with quiz: Quiz) {
        output.update(with: quiz)
    }
    
    func update(_ user: User?) {
        guard let user = user else {
            return output.openLogin()
        }
        output.update(with: user)
    }
    
    func registerObserver() {
        quizService.register(self)
        profileService.register(self)
    }
}
