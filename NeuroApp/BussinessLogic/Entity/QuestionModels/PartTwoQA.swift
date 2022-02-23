//
//  PartTwoQA.swift
//  NeuroApp
//
//  Created by Nikita Gras on 21.01.2022.
//

import UIKit

struct PartTwoQuestion {
    let text: String
    let options: [Option]
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
    
    init(model: PartTwoModel) throws {
        guard let question = model.questionText,
              let optionModel = model.option else {
                  throw SystemError.default
              }
        // TODO: optionModel.isImage всегда true
        let option: Option = optionModel.isImage ? try ImageOption(model: optionModel) : try StringOption(model: optionModel)
        self.init(questionText: question, option: option, responseTime: model.responseTime)
    }
}
