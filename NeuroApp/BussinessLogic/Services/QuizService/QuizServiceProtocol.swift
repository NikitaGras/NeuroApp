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
    
    func deleteHistory()
    func startNewQuiz()
    
    func save(_ partOneAnswer: PartOneAnswer) throws
    func save(_ partTwoAnswer: PartTwoAnswer) throws
    func save(_ partThreeAnswer: PartThreeAnswer) throws
}
