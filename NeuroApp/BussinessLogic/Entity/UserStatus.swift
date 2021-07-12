//
//  UserStatus.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import UIKit

enum UserStatus {
    case none
    case positive
    case negative
    
    var borderColor: UIColor {
        switch self {
        case .none:
            return .systemGray
        case .negative:
            return .systemRed
        case .positive:
            return .systemGreen
        }
    }
    
    var text: String {
        switch self {
        case .none:
            return "None"
        case .negative:
            return "Negative"
        case .positive:
            return "Positive"
        }
    }
}
