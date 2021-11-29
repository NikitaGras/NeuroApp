//
//  Quiz.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import UIKit

struct Quiz {
    var state: State = .begin
    var isProceed: Bool {
        return state == .partOneProceed || state == .partTwoProceed || state == .partThreeProceed
    }
    
    var partOneQuestions = QuestionsBank().partOneQuestions
    var partOneAnswers = [PartOneAnswer]() {
        didSet {
            if partOneAnswers.count == partOneQuestions.count {
                self.state = .partTwoProceed
            }
        }
    }
    
    var partTwoQuestions = QuestionsBank().partTwoQuestions
    var partTwoAnswers = [PartTwoAnswer]() {
        didSet {
            if partTwoAnswers.count == partTwoQuestions.count {
                self.state = .partThreeProceed
            }
        }
    }
    
    var partThreeQuestion = QuestionsBank().partThreeQuestion
    var partThreeAnswer: PartThreeAnswer? {
        didSet {
            self.state = .notAvailable
        }
    }
}

extension Quiz {
    enum State: Int, Codable {
        case begin
        case partOneProceed
        case partTwoProceed
        case partThreeProceed
        case notAvailable
    }
}
