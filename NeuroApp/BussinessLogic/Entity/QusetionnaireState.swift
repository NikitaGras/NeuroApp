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
    case notAvailable
    
    var backgroundColor: UIColor {
        switch self {
        case .begin:
            return .systemGreen
        case .proceed:
            return .systemBlue
        case .notAvailable:
            return .systemGray
        }
    }
    
    var title: String {
        switch self {
        case .begin:
            return .QustionaireState.begin
        case .proceed:
            return .QustionaireState.proceed
        case .notAvailable:
            return .QustionaireState.notAvailable
        }
    }
}
