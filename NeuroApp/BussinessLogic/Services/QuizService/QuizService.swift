//
//  QuizService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

class QuizService: QuizServiceProtocol {
    static let shared = QuizService()
    private let userDefaultsKey: String = UserDefaults.Key.quiz
    
    var observers = [WeakBox<QuizObserver>]()
    var quiz: Quiz {
        didSet {
            notifyObservers()
        }
    }
    
    private init() {
        self.quiz = QuizService.fetchQuiz()
    }
    
    static private func fetchQuiz() -> Quiz {
        let key = UserDefaults.Key.quiz
        guard let data = UserDefaults.standard.data(forKey: key),
              let quiz = try? JSONDecoder().decode(Quiz.self, from: data) else {
            return Quiz()
        }
        return quiz
    }
    
    // TODO: history?
    func save(_ quiz: Quiz) throws {
        let data = try JSONEncoder().encode(quiz)
        UserDefaults.standard.setValue(data, forKey: userDefaultsKey)
        self.quiz = quiz
    }
    
    // TODO: delete?
    func deleteQuiz() {
        UserDefaults().removeObject(forKey: userDefaultsKey)
        quiz = Quiz()
    }
    
    func changeQuiz(to state: Quiz.State) {
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
