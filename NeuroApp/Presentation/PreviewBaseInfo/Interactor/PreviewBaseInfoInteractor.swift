//
//  PreviewBaseInfoPreviewBaseInfoInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewBaseInfoInteractor: PreviewBaseInfoInteractorInput {
    weak var output: PreviewBaseInfoInteractorOutput!
    var service: QuizServiceProtocol!
    
    func changeQuizStateToProceed() {
        service.changeQuiz(with: .partOneProceed)
    }
    
    func getQuizState() -> Quiz.State {
        return service.quiz.state
    }
}
