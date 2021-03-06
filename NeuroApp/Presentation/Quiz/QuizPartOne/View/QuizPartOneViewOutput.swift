//
//  QuizPartOneQuizPartOneViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartOneViewOutput {
    var questions: [PartOneQuestion] { get }
    var currentQuestionIndex: Int { get }
    
    func viewIsReady()
    func save(_ answer: PartOneAnswer)
}
