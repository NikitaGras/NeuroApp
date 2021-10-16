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

typealias PartOneAnswer = Int

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
}
