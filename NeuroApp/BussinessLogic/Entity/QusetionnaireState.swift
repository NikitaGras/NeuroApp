//
//  QusetionnaireState.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import UIKit

enum QuestionnaireState {
    case begin
    case proceed
    case dayCounter
    
    var backgroundColor: UIColor {
        switch self {
        case .begin:
            return .systemGreen
        case .proceed:
            return .systemBlue
        case .dayCounter:
            return .systemGray
        }
    }
    
    var title: String {
        switch self {
        case .begin:
            return "BEGIN QUESTIONNAIRE"
        case .proceed:
            return "RESUME QUESTIONNAIRE"
        case .dayCounter:
            return "DAYS UNTIL NEXT SESSION"
        }
    }
}
