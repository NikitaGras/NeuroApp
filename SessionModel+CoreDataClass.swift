//
//  SessionModel+CoreDataClass.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.01.2022.
//
//

import Foundation
import CoreData

@objc(SessionModel)
public class SessionModel: NSManagedObject {
    func getPartOneAnswers() -> [PartOneAnswer] {
        guard let models = self.partOne else {
            return []
        }
        let answers = models.compactMap { model in
            return try? PartOneAnswer.init(from: model)
        }
        return answers
    }
    
    func getPaerTwoAnswers() -> [PartTwoAnswer] {
        guard let models = self.partTwo else {
            return []
        }
        let answers = models.compactMap { model in
            return try? PartTwoAnswer.init(from: model)
        }
        return answers
    }
}
