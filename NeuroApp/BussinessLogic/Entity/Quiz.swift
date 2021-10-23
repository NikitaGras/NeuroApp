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
    var partOneAnswers = [PartOneAnswer]()
    
    var partTwoQuestions = QuestionsBank().partTwoQuestions
    var partTwoAnswers = [PartTwoAnswer]()
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
