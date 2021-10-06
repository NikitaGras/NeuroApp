//
//  QuestionsBank.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.09.2021.
//

import UIKit

class QuestionsBank: Codable {
    let partOneQuestions: [PartOneQuestion]
    let partTwoQuestions: [PartTwoQuestion]
    
    init() {
        partOneQuestions = []
        partTwoQuestions = []
    }
}


struct PartOneQuestion: Codable {
    let text: String
}

struct PartTwoQuestion: Codable {
    let text: String
    var answerOptions: [PartTwoAnswer]
}

struct PartTwoAnswer: Codable {
    let sample: Any
    var isRight: Bool
}
