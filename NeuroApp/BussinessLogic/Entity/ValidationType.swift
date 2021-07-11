//
//  ValidationType.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation

enum ValidationType {
    case name
    case email
    
    var regex: String {
        switch self {
        case .name:
            return #"^[a-zA-Z]+ ?.* [a-zA-Z-]+$"#
        case .email:
            return "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        }
    }
}
