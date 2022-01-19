//
//  PartOneModel+CoreDataProperties.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData


extension PartOneModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PartOneModel> {
        return NSFetchRequest<PartOneModel>(entityName: "PartOneModel")
    }

    @NSManaged public var questionText: String?
    @NSManaged public var value: Int32

}

extension PartOneModel : Identifiable {

}
