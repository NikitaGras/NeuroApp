//
//  QuizService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

class QuizService: QuizServiceProtocol {
    static let shared = QuizService()
    private let key: String = UserDefaults.key.quiz
    
    var observers = [WeakBox<QuizObserver>]()
    var quiz: Quiz! {
        didSet {
            notifyObservers()
        }
    }
    
    private init() {
        self.quiz = fetchQuiz()
    }
    
    func fetchQuiz() -> Quiz {
        guard let data = UserDefaults.standard.data(forKey: key),
              let quiz = try? JSONDecoder().decode(Quiz.self, from: data) else {
            return Quiz()
        }
        return quiz
    }
    
    func save(_ quiz: Quiz) throws {
        let data = try JSONEncoder().encode(quiz)
        UserDefaults.standard.setValue(data, forKey: key)
        self.quiz = quiz
    }
    
    func deleteQuiz() {
        UserDefaults().removeObject(forKey: key)
        quiz = Quiz()
    }
    
    func changeQuiz(with state: Quiz.State) {
        self.quiz.state = state
    }
    
    //MARK: - Observer
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
