//
//  QuizServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizServiceProtocol: Observable {
    var history: [Session] { get }
    var quiz: Quiz { get }
    
    func deleteHistory() throws
    func startNewQuiz()
    
    func save(_ partOneAnswer: PartOneAnswer)
    func save(_ partTwoAnswer: PartTwoAnswer)
    func save(_ partThreeAnswer: PartThreeAnswer) throws
}
