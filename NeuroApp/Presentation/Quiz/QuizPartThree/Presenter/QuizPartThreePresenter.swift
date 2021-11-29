//
//  QuizPartThreeQuizPartThreePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class QuizPartThreePresenter: QuizPartThreeModuleInput, QuizPartThreeViewOutput, QuizPartThreeInteractorOutput {
    weak var view: QuizPartThreeViewInput!
    var interactor: QuizPartThreeInteractorInput!
    var router: QuizPartThreeRouterInput!

    var userText: String = ""
    
    func viewIsReady() {
        view.setupInitialState()
        showQuestion()
    }
    
    func save(userText: String) {
        self.userText = userText
        let maxCharNumber = 49
        if userText.count <= maxCharNumber {
            let error = ValidationError.custom(String.ValidationError.shortAnswer)
            view.show(error)
        } else {
            interactor.getGunningFoqIndex(for: userText)
        }
    }
    
    func save(with gunningFog: Double) {
        do {
            let value = calculateIntoPercent(gunningFog)
            let answer = PartThreeAnswer(userText: userText, value: value)
            try interactor.save(answer: answer)
            router.showResultScreen()
        } catch {
            view.show(error)
        }
    }
    
    func denied(with error: Error) {
        view.show(error)
    }
    
    func showQuestion() {
        let question = interactor.getQuestion()
        view.show(question: question)
    }
    
    func calculateIntoPercent(_ gunningFogIndex: Double) -> Double {
        return atan(gunningFogIndex) * 100.0 / (Double.pi / 2)
    }
}
