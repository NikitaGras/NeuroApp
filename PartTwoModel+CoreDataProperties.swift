//
//  PartTwoModel+CoreDataProperties.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData


extension PartTwoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PartTwoModel> {
        return NSFetchRequest<PartTwoModel>(entityName: "PartTwoModel")
    }

    @NSManaged public var questionText: String?
    @NSManaged public var responseTime: Double
    @NSManaged public var option: OptionModel?

}

extension PartTwoModel : Identifiable {

}
