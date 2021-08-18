//
//  UserDetails.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.07.2021.
//

import Foundation

struct User: Codable {
    let name: String
    let age: Int
    let email: String
    
    init(with name: String, _ age: Int, _ email: String) {
        self.name = name
        self.age = age
        self.email = email
    }
    
    func validate() throws {
        try validateName()
        try validateAge()
        try validateEmail()
    }
    
    private func validateName() throws {
        if !name.isVaild(Regex.name.rawValue) {
            throw ValidationError.wrongName
        }
    }
    
    private func validateAge() throws {
        let maxAge = 120
        if self.age <= 0 || self.age > maxAge {
            throw ValidationError.wrongAge
        }
    }
    
    private func validateEmail() throws {
        if !email.isVaild(Regex.email.rawValue) {
            throw ValidationError.wrongEmail
        }
    }
}

extension User {
    enum Regex: String {
        case name = #"^[a-zA-Z]+ ?.* [a-zA-Z-]+$"#
        case email = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    }
}
