//
//  QuizServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizServiceProtocol {
    func save(_ quiz: Quiz) throws
    func deleteQuiz()
    
    //MARK: - Observer
    func register(_ observer: QuizObserver)
    func remove(_ observer: QuizObserver)
}
