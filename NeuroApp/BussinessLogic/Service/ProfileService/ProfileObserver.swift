//
//  ProfileObserver.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.08.2021.
//

import Foundation

protocol ProfileObserver: AnyObject {
    func didSet(_ user: User?)
}
