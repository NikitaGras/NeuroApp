//
//  QuizPartOneQuizPartOneInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol QuizPartOneInteractorInput {
    func save(_ answer: PartOneAnswer) throws
    func getQuestions() -> [PartOneQuestion]
    func getAnswers() -> [PartOneAnswer]
    func changeQuiz(to state: Quiz.State)
}
