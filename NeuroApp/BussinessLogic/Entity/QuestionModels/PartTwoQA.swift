//
//  PartTwoQA.swift
//  NeuroApp
//
//  Created by Nikita Gras on 21.01.2022.
//

import UIKit

struct PartTwoQuestion {
    let text: String
    let options: Array<Option>
}

protocol Option {
    var value: String { get }
    var isRight: Bool { get }
}

struct StringOption: Option {
    var value: String
    var isRight: Bool
}

struct ImageOption: Option {
    var value: String
    var isRight: Bool
    
    func asImage() -> UIImage? {
        return UIImage(named: value)
    }
}

struct PartTwoAnswer {
    var questionText: String
    var option: Option
    var responseTime: TimeInterval
    
    init(questionText: String, option: Option, responseTime: TimeInterval) {
        self.questionText = questionText
        self.option = option
        self.responseTime = responseTime
    }
    
    init(from model: PartTwoModel) throws {
        guard let question = model.questionText,
              let option = try? model.option?.returnOption() else {
                  throw SystemError.default
              }
        self.questionText = question
        self.option = option
        self.responseTime = model.responseTime
    }
}
