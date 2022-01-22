//
//  SessionModel+CoreDataProperties.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData


extension SessionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionModel> {
        return NSFetchRequest<SessionModel>(entityName: "SessionModel")
    }
    
    @NSManaged public var finishTime: Date?
    @NSManaged public var partOne: [PartOneModel]?
    @NSManaged public var partTwo: [PartTwoModel]?
    @NSManaged public var partThree: PartThreeModel?

}

extension SessionModel : Identifiable {

}
