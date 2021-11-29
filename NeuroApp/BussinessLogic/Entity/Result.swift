//
//  Result.swift
//  NeuroApp
//
//  Created by Nikita Gras on 18.10.2021.
//

import Foundation

struct Result {
    let partOneAnswers: [PartOneAnswer]
    let partTwoAnswers: [PartTwoAnswer]
    let partThreeAnswer: PartThreeAnswer
    
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
                sum += answer.responseTime < 4 ? 0.5 : 0
            }
        }
        return Int(sum * 100 / Double(partTwoAnswers.count))
    }
    
    var partThreeScore: Int {
        //TODO:
        return Int(partThreeAnswer.value)
    }
}
