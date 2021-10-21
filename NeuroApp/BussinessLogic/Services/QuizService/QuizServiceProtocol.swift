//
//  QuizServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizServiceProtocol: Observable {
    var quiz: Quiz { get }
    
    func save(_ quiz: Quiz) throws
    func deleteQuiz()
    func changeQuiz(to state: Quiz.State)
    
    func save(_ answer: PartOneAnswer) throws
    func getPartOneQuestions() -> [PartOneQuestion]
    func getPartOneAnswers() -> [PartOneAnswer]
}
