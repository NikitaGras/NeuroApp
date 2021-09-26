//
//  QuestionsBank.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.09.2021.
//

import Foundation

class QuestionsBank {
    let partOneQuestions: [PartOneQuestions]
    let partTwoQuestions: [PartTwoQuestions]
    
    init() {
        partOneQuestions = []
        partTwoQuestions = []
    }
}

extension QuestionsBank {
    struct PartOneQuestions {
        let text: String
        var isDone: Bool = false
        var userAnswer: Int? = nil
    }
    
    struct PartTwoQuestions {
        let text: String
        var isDone: Bool = false
        var answerOptions: [partTwoAnswer]
        var userAnswer: partTwoAnswer? = nil
        
    }
    
    struct partTwoAnswer {
        let text: String
        var isRight: Bool
    }
}
