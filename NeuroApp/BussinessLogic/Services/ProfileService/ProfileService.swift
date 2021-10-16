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
    var user: User? {
        didSet {
            notifyObservers()
        }
    }
    
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
        // TODO: try?
        let user = try? JSONDecoder().decode(User.self, from: data)
        return user
    }
    
    func save(_ user: User) throws {
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.setValue(data, forKey: key)
        self.user = user
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: key)
        user = nil
    }
    
    
    //MARK: - Observer
    func register(_ observer: Observer) {
        if !isRegistred(observer) {
            let weakBox = WeakBox(observer)
            observers.append(weakBox)
            observer.update(user)
        }
    }
    
    func remove(_ observer: Observer) {
        observers.removeAll { $0.object === observer }
    }
    
    func notifyObservers() {
        observers.forEach { observer in
            observer.object?.update(user)
        }
    }
    
    func isRegistred(_ observer: Observer) -> Bool {
        return observers.contains { $0.object === observer }
    }
}
