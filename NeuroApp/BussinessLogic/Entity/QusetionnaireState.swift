//
//  QusetionnaireState.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import UIKit

enum QuestionnaireState: Int, Codable {
    case begin
    case partOneProceed
    case partTwoProceed
    case partThreeProceed
    case notAvailable
    
    var backgroundColor: UIColor {
        switch self {
        case .begin:
            return .systemGreen
        case .notAvailable:
            return .systemGray
        default:
            return .systemBlue
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .begin:
            return .QustionaireState.begin
        case .notAvailable:
            return .QustionaireState.notAvailable
        default:
            return .QustionaireState.proceed
        }
    }
    
    var previewTitle: String {
        switch self {
        case .partOneProceed:
            return String.Preview.partOneTitle
        case .partTwoProceed:
            return String.Preview.partTwoTitle
        case .partThreeProceed:
            return String.Preview.partThreeTitle
        default:
            return ""
        }
    }
    
    var previewInfo: String {
        switch self {
        case .begin:
            return String.Preview.begin
        case .partOneProceed:
            return String.Preview.partOneInfo
        case .partTwoProceed:
            return String.Preview.partTwoInfo
        case .partThreeProceed:
            return String.Preview.partThreeInfo
        default:
            return ""
        }
    }
}
