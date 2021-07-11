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
        let symbols: [Character] = [".", ",", "!", "?"]
        let isCorrectName: Bool = !self.name.contains(where: { char in
            return symbols.contains(char)
        })
        if !isCorrectName {
            throw ValidationError.wrongName
        }
        
        if self.age < 0 {
            throw ValidationError.wrongAge
        }
        
        let isCorrectEmail: Bool = self.email.contains("@")
        if !isCorrectEmail {
            throw ValidationError.wrongEmail
        }
    }
}
