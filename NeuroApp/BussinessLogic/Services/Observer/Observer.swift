//
//  Observer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 16.10.2021.
//

import Foundation

protocol Observer: AnyObject {
    func update(with quiz: Quiz)
    func update(_ user: User?)
}

extension Observer {
    func update(with quiz: Quiz) {
        // This is emptry implementation to allow this method to be optional
    }
    func update(_ user: User?) {
        // This is emptry implementation to allow this method to be optional
    }
}
