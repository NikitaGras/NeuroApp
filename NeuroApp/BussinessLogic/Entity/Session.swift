//
//  Result.swift
//  NeuroApp
//
//  Created by Nikita Gras on 18.10.2021.
//

import Foundation

struct Session {
    let partOneAnswers: [PartOneAnswer]
    let partTwoAnswers: [PartTwoAnswer]
    let partThreeAnswer: PartThreeAnswer
    let finishTime: Date
    
    var sessionModel: SessionModel?
    
    init(partOneAnswers: [PartOneAnswer],
         partTwoAnswers: [PartTwoAnswer],
         partThreeAnswer: PartThreeAnswer,
         finishTime: Date) {
        self.partOneAnswers = partOneAnswers
        self.partTwoAnswers = partTwoAnswers
        self.partThreeAnswer = partThreeAnswer
        self.finishTime = finishTime
    }
    
    init(quiz: Quiz) throws {
        guard let partThreeAnswer = quiz.partThreeAnswer else {
            throw SystemError.default
        }
        self.init(partOneAnswers: quiz.partOneAnswers,
                  partTwoAnswers: quiz.partTwoAnswers,
                  partThreeAnswer: partThreeAnswer,
                  finishTime: Date())
    }
    
    init(model: SessionModel) throws {
        guard let partOneModels = model.partOne,
              let partTwoModels = model.partTwo,
              let partThreeModel = model.partThree,
              let finishTime = model.finishTime else {
                  throw SystemError.default
        }
        try self.partOneAnswers = partOneModels.map { try PartOneAnswer(model: $0)}
        try self.partTwoAnswers = partTwoModels.map { try PartTwoAnswer(model: $0)}
        self.partThreeAnswer = try PartThreeAnswer(from: partThreeModel)
        self.finishTime = finishTime
    }
    
    var avarageScore: Int {
        return (partOneScore + partTwoScore + partThreeScore) / 3
    }
    
    var partOneScore: Int {
        var sum: Int = 0
        partOneAnswers.forEach { answer in
            sum += answer.value * 10
        }
        return sum / partOneAnswers.count
    }
    
    var partTwoScore: Int {
        var sum: Double = 0
        partTwoAnswers.forEach { answer in
            if answer.option.isRight {
                sum += 0.5
                if answer.responseTime <= 1 {
                    sum += 0.5
                } else if answer.responseTime <= 3 {
                    sum += (-0.25 * answer.responseTime + 0.75)
                }
            }
        }
        return Int(sum * 100 / Double(partTwoAnswers.count))
    }
    
    var partTwoAverageTime: TimeInterval {
        var sum = 0.0
        partTwoAnswers.forEach { answer in
            sum += answer.responseTime
        }
        return (sum / Double(partOneAnswers.count))
    }
    
    var partTwoCountRightAnswer: Int {
        var count = 0
        partTwoAnswers.forEach { answer in
            if answer.option.isRight {
                count += 1
            }
        }
        return count
    }
    
    var partThreeScore: Int {
        return Int(atan(partThreeAnswer.ganningFoq) * 100.0 / (Double.pi / 2))
    }
}
