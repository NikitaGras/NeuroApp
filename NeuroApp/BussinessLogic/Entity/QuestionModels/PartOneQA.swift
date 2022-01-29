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
    
    init(model: PartOneModel) throws {
        guard let questiontext = model.questionText else {
            throw SystemError.default
        }
        self.questionText = questiontext
        value = model.value
    }
}
