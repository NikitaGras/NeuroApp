//
//  QuizPartTwoQuizPartTwoInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol QuizPartTwoInteractorInput {
    var quiz: Quiz { get }
    func save(_ answer: PartTwoAnswer) throws
    func getQuestions() -> [PartTwoQuestion]
    func getAnswers() -> [PartTwoAnswer]
    func getPartOneQuestionCount() -> Int
}
