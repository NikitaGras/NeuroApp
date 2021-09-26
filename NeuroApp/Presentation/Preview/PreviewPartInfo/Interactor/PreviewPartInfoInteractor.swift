//
//  PreviewPartInfoPreviewPartInfoInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class PreviewPartInfoInteractor: PreviewPartInfoInteractorInput {
    weak var output: PreviewPartInfoInteractorOutput!
    var service: QuizServiceProtocol!
    
    func getQuizState() -> Quiz.State {
        return service.quiz.state
    }
}
