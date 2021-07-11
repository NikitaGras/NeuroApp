//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation

class DatabaseService {
    static let shared = DatabaseService()
    private(set) var user: User?
    
    let userKey: String = UserDefaults.key.user
    
    private init() {
        let user = fetchUser()
        self.user = user
    }
    
    func fetchUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: userKey) else {
            return nil
        }
        let user = try? JSONDecoder().decode(User?.self, from: data)
        return user
    }
    
    func save(_ user: User) throws {
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.setValue(data, forKey: userKey)
        self.user = user
    }
}
