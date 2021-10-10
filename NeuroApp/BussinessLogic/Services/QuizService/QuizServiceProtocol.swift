//
//  QuizServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizServiceProtocol {
    var quiz: Quiz { get }
    
    func save(_ quiz: Quiz) throws
    func deleteQuiz()
    func changeQuiz(to state: Quiz.State)
    
    //MARK: - Observer
    func register(_ observer: QuizObserver)
    func remove(_ observer: QuizObserver)
}
