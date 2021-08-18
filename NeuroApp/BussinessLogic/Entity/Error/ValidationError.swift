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
            return String.ValidationError.wrongName
        case .wrongAge:
            return String.ValidationError.wrongAge
        case .wrongEmail:
            return String.ValidationError.wrongEmail
        case .custom(let message):
            return message
        }
    }
}
