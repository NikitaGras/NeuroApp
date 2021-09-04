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
    
    var observers = [QuizWeakBox]()
    var quiz: Quiz! {
        didSet {
            notify()
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
    
    
    //MARK: - Observer
    
    func register(_ observer: QuizObserver) {
        let weakBox = QuizWeakBox(observer)
        observers.append(weakBox)
    }
    
    func remove(_ observer: QuizObserver) {
        // TODO:
    }
    
    func notify() {
        observers.forEach { weakBox in
            weakBox.object?.update(with: quiz)
        }
    }
    
    
}
