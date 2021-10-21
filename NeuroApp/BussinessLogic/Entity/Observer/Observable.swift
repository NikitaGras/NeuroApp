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
    func isRegistred(_ observer: Observer) -> Bool
    func notifyObservers()
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
        return observers.contains { $0.object === observer }
    }
    
    func notifyObservers(with data: Any) {
        observers.forEach { observer in
            observer.object?.update(with: data)
        }
    }
}
