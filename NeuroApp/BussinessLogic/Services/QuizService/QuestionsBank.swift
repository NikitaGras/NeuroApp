//
//  QuestionsBank.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.09.2021.
//

import UIKit

class QuestionsBank {
    let partOneQuestions: [PartOneQuestion]
    let partTwoQuestions: [PartTwoQuestion]
    
    init() {
        partOneQuestions = []
        partTwoQuestions = []
    }
}


struct PartOneQuestion {
    let text: String
}

struct PartTwoQuestion {
    let text: String
    var answerOptions: [partTwoAnswer]
}

struct partTwoAnswer {
    let sample: Any
    var isRight: Bool
}
