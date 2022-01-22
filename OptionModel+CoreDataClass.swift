//
//  OptionModel+CoreDataClass.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData

@objc(OptionModel)
public class OptionModel: NSManagedObject {
    
    func returnOption() throws -> Option {
        guard let value = self.value else {
            throw SystemError.default
        }
        if self.isImage {
            return ImageOption(value: value, isRight: self.isRight)
        } else {
            return StringOption(value: value, isRight: self.isRight)
        }
    }
}
