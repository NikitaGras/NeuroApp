//
//  ValidationError.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.07.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .custom(let message):
            return message
        }
    }
}
