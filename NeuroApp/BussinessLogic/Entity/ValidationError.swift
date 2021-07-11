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
            return "Неправильно набрано имя"
        case .wrongAge:
            return "Неправильно указан возраст"
        case .wrongEmail:
            return "Неправильно указан email"
        case .custom(let message):
            return message
        }
    }
}
