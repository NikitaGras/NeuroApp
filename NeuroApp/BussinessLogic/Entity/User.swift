//
//  UserDetails.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.07.2021.
//

import Foundation

struct User {
    let name: String
    let age: Int
    let email: String
    
    func validate() throws {
        let symbols: [Character] = [".", ",", "!", "?"]
        let isCorrectName: Bool = !self.name.contains(where: { char in
            return symbols.contains(char)
        })
        let isCorrectEmail: Bool = self.email.contains("@")
        
        if !isCorrectName {
            let message = "Неправильно указано имя"
            throw ValidationError.custom(message)
        }
        if self.age < 0 {
            let message = "Неправильно указан возраст"
            throw ValidationError.custom(message)
        }
        if !isCorrectEmail {
            let message = "Неправильно указан email"
            throw ValidationError.custom(message)
        }
    }
}
