//
//  UserDetails.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.07.2021.
//

import Foundation

struct User: Codable {
    var name: String
    var age: Int
    var email: String
    var status: Status = .none
    
    init(with name: String, _ age: Int, _ email: String) throws {
        self.name = name
        self.age = age
        self.email = email
        try validate(name, age, email)
    }
}

extension User {
    enum Regex: String {
        case name = #"^[a-zA-Z]+ ?.* [a-zA-Z-]+$"#
        case email = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    }
    
    enum Status: Int, Codable {
        case none
        case positive
        case negative
        
        var description: String {
            switch self {
            case .none:
                return .UserStatus.none
            case .positive:
                return .UserStatus.positive
            case .negative:
                return .UserStatus.negative
            }
        }
    }
    
    // MARK: - Validation functions
    private func validate(_ name: String, _ age: Int, _ email: String) throws {
        try validate(name)
        try validate(age)
        try validateEmail(email)
    }
    
    private func validate(_ name: String) throws {
        if !name.isVaild(Regex.name.rawValue) {
            throw ValidationError.wrongName
        }
    }
    
    private func validate(_ age: Int) throws {
        let maxAge = 120
        if age <= 0 || age > maxAge {
            throw ValidationError.wrongAge
        }
    }
    // ASK - invalid redeclaration
    private func validateEmail(_ email: String) throws {
        if !email.isVaild(Regex.email.rawValue) {
            throw ValidationError.wrongEmail
        }
    }
}
