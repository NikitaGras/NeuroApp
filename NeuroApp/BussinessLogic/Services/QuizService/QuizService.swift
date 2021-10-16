//
//  QuizService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

class QuizService: QuizServiceProtocol {
    static let shared = QuizService()
    
    var observers = [WeakBox<QuizObserver>]()
    var quiz: Quiz
    
    private init() {
        self.quiz = QuizService.fetchQuiz()
    }
    
    static private func fetchQuiz() -> Quiz {
    //TODO: реализовать после подключения CoreData
        return Quiz()
    }
    
    // TODO: history?
    func save(_ quiz: Quiz) throws {
        self.quiz = quiz
    }
    
    // TODO: delete?
    func deleteQuiz() {
        quiz = Quiz()
    }
    
    func changeQuiz(to state: Quiz.State) {
        self.quiz.state = state
        notifyObservers()
    }
    
    //MARK: - Observer
    // TODO: - подумать как вынести функционал
    func register(_ observer: QuizObserver) {
        if !isRegistred(observer) {
            let weakBox = WeakBox(observer)
            observers.append(weakBox)
            observer.update(with: quiz)
        }
    }
    
    func remove(_ observer: QuizObserver) {
        observers.removeAll { $0.object === observer }
    }
    
    func notifyObservers() {
        observers.forEach { weakBox in
            weakBox.object?.update(with: quiz)
        }
    }
    
    func isRegistred(_ observer: QuizObserver) -> Bool {
        observers.contains { $0.object === observer }
    }
}
