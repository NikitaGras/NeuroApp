//
//  SystemError.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.07.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case noUser
    case `default`
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .noUser:
            return String.Error.noUser
        case .default:
            return String.Error.default
        case .custom(let message):
            return message
        }
    }
}
