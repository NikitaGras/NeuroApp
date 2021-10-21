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
        partOneQuestions = [
        PartOneQuestion(text: "Вопрос 1"),
        PartOneQuestion(text: "Вопрос 2"),
        PartOneQuestion(text: "Вопрос 3"),
        PartOneQuestion(text: "Вопрос 4"),]
        partTwoQuestions = []
    }
}

struct PartOneQuestion {
    let text: String
}

struct PartOneAnswer{
    let questionText: String
    let value: Int
}

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
}

struct PartThreeAnswer {
    let userText: String
    let value: Int
}
