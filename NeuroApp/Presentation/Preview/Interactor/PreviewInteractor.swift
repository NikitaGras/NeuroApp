//
//  PreviewPreviewInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewInteractor: PreviewInteractorInput, QuizObserver {
    weak var output: PreviewInteractorOutput!
    var service: QuizService!
    var quizState: QuestionnaireState {
        return service.quiz.state
    }
    
    func update(with quiz: Quiz) {
        output.update(with: quiz)
    }
    
    func registerObserver() {
        service.register(self)
    }
}
