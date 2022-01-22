//
//  PartOneQA.swift
//  NeuroApp
//
//  Created by Nikita Gras on 21.01.2022.
//

import Foundation

struct PartOneQuestion {
    let text: String
}

struct PartOneAnswer {
    let questionText: String
    let value: Int
    
    init(questionText: String, value: Int) {
        self.questionText = questionText
        self.value = value
    }
    
    init(from model: PartOneModel) throws {
        guard let question = model.questionText else {
            //TODO: - создать ошибку
            throw SystemError.default
        }
        
        self.questionText = question
        self.value = Int(model.value)
    }
}
