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
    var history: [Result] = [Result(partOneAnswers: [PartOneAnswer(questionText: "", value: 50)], partTwoAnswers: [PartTwoAnswer(questionText: "", option: StringOption(value: "", isRight: true), responseTime: 2)], partThreeAnswer: PartThreeAnswer(question: "1.", userText: "", value: 50), finishTime: Date())]
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
    
    func save(_ partTwoAnswer: PartTwoAnswer) throws {
        quiz.partTwoAnswers.append(partTwoAnswer)
    }
    
    func save(_ partThreeAnswer: PartThreeAnswer) throws {
        quiz.partThreeAnswer = partThreeAnswer
        saveQuizResult()
    }
    
    func saveQuizResult() {
        if let partThreeAnswer = quiz.partThreeAnswer {
            let finishTime = Date()
            let result = Result(partOneAnswers: quiz.partOneAnswers,
                                partTwoAnswers: quiz.partTwoAnswers,
                                partThreeAnswer: partThreeAnswer,
                                finishTime: finishTime)
            history.append(result)
            notifyObservers()
        }
    }
    
    func startNewQuiz() {
        self.quiz = Quiz()
        notifyObservers()
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
            weakBox.object?.update(with: history)
        }
    }
}
