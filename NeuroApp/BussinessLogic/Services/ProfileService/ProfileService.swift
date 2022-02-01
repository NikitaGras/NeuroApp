//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation


class ProfileService: ProfileServiceProtocol {
    static let shared = ProfileService()
    private let key: String = UserDefaults.Key.user
    
    var observers = [WeakBox<Observer>]()
    var user: User?
    
    var isLoggedIn: Bool {
        return user != nil
    }
    
    private init() {
        self.user = fetchUser()
    }
    
    private func fetchUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            print(error)
            return nil
        }
    }
    
    func save(_ user: User) throws {
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.setValue(data, forKey: key)
        self.user = user
        notifyObservers(with: user)
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: key)
        user = nil
    }
}
