//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 11.07.2021.
//

import Foundation


class ProfileService: ProfileServiceProtocol {
    static let shared = ProfileService()
    private let key: String = UserDefaults.key.user
    //TODO: использовать WeakBox который работает с Any?
    var observers = [ProfileWeakBox]()
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
    // TODO: проверять есть ли в массиве observer
    func register(_ observer: ProfileObserver) {
        let weakBox = ProfileWeakBox(observer)
        observers.append(weakBox)
        observer.update(user)
    }
    
    func remove(_ observer: ProfileObserver) {
        // TODO:
    }
    
    func notify() {
        observers.forEach { observer in
            observer.object?.update(user)
        }
    }
}
