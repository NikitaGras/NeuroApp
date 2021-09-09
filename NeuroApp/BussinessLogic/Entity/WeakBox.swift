//
//  WeakBox.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.08.2021.
//

import Foundation

class WeakBox<T> {
    
    weak private var internalObject: AnyObject?
    
    var object: T? {
        return internalObject as? T
    }
    
    init(_ object: T) {
        self.internalObject = object as AnyObject
    }
}

//class ProfileWeakBox {
//    private(set) weak var object: ProfileObserver?
//
//    init(_ object: ProfileObserver) {
//        self.object = object
//    }
//}
//
//class QuizWeakBox {
//    private(set) weak var object: QuizObserver?
//
//    init(_ object: QuizObserver) {
//        self.object = object
//    }
//}
