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
    
    private static let animals = ["rat", "dog", "elethant", "raccoon"]
    
    init() {
        partOneQuestions = QuestionsBank.initPartOneQuestions()
        partTwoQuestions = QuestionsBank.initPartTwoQuestions()
        partThreeQuestion = QuestionsBank.initPartThreeQuestion()
    }
    
    private static func initPartOneQuestions() -> [PartOneQuestion] {
        return [PartOneQuestion(text: "I'm sure that i can recognize when i forget somthing"),
                PartOneQuestion(text: "I'm sure that i can recognize when i become distracted"),
                PartOneQuestion(text: "I'm sure that i can recognize when i'm having dificulty concentrating"),
                PartOneQuestion(text: "I'm sure that i can recognize when i make a mistake"),]
    }
    
    private static func initPartTwoQuestions() -> [PartTwoQuestion] {
        let question = [
            PartTwoQuestion(text: "What is 80-64", options: createOptions(rightAnswer: 16, in: 10...30)),
            PartTwoQuestion(text: "What is 27+71", options: createOptions(rightAnswer: 98, in: 80...120)),
            PartTwoQuestion(text: "Chose the rat", options: createOptions(rightAnswer: "rat", in: animals)),
            PartTwoQuestion(text: "Chose the racoon", options: createOptions(rightAnswer: "raccoon", in: animals))]
        return question.shuffled()
    }
    
    private static func initPartThreeQuestion() -> PartThreeQuestion {
        let questions = ["Describe last movie you watched",
                         "Describe last book you read",
                         "Describe how did you spend last holliday",
                         "Describe you fauvorite memory"]
        return questions.randomElement() ?? "Describe you fauvorite memory"
    }
    
    private static func createOptions(rightAnswer: Int, in range: ClosedRange<Int>) -> [StringOption] {
        var options = [StringOption(value: rightAnswer.description, isRight: true)]
        let wrongAnswers = Int.random(in: range, count: 3, excluded: rightAnswer)
        for answer in wrongAnswers {
            let option = StringOption(value: answer.description, isRight: false)
            options.append(option)
        }
        return options
    }
    
    private static func createOptions(rightAnswer: String, in answers: [String]) -> [ImageOption] {
        var options: [ImageOption] = []
        
        let rightOption = ImageOption.init(value: rightAnswer, isRight: true)
        options.append(rightOption)
        
        var answers = answers
        answers.removeAll { $0 == rightAnswer }
        for index in 0..<3 {
            let wrongOption = ImageOption(value: answers[index], isRight: false)
            options.append(wrongOption)
        }
        return options
    }
}
