//
//  Quiz.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import UIKit

struct Quiz {
    var state: State {
        if partOneAnswers.isEmpty {
            return .begin
        } else if partOneAnswers.count < partOneQuestions.count {
            return .partOneInProgress
        } else if partTwoAnswers.count < partTwoQuestions.count {
            return .partTwoInProgress
        } else if partTwoAnswers.count == partTwoQuestions.count && partThreeAnswer == nil {
            return .partThreeInProgress
        } else {
            return .notAvailable
        }
    }
    var isProceed: Bool {
        return state == .partOneInProgress || state == .partTwoInProgress || state == .partThreeInProgress
    }
    
    var partOneQuestions = QuestionsBank().partOneQuestions
    var partOneAnswers = [PartOneAnswer]()
    
    var partTwoQuestions = QuestionsBank().partTwoQuestions
    var partTwoAnswers = [PartTwoAnswer]()
    
    var partThreeQuestion = QuestionsBank().partThreeQuestion
    var partThreeAnswer: PartThreeAnswer?
}

extension Quiz {
    enum State: Int, Codable {
        case begin
        case partOneInProgress
        case partTwoInProgress
        case partThreeInProgress
        case notAvailable
    }
}
