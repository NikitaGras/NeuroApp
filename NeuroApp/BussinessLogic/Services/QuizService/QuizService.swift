//
//  QuizService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import UIKit
import CoreData

class QuizService: QuizServiceProtocol {
    static let shared = QuizService()
    
    var observers = [WeakBox<Observer>]()
    var context: NSManagedObjectContext = {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }()
    
    var history = [Session]()
    var quiz = Quiz()
    
    private init() {
        history = fetchHistory()
        notifyObservers(with: history)
    }
    
    func fetchHistory() -> [Session] {
        do {
            let models = try context.fetch(SessionModel.fetchRequest())
            return try models.map { try Session(model: $0) }
        } catch {
            print(error)
            return []
        }
    }
    
    func startNewQuiz() {
        self.quiz = Quiz()
        notifyObservers(with: quiz)
    }
    
    func deleteHistory() throws {
        guard let coordinator = context.persistentStoreCoordinator else {
            throw SystemError.default
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SessionModel")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try coordinator.execute(deleteRequest, with: context)
        history = []
    }
    
    func save(_ partOneAnswer: PartOneAnswer) {
        quiz.partOneAnswers.append(partOneAnswer)
        notifyObservers(with: quiz)
    }
    
    func save(_ partTwoAnswer: PartTwoAnswer) {
        quiz.partTwoAnswers.append(partTwoAnswer)
        notifyObservers(with: quiz)
    }
    
    func save(_ partThreeAnswer: PartThreeAnswer) throws {
        quiz.partThreeAnswer = partThreeAnswer
        
        let session = try Session(quiz: quiz)
        try save(session)
        
        notifyObservers(with: quiz)
    }
    
    func save(_ session: Session) throws {
        let model = SessionModel(context: context)
        
        model.partOne = session.partOneAnswers.map { PartOneModel.init(answer: $0)}
        model.partTwo = session.partTwoAnswers.map { PartTwoModel.init(answer: $0)}
        model.partThree = PartThreeModel(answer: session.partThreeAnswer)
        model.finishTime = session.finishTime
        
        try context.save()
        
        var session = session
        session.sessionModel = model
        history.append(session)
        
        notifyObservers(with: history)
    }
    
    func didRegister(observer: Observer) {
        observer.update(with: history)
    }
}
