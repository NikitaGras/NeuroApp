//
//  Quiz.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import UIKit

struct Quiz: Codable {
    var state: State = .begin
    var isProceed: Bool {
        if state == .partOneProceed || state == .partTwoProceed || state == .partThreeProceed {
            return true
        } else {
            return false
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
