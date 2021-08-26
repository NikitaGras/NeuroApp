//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation

private let key: String = UserDefaults.key.user

class ProfileService: ProfileServiceProtocol {
    static let shared = ProfileService()
    var observers = [WeakBox]()
    var user: User? {
        didSet {
            notify()
        }
    }
    var isLoggedIn: Bool {
        return user != nil
    }
    
    private init() {
        let user = fetchUser()
        self.user = user
    }
    
    private func fetchUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        let user = try? JSONDecoder().decode(User?.self, from: data)
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
    
    func attach(_ observer: ProfileObserver) {
        let weakBox = WeakBox(observer)
        observers.append(weakBox)
        observer.update(user)
    }
    
    func detach(_ observer: ProfileObserver) {
        // TODO:
    }
    
    func notify() {
        observers.forEach { observer in
            observer.object?.update(user)
        }
    }
    
}
