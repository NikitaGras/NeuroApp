//
//  WeakBox.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.08.2021.
//

import Foundation

class WeakBox {
    
    private(set) weak var object: ProfileObserver?
    
    init(_ object: ProfileObserver) {
        self.object = object
    }
}
