//
//  QuizPartTwoQuizPartTwoViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartTwoViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func show(imageOptions: [ImageOption])
    func show(stringOptions: [StringOption])
    func show(question: PartTwoQuestion)
    
    func setupProgressBar(viewsNumber: Int, currentIndex: Int, startValue: Int)
    func moveProgressBar()
}
