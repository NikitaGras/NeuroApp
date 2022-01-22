//
//  PartThreeQA.swift
//  NeuroApp
//
//  Created by Nikita Gras on 21.01.2022.
//

import Foundation

typealias PartThreeQuestion = String

struct PartThreeAnswer {
    let question: String
    let userText: String
    let ganningFoq: Double
    
    init(question: String, userText: String, ganningFoq: Double) {
        self.ganningFoq = ganningFoq
        self.userText = userText
        self.question = question
    }
    
    init(from model: SessionModel) throws {
        guard let question = model.partThree?.questionText,
              let userText = model.partThree?.userText,
              let value = model.partThree?.ganningGoq else {
                  throw SystemError.default
              }
        
        self.question = question
        self.userText = userText
        self.ganningFoq = value
    }
}
