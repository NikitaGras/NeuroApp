//
//  UserStatusServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14.07.2021.
//

import Foundation

protocol UserStatusServiceProtocol {
    func addObserver(_ observer: UserStatusServiceObserver)
    func removeObserver(_ observer: UserStatusServiceObserver)
    func notifyObservers()
}
