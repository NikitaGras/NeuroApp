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
    var history = [Session]()
    var quiz: Quiz
    
    private var context: NSManagedObjectContext = {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }()
    
    private init() {
        quiz = Quiz()
        setupInitialState()
    }
    
    func setupInitialState() {
        self.quiz = fetchQuiz()
        history = fetchHistory()
    }
    
    func fetchQuiz() -> Quiz {
        return Quiz()
    }
    
    func save(_ partOneAnswer: PartOneAnswer) throws {
        quiz.partOneAnswers.append(partOneAnswer)
    }
    
    func save(_ partTwoAnswer: PartTwoAnswer) throws {
        quiz.partTwoAnswers.append(partTwoAnswer)
    }
    
    func save(_ partThreeAnswer: PartThreeAnswer) throws {
        quiz.partThreeAnswer = partThreeAnswer
        saveQuizSession()
    }
    
    func saveQuizSession() {
        if let partThreeAnswer = quiz.partThreeAnswer {
            let finishTime = Date()
            let session = Session(partOneAnswers: quiz.partOneAnswers,
                                partTwoAnswers: quiz.partTwoAnswers,
                                partThreeAnswer: partThreeAnswer,
                                finishTime: finishTime)
            self.saveToCoreData(session)
            notifyObservers()
            notifyObservers(with: quiz)
        }
    }
    
    func startNewQuiz() {
        self.quiz = Quiz()
        notifyObservers()
    }
    
    func deleteHistory() {
        history = []
    }
    
    //MARK: - Observer
    // TODO: вынести 
    func notifyObservers() {
        observers.forEach { weakBox in
            weakBox.object?.update(with: quiz)
            weakBox.object?.update(with: history)
        }
    }
    
    func didRegister(observer: Observer) {
        observer.update(with: quiz)
    }
    
    //MARK: - Core Data
    
    func fetchHistory() -> [Session] {
        guard let models = try? context.fetch(SessionModel.fetchRequest()) else {
            return []
        }
        let history = models.compactMap { model in
            return createSession(from: model)
        }
        return history
    }
    
    //TODO: throws
    func saveToCoreData(_ session: Session) {
        let model = SessionModel(context: context)
        model.partOne = createPartOneModels(from: session.partOneAnswers)
        model.partTwo = createPartTwoModels(from: session.partTwoAnswers)
        model.partThree = createPartThreeModel(from: session.partThreeAnswer)
        model.date = session.finishTime
        
        do {
            try context.save()
            var session = session
            session.sessionModel = model
            history.append(session)
        } catch {
            return
        }
    }
    
    func delete(_ session: Session) {
        if let model = session.sessionModel {
            context.delete(model)
            //TODO: try context.save()
        }
        history.removeAll {  $0.finishTime == session.finishTime }
    }
    
    //MARK: Support fetch function
    func createSession(from model: SessionModel) -> Session? {
        guard let partThree = createPartThreeAnswer(from: model),
              let finishTime = model.date else {
            return nil
        }
        let partOne = createPartOneAnswers(from: model)
        let partTwo = createPartTwoAnswers(from: model)
        
        return Session(partOneAnswers: partOne,
                       partTwoAnswers: partTwo,
                       partThreeAnswer: partThree,
                       finishTime: finishTime)
    }
    
    func createPartOneAnswers(from model: SessionModel) -> [PartOneAnswer] {
        guard let models = model.partOne else {
            return []
        }
        let answers = models.compactMap { model in
            return createPartOneAnswer(from: model)
        }
        return answers
    }
    
    func createPartOneAnswer(from model: PartOneModel) -> PartOneAnswer? {
        guard let question = model.questionText else {
            return nil
        }
        return PartOneAnswer(questionText: question, value: Int(model.value))
    }
    
    func createPartTwoAnswers(from model: SessionModel) -> [PartTwoAnswer] {
        guard let models = model.partTwo else {
            return []
        }
        let answers = models.compactMap { model in
            return createPartTwoAnswer(from: model)
        }
        return answers
    }
    
    func createPartTwoAnswer(from model: PartTwoModel) -> PartTwoAnswer? {
        guard let question = model.questionText,
              let optionModel = model.option,
              let value = optionModel.value else {
                  return nil
              }
        let option: Option = optionModel.isImage ? ImageOption(value: value, isRight: optionModel.isRight) : StringOption(value: value, isRight: optionModel.isRight)
        return PartTwoAnswer(questionText: question, option: option, responseTime: model.responseTime)
    }
    
    func createPartThreeAnswer(from model: SessionModel) -> PartThreeAnswer? {
        guard let question = model.partThree?.questionText,
              let userText = model.partThree?.userText,
              let value = model.partThree?.value else {
                  return nil
              }
        return PartThreeAnswer(question: question, userText: userText, value: value)
    }
    
    //MARK: Support save functions
    func createPartOneModels(from answers: [PartOneAnswer]) -> [PartOneModel] {
        var models = [PartOneModel]()
        answers.forEach { answer in
            let model = PartOneModel(context: context)
            model.questionText = answer.questionText
            model.value = Int32(answer.value)
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
            models.append(model)
        }
        return models
    }
    
    func createOptionModel(from option: Option) -> OptionModel {
        let model = OptionModel(context: context)
        model.isImage = option is ImageOption
        model.value = option.value
        model.isRight = option.isRight
        return model
    }
    
    func createPartThreeModel(from answer: PartThreeAnswer) -> PartThreeModel {
        let model = PartThreeModel(context: context)
        model.questionText = answer.question
        model.userText = answer.userText
        model.value = answer.value
        return model
    }
    
}
