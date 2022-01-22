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
    let partThreeQuestion: PartThreeQuestion
    
    init() {
        partOneQuestions = [
        PartOneQuestion(text: "Вопрос 1"),
        PartOneQuestion(text: "Вопрос 2"),
        PartOneQuestion(text: "Вопрос 3"),
        PartOneQuestion(text: "Вопрос 4"),]
        
        partTwoQuestions = [
            PartTwoQuestion(text: "2+2", options: [StringOption(value: "4", isRight: true), StringOption(value: "5", isRight: false), StringOption(value: "6", isRight: false), StringOption(value: "7", isRight: false)]),
            PartTwoQuestion(text: "Chose the rat", options: [ImageOption(value: "rat", isRight: true), ImageOption(value: "dog", isRight: false), ImageOption(value: "elethant", isRight: false), ImageOption(value: "raccoon", isRight: false)]),
            PartTwoQuestion(text: "Chose the rat", options: [ImageOption(value: "rat", isRight: true), ImageOption(value: "dog", isRight: false), ImageOption(value: "elethant", isRight: false), ImageOption(value: "raccoon", isRight: false)]),
            PartTwoQuestion(text: "2+2", options: [StringOption(value: "4", isRight: true), StringOption(value: "5", isRight: false), StringOption(value: "6", isRight: false), StringOption(value: "7", isRight: false)]),]
        
        partThreeQuestion = "Describe last movie you watched"
    }
}
