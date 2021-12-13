//
//  QuizPartThreeQuizPartThreeViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartThreeViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func show(question: PartThreeQuestion)
    func setupNextButon(isEnabler: Bool)
    func setupProgressBar()
    func fillProgressBar()
}
