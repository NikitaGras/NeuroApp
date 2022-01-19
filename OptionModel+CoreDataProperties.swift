//
//  OptionModel+CoreDataProperties.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData


extension OptionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OptionModel> {
        return NSFetchRequest<OptionModel>(entityName: "OptionModel")
    }

    @NSManaged public var isImage: Bool
    @NSManaged public var value: String?
    @NSManaged public var isRight: Bool

}

extension OptionModel : Identifiable {

}
