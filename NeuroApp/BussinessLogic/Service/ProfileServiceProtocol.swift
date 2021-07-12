//
//  DatabaseService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import Foundation

protocol ProfileServiceProtocol {
    func fetchUser() -> User?
    func save(_ user: User) throws
}
