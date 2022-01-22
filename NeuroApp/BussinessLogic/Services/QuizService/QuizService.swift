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
        do {
            try coordinator.execute(deleteRequest, with: context)
            history = []
        } catch {
            throw error
        }
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
        do {
            let session = try Session(quiz: quiz)
            try save(session)
            notifyObservers(with: quiz)
            notifyObservers(with: history)
        } catch {
            throw error
        }
    }
    
    //MARK: - Core Data
    func fetchHistory() -> [Session] {
        do {
            let models = try context.fetch(SessionModel.fetchRequest())
            return models.compactMap { model in
                return Session(sessionModel: model)
            }
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ session: Session) throws {
        let model = SessionModel(context: context)
        model.partOne = createPartOneModels(from: session.partOneAnswers)
        model.partTwo = createPartTwoModels(from: session.partTwoAnswers)
        model.partThree = createPartThreeModel(from: session.partThreeAnswer)
        model.finishTime = session.finishTime
        
        do {
            try context.save()
            var session = session
            session.sessionModel = model
            history.append(session)
        } catch {
            throw error
        }
    }
    
    //MARK: - Support save functions
    func createPartOneModels(from answers: [PartOneAnswer]) -> [PartOneModel] {
        var models = [PartOneModel]()
        answers.forEach { answer in
            let model = PartOneModel(context: context)
            model.questionText = answer.questionText
            model.value = Int32(answer.value)
            
            try! context.save()
            
            models.append(model)
        }
        return models
    }
    
    func createPartTwoModels(from answers: [PartTwoAnswer]) -> [PartTwoModel] {
        var models = [PartTwoModel]()
        answers.forEach { answer in
            let model = PartTwoModel(context: context)
            model.questionText = answer.questionText
            model.option = createOptionModel(from: answer.option)
            model.responseTime = answer.responseTime
            
            try! context.save()
            
            models.append(model)
        }
        return models
    }
    
    func createOptionModel(from option: Option) -> OptionModel {
        let model = OptionModel(context: context)
        model.isImage = option is ImageOption
        model.value = option.value
        model.isRight = option.isRight
        try! context.save()
        
        return model
    }
    
    func createPartThreeModel(from answer: PartThreeAnswer) -> PartThreeModel {
        let model = PartThreeModel(context: context)
        model.questionText = answer.question
        model.userText = answer.userText
        model.ganningGoq = answer.ganningFoq
        try! context.save()
        
        return model
    }
    
}
