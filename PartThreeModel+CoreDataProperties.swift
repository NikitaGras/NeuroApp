//
//  PartThreeModel+CoreDataProperties.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData


extension PartThreeModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PartThreeModel> {
        return NSFetchRequest<PartThreeModel>(entityName: "PartThreeModel")
    }

    @NSManaged public var questionText: String?
    @NSManaged public var userText: String?
    @NSManaged public var ganningGoq: Double

}

extension PartThreeModel : Identifiable {

}
