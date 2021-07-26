//
//  SystemError.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.07.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case noName
    case `default`
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .noName:
            return String.Error.noUser
        case .custom(let message):
            return message
        case .default:
            return String.Error.default
        }
    }
}
