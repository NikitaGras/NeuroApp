//
//  NeuroAppValueTransformer.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24.01.2022.
//

import Foundation

final class NeuroAppValueTransformer: NSSecureUnarchiveFromDataTransformer {
    static let name = NSValueTransformerName(String(describing: NeuroAppValueTransformer.self))

    override static var allowedTopLevelClasses: [AnyClass] {
        return [PartOneModel.self, PartTwoModel.self, PartThreeModel.self]
    }

    public static func register() {
        let transformer = NeuroAppValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
