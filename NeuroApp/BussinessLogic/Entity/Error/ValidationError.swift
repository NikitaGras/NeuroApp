//
//  ValidationError.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.07.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case wrongName
    case wrongAge
    case wrongEmail
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .wrongName:
            return String.Error.wrongName
        case .wrongAge:
            return String.Error.wrongAge
        case .wrongEmail:
            return String.Error.wrongEmail
        case .custom(let message):
            return message
        }
    }
}
