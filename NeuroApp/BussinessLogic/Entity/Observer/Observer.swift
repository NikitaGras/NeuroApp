//
//  Observer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 16.10.2021.
//

import Foundation

protocol Observer: AnyObject {
    func update(with data: Any)
}
