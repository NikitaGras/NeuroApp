//
//  QuizService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

class QuizService: QuizServiceProtocol {
    static let shared = QuizService()
    var observers = [WeakBox<Observer>]() {
        didSet {
            notifyObservers()
        }
    }
    var history = [Result]()
    var quiz: Quiz
    
    private init() {
        self.quiz = QuizService.fetchQuiz()
    }
    
    static private func fetchQuiz() -> Quiz {
    //TODO: реализовать после подключения CoreData
        return Quiz()
    }
    
    func save(_ partOneAnswer: PartOneAnswer) throws {
        quiz.partOneAnswers.append(partOneAnswer)
    }
//
//    func getPartOneQuestions() -> [PartOneQuestion] {
//        return quiz.partOneQuestions
//    }
//
//    func getPartOneAnswers() -> [PartOneAnswer] {
//        return quiz.partOneAnswers
//    }
    
    func save(_ partTwoAnswer: PartTwoAnswer) throws {
        quiz.partTwoAnswers.append(partTwoAnswer)
    }
//
//    func getPartTwoQuestions() -> [PartTwoQuestion] {
//        return quiz.partTwoQuestions
//    }
//
//    func getPartTwoAnswers() -> [PartTwoAnswer] {
//        return quiz.partTwoAnswers
//    }
    
    func save(_ partThreeAnswer: PartThreeAnswer) throws {
        quiz.partThreeAnswer = partThreeAnswer
        saveQuizResult()
    }
    
//    func getPartThreeQuestion() -> PartThreeQuestion {
//        return quiz.partThreeQuestion
//    }
    
    func saveQuizResult() {
        if let partThreeAnswer = quiz.partThreeAnswer {
            let result = Result(partOneAnswers: quiz.partOneAnswers,
                                partTwoAnswers: quiz.partTwoAnswers,
                                partThreeAnswer: partThreeAnswer)
            history.append(result)
        }
    }
    
    func deleteQuiz() {
        quiz = Quiz()
    }
    
    func deleteHistory() {
        history = []
    }
    
    func changeQuiz(to state: Quiz.State) {
        self.quiz.state = state
        notifyObservers()
    }
    
    //MARK: - Observer
    func notifyObservers() {
        observers.forEach { weakBox in
            weakBox.object?.update(with: quiz)
        }
    }
}
