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
    
    var partThreeScore: Int {
        return Int(atan(partThreeAnswer.value) * 100.0 / (Double.pi / 2))
    }
}