//
//  QuizServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizServiceProtocol: Observable {
    var history: [Result] { get }
    var quiz: Quiz { get }
    
    func deleteHistory()
    func startNewQuiz()
    func changeQuiz(to state: Quiz.State)
    
    func save(_ partOneAnswer: PartOneAnswer) throws
    func save(_ partTwoAnswer: PartTwoAnswer) throws
    func save(_ partThreeAnswer: PartThreeAnswer) throws
}
