//
//  HomeHomeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class HomeInteractor: HomeInteractorInput, Observer {
    weak var output: HomeInteractorOutput!
    var quizService: QuizServiceProtocol!
    var profileService: ProfileServiceProtocol!
    
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
    
    func update(with data: Any) {
        if let quiz = data as? Quiz {
            output.update(with: quiz)
        }
        if let user = data as? User {
            output.update(with: user)
        }
    }
    
    func startNewQuiz() {
        quizService.startNewQuiz()
    }
    
    func getFinishTime() -> TimeInterval {
        quizService.history.last?.finishTime.timeIntervalSince1970 ?? 0
    }
    
    func registerObserver() {
        quizService.register(self)
        quizService.didRegister(observer: self)
        
        profileService.register(self)
    }
}
