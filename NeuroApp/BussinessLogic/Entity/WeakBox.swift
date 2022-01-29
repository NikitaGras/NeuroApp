//
//  WeakBox.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.08.2021.
//

import Foundation

final class WeakBox<T> {
    weak private var baseObject: AnyObject?
    var object: T? {
        return baseObject as? T
    }
    
    init(_ object: T) {
        self.baseObject = object as AnyObject
    }
}
