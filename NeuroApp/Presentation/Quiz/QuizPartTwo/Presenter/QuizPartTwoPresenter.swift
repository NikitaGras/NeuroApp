//
//  QuizPartTwoQuizPartTwoPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class QuizPartTwoPresenter: QuizPartTwoModuleInput, QuizPartTwoViewOutput, QuizPartTwoInteractorOutput {
    weak var view: QuizPartTwoViewInput!
    var interactor: QuizPartTwoInteractorInput!
    var router: QuizPartTwoRouterInput!

    func viewIsReady() {

    }
    
    func save(_ answer: PartTwoAnswer) {
        
    }
}
