//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import Foundation

protocol ProfileServiceProtocol: Observable {
    var isLoggedIn: Bool { get }
    
    func save(_ user: User) throws
    func deleteUser()
}
