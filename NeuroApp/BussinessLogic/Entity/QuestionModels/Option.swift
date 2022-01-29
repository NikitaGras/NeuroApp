//
//  Option.swift
//  NeuroApp
//
//  Created by Nikita Gras on 28.01.2022.
//

import UIKit

protocol Option {
    var value: String { get }
    var isRight: Bool { get }
}

struct StringOption: Option {
    var value: String
    var isRight: Bool
    
    // MARK: инкапсулировать этот кусок кода
    init(value: String, isRight: Bool) {
        self.value = value
        self.isRight = isRight
    }
    
    init(model: OptionModel) throws {
        guard let value = model.value else {
            throw SystemError.default
        }
        self.value = value
        isRight = model.isRight
    }
}

struct ImageOption: Option {
    var value: String
    var isRight: Bool
    
    init(value: String, isRight: Bool) {
        self.value = value
        self.isRight = isRight
    }
    
    init(model: OptionModel) throws {
        guard let value = model.value else {
            throw SystemError.default
        }
        self.value = value
        isRight = model.isRight
        
        func asImage() -> UIImage? {
            return UIImage(named: value)
        }
    }
    
    func asImage() -> UIImage? {
        return UIImage(named: value)
    }
}
