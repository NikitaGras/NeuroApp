//
//  SessionModel+CoreDataClass.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//
//

import Foundation
import CoreData

@objc(SessionModel)
public class SessionModel: NSManagedObject, Identifiable {
    @NSManaged public var partOne: [PartOneModel]?
    @NSManaged public var partTwo: [PartTwoModel]?
    @NSManaged public var partThree: PartThreeModel?
    @NSManaged public var finishTime: Date?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionModel> {
        return NSFetchRequest<SessionModel>(entityName: "SessionModel")
    }
}
