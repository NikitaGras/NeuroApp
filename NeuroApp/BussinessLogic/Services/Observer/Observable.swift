//
//  Observable.swift
//  NeuroApp
//
//  Created by Nikita Gras on 16.10.2021.
//

import Foundation

protocol Observable {
    var observers: [WeakBox<Observer>] { get set }
    
    mutating func register(_ observer: Observer)
    mutating func remove(_ observer: Observer)
    func notifyObservers()
    func isRegistred(_ observer: Observer) -> Bool
}

extension Observable {
    mutating func register(_ observer: Observer) {
        if !isRegistred(observer) {
            let weakBox = WeakBox(observer)
            observers.append(weakBox)
        }
    }
    
    mutating func remove(_ observer: Observer) {
        observers.removeAll { $0.object === observer }
    }
    
    func isRegistred(_ observer: Observer) -> Bool {
        observers.contains { $0.object === observer }
    }
}
