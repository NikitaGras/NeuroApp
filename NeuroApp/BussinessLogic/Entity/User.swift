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
    
    func validate() throws {
        if !name.isVaild(.name) {
            throw ValidationError.wrongName
        }
        let maxAge = 120
        if self.age <= 0 || self.age > maxAge {
            throw ValidationError.wrongAge
        }
        
        if !email.isVaild(.email) {
            throw ValidationError.wrongEmail
        }
    }
}
